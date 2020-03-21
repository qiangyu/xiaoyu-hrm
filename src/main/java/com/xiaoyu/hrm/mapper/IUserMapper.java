package com.xiaoyu.hrm.mapper;

import com.xiaoyu.hrm.pojo.User;
import org.apache.ibatis.annotations.*;

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

    /**
     * 根据页数以及条件查询用户信息
     * @param page 从page开始查询
     * @param size 每次查询size个
     * @param user 根据用户名以及用户状态查询用户信息
     * @return 返回用户信息
     */
    List<User> findUserByPage(@Param("page") Integer page,
                              @Param("size") Integer size,
                              @Param("user") User user);

    /**
     * 根据条件 user 查询符合条件的条数
     * @param user 条件
     * @return 返回符合条件的条数
     */
    Long getTotal(@Param("user") User user);

    /**
     * 新增用户
     * @param user 用户信息
     * @return 返回数据库对应的 id 主键
     */
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    @Insert("insert into user_inf(loginname, password, status, createdate, username) values(#{loginname}, #{password}, #{status}, #{createdate}, #{username}) ")
    int insertUser(User user);

    /**
     * 根据用户 id 删除用户
     * @param id 用户id
     * @return
     */
    @Delete("delete from user_inf where id = #{id}")
    int deleteUserById(Integer id);

    /**
     * 修改用户信息
     * @param user 用户信息
     * @return
     */
    int updateUser(@Param("user") User user);
    /**
     * UPDATE user_inf u
     *          SET u.loginname = #{user.loginname}, u.password = #{user.password}, u.status = #{user.status}, u.createdate = #{user.createdate}, u.username = #{user.username}
     *          where u.id = #{id}
     */
}
