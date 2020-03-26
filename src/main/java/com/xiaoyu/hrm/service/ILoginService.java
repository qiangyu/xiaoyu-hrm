package com.xiaoyu.hrm.service;

import com.xiaoyu.hrm.pojo.ResultBean;

/**
 * 用户登录
 *
 * @author xiaoyu
 * @date 2020/3/26 14:23
 */
public interface ILoginService {

    /**
     * 根据账号查询用户信息
     * 目前没有注册模块，无法对密码进行加密
     *
     * @param loginname
     * @return
     */
    ResultBean findUserByName(String loginname, String password);

}
