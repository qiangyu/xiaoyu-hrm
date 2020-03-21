package com.xiaoyu.hrm.service;

import com.alibaba.fastjson.JSON;
import com.xiaoyu.hrm.mapper.IUserMapper;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.User;
import com.xiaoyu.hrm.utils.JedisUtil;
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
public class LoginService {

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
    public ResultBean findUserByName(String loginname, String password, String token) {
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
            if (StringUtils.isEmpty(token)) {
                UUID uuid = UUID.randomUUID();
                // 生成token
                token = XIAOYU_USER + ":" + uuid;
                String jsonUSer = JSON.toJSONString(user);
                // 设置过期时间 半小时
                jedisUtil.set(token, jsonUSer, 3600);
                user.setToken(token);
            }
            return ResultBean.ok("登录成功！", user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResultBean.error("登录错误，请重试！");
    }

}