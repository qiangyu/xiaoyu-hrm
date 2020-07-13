package com.xiaoyu.hrm.pojo;


/**
 * 日志的父类
 *
 * @author xiaoyu
 * @date 2020/7/13 14:27
 */
public class Log {

    /**
     * 筛选条件
     */
    private String[] screenDate;
    /**
     * 由screenDate处理成 beginDate、endDate
     */
    private String beginDate;
    private String endDate;

    public String[] getScreenDate() {
        return screenDate;
    }

    public void setScreenDate(String[] screenDate) {
        this.screenDate = screenDate;
    }

    public String getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
