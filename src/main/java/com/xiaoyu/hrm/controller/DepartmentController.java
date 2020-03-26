package com.xiaoyu.hrm.controller;

import com.xiaoyu.hrm.pojo.Department;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


/**
 * 部门管理
 * 
 * @author xiaoyu
 * @date 2020/3/22 10:34
 */
@RestController
@RequestMapping("/department/basic")
public class DepartmentController {

    @Autowired
    private IDepartmentService departmentService;

    /**
     * 根据父id查询所有部门
     * @return 查询到的所有部门
     */
    @GetMapping("/")
    public ResultBean findAllDepartment() {
        return departmentService.findAllDepartment();
    }

    /**
     * 新增部门
     * @param department 新增的部门信息
     * @return 返回操作结果集部门信息
     */
    @PostMapping("/")
    public ResultBean powerInsertDepartment(@RequestBody Department department) {
        return departmentService.insertDepartment(department);
    }

    /**
     * 根据id删除部门
     * @param id id
     * @return 返回操作结果
     */
    @DeleteMapping("/{id}")
    public ResultBean powerDeleteDepartment(@PathVariable Integer id) {
        return departmentService.deleteDepartment(id);
    }

}
