package com.xiaoyu.hrm.controller;

import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.User;
import com.xiaoyu.hrm.service.LoginService;
import com.xiaoyu.hrm.utils.JedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 登录
 * 
 * @author xiaoyu
 * @date 2020/3/17 23:17
 */
@RestController
@RequestMapping("/user")
public class LoginController {

    /**
     * 调用登录服务层
     */
    @Autowired
    private LoginService loginService;

    @Autowired
    private JedisUtil jedisUtil;

    @Value("${XIAOYU_USER}")
    private String XIAOYU_USER;

    @GetMapping("/login")
    public ResultBean login() {
        return ResultBean.error("尚未登录，请登录!");
    }

    /**
     * 处理登录
     * @param loginname 用户账号
     * @param password 密码
     * @return 返回账号信息
     * @throws IOException
     */
    @PostMapping(value = "/doLogin")
    public ResultBean login(String loginname, String password, HttpServletRequest request) {
        User user = (User) request.getAttribute("user");
        if (user == null) {
            // 调用服务层，获取到用户信息
            return loginService.findUserByName(loginname, password, null);
        }
        String token = request.getHeader("token");
        // 调用服务层，获取到用户信息
        return loginService.findUserByName(loginname, password, token);
    }

    /**
     * 用户注销
     * @return
     */
    @GetMapping("/logout")
    public ResultBean logout(String token) {
        try {
            if (!StringUtils.isEmpty(token)) {
                jedisUtil.del(token);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResultBean.ok("注销成功！");
    }

    /**
     * 验证用户身份失败，跳转至此请求
     * @return
     */
    @RequestMapping("/error")
    public ResultBean error() {
        return ResultBean.loginError("登录失效，请重新登录！");
    }

}