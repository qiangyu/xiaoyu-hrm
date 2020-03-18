package com.xiaoyu.hrm.controller;

import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.User;
import com.xiaoyu.hrm.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 登录
 * 
 * @author xiaoyu
 * @date 2020/3/17 23:17
 */
@RestController
public class LoginController {

    /**
     * 调用登录服务层
     */
    @Autowired
    private LoginService loginService;

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
    @PostMapping("/doLogin")
    public ResultBean login(@RequestParam("username") String loginname, String password,
                            HttpSession session) {
        // 调用服务层，获取到用户信息
        ResultBean result = loginService.findUserByName(loginname, password);
        User user = (User) result.getObj();
        // 把用户信息存入到session域，用于身份认证
        session.setAttribute("isUser", user);
        return loginService.findUserByName(loginname, password);
    }

}
