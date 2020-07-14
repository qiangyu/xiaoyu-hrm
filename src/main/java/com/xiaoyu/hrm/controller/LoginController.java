package com.xiaoyu.hrm.controller;

import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.service.ILoginService;
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
@RequestMapping("/hrm/user")
public class LoginController {

    /**
     * 调用登录服务层
     */
    @Autowired
    private ILoginService loginService;

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
    public ResultBean login(String loginname, String password) {
        return loginService.findUserByLoginNameAndPassword(loginname, password);
    }

    /**
     * 用户注销
     * @return
     */
    @GetMapping("/logout")
    public ResultBean logout(HttpServletRequest request) {
        String token = request.getHeader("token");
        try {
            if (!StringUtils.isEmpty(token)) {
                jedisUtil.del(token);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResultBean.ok();
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