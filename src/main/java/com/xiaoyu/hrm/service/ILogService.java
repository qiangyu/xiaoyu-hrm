package com.xiaoyu.hrm.service;

import com.xiaoyu.hrm.pojo.Log;
import com.xiaoyu.hrm.pojo.ResultBean;

/**
 * 管理日志的业务层
 *
 * @author xiaoyu
 * @date 2020/3/26 14:30
 */
public interface ILogService {

    /**
     * 处理前端传递过来查询日志的请求
     * 根据页数以及条件查询日志信息
     *
     * @param page 页码
     * @param size 每页行数
     * @param log 根据该条件查询日志信息
     * @return 返回日志信息
     */
    ResultBean findLogByPage(Integer page, Integer size, Log log);

}
