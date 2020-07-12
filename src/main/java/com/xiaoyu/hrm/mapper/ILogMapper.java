package com.xiaoyu.hrm.mapper;

import com.xiaoyu.hrm.pojo.LogLogin;

/**
 * 日志
 *
 * @author xiaoyu
 * @date 2020/7/12 18:08
 */
public interface ILogMapper {

    /**
     * 插入日志
     * @param logLogin 信息
     * @return
     */
    int insertLogLogin(LogLogin logLogin);

}
