package com.xiaoyu.hrm.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * 返回分页查询的信息
 * 
 * @author xiaoyu
 * @date 2020/3/19 15:19
 */
public class ResultPageBean implements Serializable {

    private List<?> data;
    private Long total;

    public ResultPageBean(List<?> data, Long total) {
        this.data = data;
        this.total = total;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }
}
