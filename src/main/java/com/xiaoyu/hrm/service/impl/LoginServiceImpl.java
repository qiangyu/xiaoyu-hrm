package com.xiaoyu.hrm.service.impl;

import com.alibaba.fastjson.JSON;
import com.xiaoyu.hrm.mapper.IUserMapper;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.User;
import com.xiaoyu.hrm.service.ILoginService;
import com.xiaoyu.hrm.utils.JedisUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.UUID;

/**
 * 用户登录
 *
 * @author xiaoyu
 * @date 2020/3/18 17:12
 */
@Service
public class LoginServiceImpl implements ILoginService {

    /**
     * 调用登录的mapper层
     */
    @Autowired
    private IUserMapper userMapper;

    /**
     * 操作redis
     */
    @Autowired
    private JedisUtil jedisUtil;

    private final static Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);

    /**
     * 存储用户信息key的前缀
     */
    @Value("${XIAOYU_USER}")
    private String XIAOYU_USER;

    /**
     * 根据账号查询用户信息
     * 目前没有注册模块，无法对密码进行加密
     *
     * @param loginname
     * @return
     */
    @Override
    public ResultBean findUserByName(String loginname, String password) {
        if (loginname == null || password == null) {
            return ResultBean.error("用户名或者账号不能为空！");
        }
        List<User> list = userMapper.findUserByName(loginname);
        if (list == null || list.size() != 1) {
            return ResultBean.error("账号异常，请联系管理员！");
        }
        User user = list.get(0);
        if (!user.getPassword().equals(password)) {
            return ResultBean.error("用户名或者账号错误！");
        }
        // 设置密码为空
        user.setPassword(null);
        // 把用户信息存入到redis，用于身份认证
        try {
            UUID uuid = UUID.randomUUID();
            // 生成token
            String token = XIAOYU_USER + ":" + uuid;
            String jsonUSer = JSON.toJSONString(user);
            // 设置过期时间 半小时
            String set = jedisUtil.set(token, jsonUSer, 3600);
            if (!StringUtils.isEmpty(set)) {
                user.setToken(token);
                return ResultBean.ok("登录成功！", user);
            }
        } catch (Exception e) {
            logger.error("用户登录时存储token异常：user{}", user, e);
            e.printStackTrace();
        }
        return ResultBean.error("登录错误，请重试！");
    }

}