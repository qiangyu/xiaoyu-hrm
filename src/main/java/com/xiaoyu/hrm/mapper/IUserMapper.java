package com.xiaoyu.hrm.mapper;

import com.xiaoyu.hrm.pojo.User;

import java.util.List;

/**
 * 查询用户信息
 *
 * @author xiaoyu
 * @date 2020/3/18 23:47
 */
public interface IUserMapper {

    /**
     * 根据账号查询用户信息
     * @param loginname
     * @return
     */
    List<User> findUserByName(String loginname);

}
