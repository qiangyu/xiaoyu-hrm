package com.xiaoyu.hrm.service.impl;

import com.xiaoyu.hrm.component.PowerAspect;
import com.xiaoyu.hrm.mapper.ILogMapper;
import com.xiaoyu.hrm.pojo.*;
import com.xiaoyu.hrm.service.ILogService;
import com.xiaoyu.hrm.utils.JedisUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * 管理日志的业务层
 *
 * @author xiaoyu
 * @date 2020/3/19 15:41
 */
@Service
public class LogServiceImpl implements ILogService {

    @Autowired
    private ILogMapper logMapper;

    /**
     * 操作redis
     */
    @Autowired
    private JedisUtil jedisUtil;

    /**
     * slf4j
     */
    private final static Logger logger = LoggerFactory.getLogger(PowerAspect.class);

    /**
     * 处理前端传递过来查询日志的请求
     * 根据页数以及条件查询日志信息
     *
     * @param page 页码
     * @param size 每页行数
     * @param log 根据该条件查询日志信息
     * @return 返回日志信息
     */
    @Override
    public ResultBean findLogByPage(Integer page, Integer size, Log log) {
        if (page == null || size == null) {
            return ResultBean.error("查询日志错误！");
        }

        String[] screenDate = log.getScreenDate();
        // 当由时间筛选时，需判断时间格式是否正确
        if (screenDate != null && screenDate.length == 2) {
            try {
                //给定日期格式
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                sdf.setLenient(false);

                sdf.parse(screenDate[0]);
                log.setBeginDate(screenDate[0]);

                sdf.parse(screenDate[1]);
                log.setEndDate(screenDate[1]);
            } catch (ParseException e) {
                e.printStackTrace();
                return ResultBean.error("筛选日期格式错误！");
            }
        }
        page = (page - 1) * size;
        List<?> list = null;
        Long total = null;
        // 登陆日志的
        if (log instanceof LogLogin) {
            list = logMapper.findLogLoginByPage(page, size, (LogLogin) log);
            total = logMapper.getLogLoginTotal((LogLogin) log);
        }
        // 操作日志的
        if (log instanceof LogOperating) {
            list = logMapper.findLogOperatingByPage(page, size, (LogOperating) log);
            total = logMapper.getLogOperatingTotal((LogOperating) log);
        }
        if (list == null || list.size() == 0 || total == null) {
            return ResultBean.error("查询不到日志信息！");
        }
        return ResultBean.ok(new ResultPageBean(list, total));
    }

}
