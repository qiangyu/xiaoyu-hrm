package com.xiaoyu.hrm.controller;

import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.User;
import com.xiaoyu.hrm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


/**
 * 处理关于用户的请求
 * 
 * @author xiaoyu
 * @date 2020/3/19 16:04
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    /**
     * 处理前端传递过来查询用户的请求
     * 根据页数以及条件查询用户信息
     * @param page 页码
     * @param size 每页行数
     * @param user 根据用户名以及用户状态查询用户信息
     * @return 返回用户信息
     */
    @GetMapping("/basic")
    public ResultBean getAllUser(@RequestParam(defaultValue = "1") Integer page,
                                 @RequestParam(defaultValue = "10") Integer size,
                                 User user) {
        return userService.findUserByPage(page, size, user);
    }

    /**
     * 根据账号查询用户信息
     * @param request request
     * @return 返回用户信息
     */
    @GetMapping("/info")
    public ResultBean showUserInfo(HttpServletRequest request) {
        // 从request获取用户信息
        return ResultBean.ok(request.getAttribute("user"));
    }

    /**
     * 新增用户
     * @param user 用户信息
     * @return 返回注册结果
     */
    @PostMapping("/basic")
    public ResultBean powerAddUser(@RequestBody User user) {
        return userService.addUser(user);
    }

    /**
     * 根据用户 id 删除用户
     * @param user 用户信息
     * @return 返回删除用户结果
     */
    @DeleteMapping("/basic")
    public ResultBean powerDeleteUser(@RequestBody User user) {
        return userService.deleteUser(user);
    }

    /**
     * 修改用户信息
     * @param user 用户信息
     * @return 返回修改结果
     */
    @PutMapping("/basic")
    public ResultBean powerUpdateUser(@RequestBody User user, HttpServletRequest request) {
        // 从请求头获取 token
        String token = request.getHeader("token");
        return userService.updateUser(user, token);
    }

}
