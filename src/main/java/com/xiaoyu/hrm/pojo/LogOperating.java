package com.xiaoyu.hrm.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Date;

/**
 * 记录操作日志的pojo
 * 
 * @author xiaoyu
 * @date 2020/7/13 9:53
 */
@Component
@Scope("prototype")
public class LogOperating extends Log implements Serializable {

    private Integer id;
    private String user;
    private String operating;
    private String operatingData;
    private String ip;
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss", timezone = "Asia/Shanghai")
    private Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getOperating() {
        return operating;
    }

    public void setOperating(String operating) {
        this.operating = operating;
    }

    public String getOperatingData() {
        return operatingData;
    }

    public void setOperatingData(String operatingData) {
        this.operatingData = operatingData;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "LogOperating{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", operating='" + operating + '\'' +
                ", operatingData='" + operatingData + '\'' +
                ", ip='" + ip + '\'' +
                ", date=" + date +
                '}';
    }
}
