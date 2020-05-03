package com.xiaoyu.hrm.service;

import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.User;

/**
 * 管理用户的业务层
 *
 * @author xiaoyu
 * @date 2020/3/26 14:30
 */
public interface IUserService {

    /**
     * 根据页数以及条件查询用户信息
     *
     * @param page 页码
     * @param size 每页行数
     * @param user 根据用户名以及用户状态查询用户信息
     * @return 返回用户信息
     */
    ResultBean findUserByPage(Integer page, Integer size, User user);

    /**
     * 新增用户
     *
     * @param user 用户信息
     * @return 返回注册结果
     */
    ResultBean addUser(User user);

    /**
     * 根据用户 id 删除用户
     *
     * @param user 用户信息
     * @return 返回删除用户结果
     */
    ResultBean deleteUser(User user);

    /**
     * 修改用户信息
     * @param user 用户信息
     * @param token token
     * @return 返回修改结果
     */
    ResultBean updateUser(User user, String token);



}
