package com.xiaoyu.hrm.controller;

import com.xiaoyu.hrm.annotation.PowerAnnotation;
import com.xiaoyu.hrm.pojo.LogLogin;
import com.xiaoyu.hrm.pojo.LogOperating;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.service.ILogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 处理关于日志的请求
 *
 * @author xiaoyu
 * @date 2020/3/19 16:04
 */
@RestController
@RequestMapping("/log")
public class LogController {

    @Autowired
    private ILogService logService;

    /**
     * 处理前端传递过来查询 登陆 日志的请求
     * 根据页数以及条件查询 登陆 日志信息
     *
     * @param page 页码
     * @param size 每页行数
     * @param log 根据该条件查询 登陆 日志信息
     * @return 返回 登陆 日志信息
     */
    @GetMapping("/login")
    @PowerAnnotation
    public ResultBean findAllLogLogin(@RequestParam(defaultValue = "1") Integer page,
                                 @RequestParam(defaultValue = "10") Integer size,
                                 LogLogin log) {
        return logService.findLogByPage(page, size, log);
    }

    /**
     * 处理前端传递过来查询 操作 日志的请求
     * 根据页数以及条件查询 操作 日志信息
     *
     * @param page 页码
     * @param size 每页行数
     * @param log 根据该条件查询 操作 日志信息
     * @return 返回 操作 日志信息
     */
    @GetMapping("/operating")
    @PowerAnnotation
    public ResultBean findAllLogOperating(@RequestParam(defaultValue = "1") Integer page,
                                 @RequestParam(defaultValue = "10") Integer size,
                                 LogOperating log) {
        return logService.findLogByPage(page, size, log);
    }

}
