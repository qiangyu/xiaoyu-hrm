package com.xiaoyu.hrm.pojo;

import java.io.Serializable;

/**
 * 民族
 * 
 * @author xiaoyu
 * @date 2020/3/24 16:41
 */
public class Nation implements Serializable {

    private Integer id;
    private String name;

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
}
