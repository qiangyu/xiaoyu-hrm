package com.xiaoyu.hrm.service;

import com.xiaoyu.hrm.pojo.Department;
import com.xiaoyu.hrm.pojo.ResultBean;

/**
 * 部门管理
 *
 * @author xiaoyu
 * @date 2020/3/22 11:18
 */
public interface IDepartmentService {

    /**
     * 根据父id查询所有部门
     *
     * @return 查询到的所有部门
     */
    ResultBean findAllDepartment();

    /**
     * 新增部门
     *
     * @param department 新增的部门信息
     * @return 返回操作结果集部门信息
     */
    ResultBean insertDepartment(Department department);

    /**
     * 根据id删除部门
     *
     * @param id id
     * @return 操作结果
     */
    ResultBean deleteDepartment(Integer id);

}
