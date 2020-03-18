package com.xiaoyu.hrm.pojo;


/**
 * 业务处理完返回处理结果到前端的工具类
 *
 * @author xiaoyu
 * @date 2020/3/18 18:21
 */
public class ResultBean {
    private Integer status;
    private String msg;
    private Object obj;

    public static ResultBean build() {
        return new ResultBean();
    }

    public static ResultBean ok(String msg) {
        return new ResultBean(200, msg, null);
    }

    public static ResultBean ok(String msg, Object obj) {
        return new ResultBean(200, msg, obj);
    }

    public static ResultBean error(String msg) {
        return new ResultBean(500, msg, null);
    }

    public static ResultBean error(String msg, Object obj) {
        return new ResultBean(500, msg, obj);
    }

    private ResultBean() {
    }

    private ResultBean(Integer status, String msg, Object obj) {
        this.status = status;
        this.msg = msg;
        this.obj = obj;
    }

    public Integer getStatus() {
        return status;
    }

    public ResultBean setStatus(Integer status) {
        this.status = status;
        return this;
    }

    public String getMsg() {
        return msg;
    }

    public ResultBean setMsg(String msg) {
        this.msg = msg;
        return this;
    }

    public Object getObj() {
        return obj;
    }

    public ResultBean setObj(Object obj) {
        this.obj = obj;
        return this;
    }
}
