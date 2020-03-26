package com.xiaoyu.hrm.service;

import com.xiaoyu.hrm.pojo.Employee;
import com.xiaoyu.hrm.pojo.ResultBean;

import java.util.List;

/**
 * 员工管理
 *
 * @author xiaoyu
 * @date 2020/3/26 14:17
 */
public interface IEmployeeService {

    /**
     * 根据条件查询员工
     *
     * @param page     从page开始查询
     * @param size     每次查询size个
     * @param employee 条件
     * @return 返回查询的结果
     */
    ResultBean findAllEmployee(Integer page, Integer size, Employee employee,
                               Integer positionId, Integer departmentId);

    /**
     * 获取民族
     *
     * @return 返回56个民族
     */
    ResultBean getAllNations();

    /**
     * 获取政治面貌
     *
     * @return 返回政治面貌
     */
    ResultBean getAllPoliticsstatus();

    /**
     * 添加员工
     *
     * @param employee 信息
     * @return 返回操作结果
     */
    ResultBean insertEmployee(Employee employee);

    /**
     * 更新员工信息
     *
     * @param employee 信息
     * @return 返回操作结果
     */
    ResultBean updateEmployee(Employee employee);

    /**
     * 根据员工 id 删除用户
     *
     * @param id 员工id
     * @return 返回操作结果
     */
    ResultBean deleteEmployee(Integer id);

    /**
     * 根据id批量删除职位
     *
     * @param ids id
     * @return 返回操作结果
     */
    ResultBean deletesEmployee(List<Integer> ids);


}
