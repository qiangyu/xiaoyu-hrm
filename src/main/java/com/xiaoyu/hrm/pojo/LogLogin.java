package com.xiaoyu.hrm.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 记录登陆日志的pojo
 * 
 * @author xiaoyu
 * @date 2020/7/12 17:44
 */
@Component
@Scope("prototype")
public class LogLogin {

    Integer id;
    String user;
    String operating;
    String ip;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Shanghai")
    Date date;

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
        return "LogLogin{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", operating='" + operating + '\'' +
                ", ip='" + ip + '\'' +
                ", date=" + date +
                '}';
    }
}
