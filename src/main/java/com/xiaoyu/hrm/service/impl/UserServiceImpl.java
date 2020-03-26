package com.xiaoyu.hrm.service.impl;

import com.xiaoyu.hrm.mapper.IUserMapper;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.ResultPageBean;
import com.xiaoyu.hrm.pojo.User;
import com.xiaoyu.hrm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
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
        return ResultBean.ok("查询用户成功！", new ResultPageBean(list, total));
    }

    /**
     * 新增用户
     *
     * @param user 用户信息
     * @return 返回注册结果
     */
    @Override
    public ResultBean addUser(User user) {
        if (!StringUtils.isEmpty(user.getId())) {
            return ResultBean.error("添加用户异常！");
        }
        if (StringUtils.isEmpty(user.getLoginname()) || StringUtils.isEmpty(user.getPassword())) {
            return ResultBean.error("用户名或密码为空！");
        }
        List<User> list = userMapper.findUserByName(user.getLoginname());
        if (list == null || list.size() > 0) {
            return ResultBean.error("用户名已被注册！");
        }

        // 校验成功，补全数据
        // 没指定注册的通通为普通用户
        if (user.getStatus() == null || user.getStatus() != 2) {
            user.setStatus(1);
        }
        user.setCreatedate(new Date());
        // 将密码加密
        String md5Password = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());
        user.setPassword(md5Password);
        // 插入数据
        userMapper.insertUser(user);
        // 返回注册结果
        return ResultBean.ok("注册成功！");
    }

    /**
     * 根据用户 id 删除用户
     *
     * @param id 用户id
     * @return 返回删除用户结果
     */
    @Override
    public ResultBean deleteUser(Integer id) {
        if (StringUtils.isEmpty(id)) {
            return ResultBean.error("删除错误！");
        }
        // 进行删除用户， 返回影响的行数
        int i = userMapper.deleteUserById(id);
        // 若影响的行数不等于 1 ，则是错误的请求
        if (i != 1) {
            return ResultBean.error("错误的请求，用户不存在！");
        }
        return ResultBean.ok("删除用户成功！");
    }

    /**
     * 修改用户信息
     * @param user 用户信息
     * @return 返回修改结果
     */
    @Override
    public ResultBean updateUser(User user) {
        if (StringUtils.isEmpty(user.getId())) {
            return ResultBean.error("修改异常！");
        }
        if (StringUtils.isEmpty(user.getUsername())) {
            return ResultBean.error("修改异常！");
        }
        if (StringUtils.isEmpty(user.getLoginname())) {
            return ResultBean.error("修改异常！");
        }
        if (StringUtils.isEmpty(user.getPassword())) {
            return ResultBean.error("修改异常！");
        }
        if (StringUtils.isEmpty(user.getCreatedate())) {
            return ResultBean.error("修改异常！");
        }
        if (StringUtils.isEmpty(user.getStatus())) {
            return ResultBean.error("修改异常！");
        }
        // 先查询是否有该用户
        List<User> list = userMapper.findUserByName(user.getLoginname());
        if (list == null || list.size() != 1) {
            return ResultBean.error("修改异常，没有该用户！");
        }
        userMapper.updateUser(user);
        return ResultBean.ok("修改成功！");
    }

}
