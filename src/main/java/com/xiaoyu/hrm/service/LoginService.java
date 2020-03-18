package com.xiaoyu.hrm.service;

import com.xiaoyu.hrm.mapper.IUserMapper;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
     * 根据账号查询用户信息
     * 目前没有注册模块，无法对密码进行加密
     *
     * @param loginname
     * @return
     */
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
        return ResultBean.ok("登录成功!", user);
    }

}
