package com.xiaoyu.hrm.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 职位的pojo
 * 
 * @author xiaoyu
 * @date 2020/3/23 15:14
 */
public class Position implements Serializable {

    private Integer id;
    private String name;
    private String remark;
    private Date createDate;
    private Boolean enabled;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public String toString() {
        return "Position{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", remark='" + remark + '\'' +
                ", createDate=" + createDate +
                ", enabled=" + enabled +
                '}';
    }
}
