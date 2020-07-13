package com.xiaoyu.hrm.mapper;

import com.xiaoyu.hrm.pojo.LogLogin;
import com.xiaoyu.hrm.pojo.LogOperating;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 查询日志信息
 *
 * @author xiaoyu
 * @date 2020/3/18 23:47
 */
public interface ILogMapper {

    /**
     * 插入登陆日志
     * @param logLogin 信息
     * @return
     */
    int insertLogLogin(LogLogin logLogin);

    /**
     * 插入操作日志
     * @param logOperating 信息
     * @return
     */
    int insertLogOperating(LogOperating logOperating);

    /**
     * 处理前端传递过来查询登陆日志的请求
     * 根据页数以及条件查询登陆日志信息
     *
     * @param page 页码
     * @param size 每页行数
     * @param log 根据该条件查询登陆日志信息
     * @return 返回登陆日志信息
     */
    List<LogLogin> findLogLoginByPage(@Param("page") Integer page,
                                      @Param("size") Integer size,
                                      @Param("log")LogLogin log);

    /**
     * 根据条件 查询符合条件的条数
     *
     * @param log 条件
     * @return 返回符合条件的条数
     */
    Long getLogLoginTotal(@Param("log") LogLogin log);

    /**
     * 处理前端传递过来查询操作日志的请求
     * 根据页数以及条件查询操作日志信息
     *
     * @param page 页码
     * @param size 每页行数
     * @param log 根据该条件查询操作日志信息
     * @return 返回操作日志信息
     */
    List<LogOperating> findLogOperatingByPage(@Param("page") Integer page,
                                      @Param("size") Integer size,
                                      @Param("log")LogOperating log);

    /**
     * 根据条件 查询符合条件的条数
     *
     * @param log 条件
     * @return 返回符合条件的条数
     */
    Long getLogOperatingTotal(@Param("log") LogOperating log);
}
