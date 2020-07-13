package com.xiaoyu.hrm.service.impl;

import com.alibaba.fastjson.JSON;
import com.xiaoyu.hrm.component.PowerAspect;
import com.xiaoyu.hrm.mapper.IUserMapper;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.ResultPageBean;
import com.xiaoyu.hrm.pojo.User;
import com.xiaoyu.hrm.service.IUserService;
import com.xiaoyu.hrm.utils.JedisUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * 管理用户的业务层
 *
 * @author xiaoyu
 * @date 2020/3/19 15:41
 */
@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserMapper userMapper;

    /**
     * 操作redis
     */
    @Autowired
    private JedisUtil jedisUtil;

    /**
     * slf4j
     */
    private final static Logger logger = LoggerFactory.getLogger(PowerAspect.class);

    /**
     * 根据页数以及条件查询用户信息
     *
     * @param page 页码
     * @param size 每页行数
     * @param user 根据用户名以及用户状态查询用户信息
     * @return 返回用户信息
     */
    @Override
    public ResultBean findUserByPage(Integer page, Integer size, User user) {
        if (page == null || size == null) {
            return ResultBean.error("查询用户错误！");
        }
        page = (page - 1) * size;
        List<User> list = userMapper.findUserByPage(page, size, user);
        if (list == null || list.size() == 0) {
            return ResultBean.error("查询不到用户信息！");
        }
        Long total = userMapper.getTotal(user);
        return ResultBean.ok(new ResultPageBean(list, total));
    }

    /**
     * 新增用户
     *
     * @param user 用户信息
     * @return 返回注册结果
     */
    @Override
    public ResultBean insertUser(User user) {
        if (!StringUtils.isEmpty(user.getId())) {
            return ResultBean.error("添加用户异常！");
        }
        if (StringUtils.isEmpty(user.getLoginname()) || StringUtils.isEmpty(user.getPassword())) {
            return ResultBean.error("用户名或密码为空！");
        }
        User checkUser = userMapper.findUserByLoginName(user.getLoginname());
        if (checkUser != null) {
            return ResultBean.error("用户名已被注册！");
        }
        // 校验成功，补全数据
        // 没指定注册的通通为普通用户
        if (user.getStatus() == null || user.getStatus() != 2) {
            user.setStatus(1);
        }
        user.setCreatedate(new Date());
        // 将密码加密
//        String md5Password = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
//        user.setPassword(md5Password);
        // 插入数据
        userMapper.insertUser(user);
        // 返回注册结果
        return ResultBean.ok("注册成功！");
    }

    /**
     * 根据用户 id 删除用户
     *
     * @param user 用户信息
     * @return 返回删除用户结果
     */
    @Override
    public ResultBean deleteUser(User user) {
        if (user.getId() == null || StringUtils.isEmpty(user.getLoginname())) {
            return ResultBean.error("删除错误，缺少参数！");
        }
        // 进行删除用户， 返回影响的行数
        int i = userMapper.deleteUserById(user.getId());
        // 若影响的行数不等于 1 ，则是错误的请求
        if (i != 1) {
            return ResultBean.error("错误的请求，用户不存在！");
        }
        return ResultBean.ok("删除用户成功！");
    }

    /**
     * 修改用户信息，需要区分修改个人信息还是用户信息
     *
     * @param loginUserInfo  登陆用户信息
     * @param updateUserInfo 修改用户信息
     * @param token          token令牌
     * @return 返回修改结果
     */
    @Override
    public ResultBean updateUser(User loginUserInfo, User updateUserInfo, String token) {
        if (StringUtils.isEmpty(updateUserInfo.getLoginname())) {
            return ResultBean.error("修改异常！");
        }
        if ("".equals(updateUserInfo.getUsername())) {
            return ResultBean.error("修改异常！");
        }
        if ("".equals(updateUserInfo.getPassword())) {
            return ResultBean.error("修改异常！");
        }
        if ("".equals(updateUserInfo.getNewPassword())) {
            return ResultBean.error("修改异常！");
        }
        /**
         * 判断权限：用户登陆名相同，表示是修改个人信息，取反放行
         *         操作作用户的权限为管理员（2），被修改用户权限不高于管理员，表示可以修改权限比自己低的用户，取反放行
         *         操作用户的权限为（3），开发者权限，不做拦截，取反放行
         */
        if (!(loginUserInfo.getStatus() == 2 && loginUserInfo.getStatus() > updateUserInfo.getStatus())) {
            if (!loginUserInfo.getLoginname().equals(updateUserInfo.getLoginname()) && loginUserInfo.getStatus() != 3) {
                return ResultBean.loginError("拦截到您没有权限操作！");
            }
        }
        // 当 password 与 newPassword 不为空时，该操作为修改密码
        if (!StringUtils.isEmpty(updateUserInfo.getPassword()) && !StringUtils.isEmpty(updateUserInfo.getNewPassword())) {
            // 根据登陆名查询用户信息，对旧密码进行比较
            User checkUser = userMapper.findUserByLoginName(updateUserInfo.getLoginname());
            if (checkUser == null) {
                return ResultBean.error("用户不存在！");
            }
            if (!checkUser.getPassword().equals(updateUserInfo.getPassword())) {
                return ResultBean.error("旧密码错误！");
            }
        }
        // 更新数据库信息
        int i = userMapper.updateUser(updateUserInfo);
        if (i != 1) {
            return ResultBean.ok("信息未修改！");
        }
        // 记录日志
        logger.info("拦截到用户：{} --> 操作：updateUser，操作信息：{} ~~~ 时间：{}", loginUserInfo.getLoginname(), updateUserInfo, new Date());
        // 如果是修改个人信息，之前想法是进行同步登陆缓存信息，现在直接让用户重新登陆(修改密码重新登陆)
        if (loginUserInfo.getLoginname().equals(updateUserInfo.getLoginname()) && StringUtils.isEmpty(updateUserInfo.getNewPassword())) {
            try {
                // 进行缓存同步，查询该用户信息设置在redis中
                updateUserInfo = userMapper.findUserByLoginName(updateUserInfo.getLoginname());
                String jsonUser = JSON.toJSONString(updateUserInfo);
                jedisUtil.set(token, jsonUser, 30);
            } catch (Exception e) {
                e.printStackTrace();
                logger.info("拦截到用户：{} --> 操作：updateUser，操作信息：{} ~~~ 但是同步缓存失败：{} ~~~ 时间：{}", loginUserInfo.getLoginname(), updateUserInfo, e.getMessage(), new Date());
                return ResultBean.loginError("未知原因导致个人信息不同步，请重新登陆！");
            }
        } else {
            // 表示修改密码，信息过期，重新登陆
            return ResultBean.loginError("信息过期，请重新登陆！");
        }
        return ResultBean.ok("修改信息成功！");
    }
}
