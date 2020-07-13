package com.xiaoyu.hrm.service.impl;

import com.xiaoyu.hrm.mapper.IDepartmentMapper;
import com.xiaoyu.hrm.mapper.IEmployeeMapper;
import com.xiaoyu.hrm.mapper.IPositionMapper;
import com.xiaoyu.hrm.pojo.*;
import com.xiaoyu.hrm.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;


/**
 * 员工管理
 * 
 * @author xiaoyu
 * @date 2020/3/24 13:02
 */
@Service
public class EmployeeServiceImpl implements IEmployeeService {

    @Autowired
    private IEmployeeMapper employeeMapper;

    @Autowired
    private IDepartmentMapper departmentMapper;

    @Autowired
    private IPositionMapper positionMapper;

    /**
     * 根据条件查询员工
     * @param page 从page开始查询
     * @param size 每次查询size个
     * @param employee 条件
     * @return 返回查询的结果
     */
    @Override
    public ResultBean findAllEmployee(Integer page, Integer size, Employee employee,
                                      Integer positionId, Integer departmentId) {
        if (page == null || size == null) {
            return ResultBean.error("查询员工错误！");
        }
        page = (page - 1) * size;
        List<Employee> list = employeeMapper.findAllEmployee(page, size, employee, positionId, departmentId);
        if (list == null || list.size() == 0) {
            return ResultBean.error("查询不到员工信息！");
        }
        Long total = employeeMapper.getTotal(employee, positionId, departmentId);
        return ResultBean.ok(new ResultPageBean(list, total));
    }

    /**
     * 获取民族
     * @return 返回56个民族
     */
    @Override
    public ResultBean getAllNations() {
        List<Nation> list = employeeMapper.getAllNations();
        if (list == null || list.size() == 0) {
            return ResultBean.error("获取民族失败！");
        }
        return ResultBean.ok(list);
    }

    /**
     * 获取政治面貌
     * @return 返回政治面貌
     */
    @Override
    public ResultBean getAllPoliticsStatus() {
        List<PoliticsStatus> list = employeeMapper.getAllPoliticsStatus();
        if (list == null || list.size() == 0) {
            return ResultBean.error("获取政治面貌失败！");
        }
        return ResultBean.ok(list);
    }

    /**
     * 添加员工
     * @param employee 信息
     * @return 返回操作结果
     */
    @Override
    public ResultBean insertEmployee(Employee employee) {
        if (employee.getId() != null) {
            return ResultBean.error("添加操作异常！");
        }
        ResultBean resultBean = checkData(employee);
        if (resultBean != null) {
            return resultBean;
        }
        // 补全属性
        employee.setCreateDate(new Date());
        int i = employeeMapper.insertEmployee(employee);
        if (i != 1) {
            return ResultBean.error("添加员工错误！");
        }
        return ResultBean.ok("添加员工成功！");
    }

    /**
     * 更新员工信息
     * @param employee 信息
     * @return 返回操作结果
     */
    @Override
    public ResultBean updateEmployee(Employee employee) {
        if (employee.getId() == null) {
            return ResultBean.error("修改操作异常！");
        }
        ResultBean resultBean = checkData(employee);
        if (resultBean != null) {
            return resultBean;
        }
        int i = employeeMapper.updateEmployee(employee);
        if (i != 1) {
            return ResultBean.ok("信息未修改！");
        }
        return ResultBean.ok("修改员工信息成功！");
    }

    /**
     * 根据员工 id 删除用户
     *
     * @param employee 员工信息
     * @return 返回操作结果
     */
    @Override
    public ResultBean deleteEmployee(Employee employee) {
        if (employee.getId() == null || StringUtils.isEmpty(employee.getName())) {
            return ResultBean.error("删除错误，缺少参数！");
        }
        int i = employeeMapper.deleteEmployee(employee.getId());
        if (i != 1) {
            return ResultBean.error("删除员工错误！");
        }
        return ResultBean.ok("删除员工成功！");
    }

    /**
     * 根据id批量删除职位
     *
     * @param emps 职位信息数组
     * @return 返回操作结果
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public ResultBean deletesEmployee(List<Employee> emps) {
        if (emps == null || emps.size() == 0) {
            return ResultBean.ok("删除错误，缺少参数！");
        }
        int i = 0;
        for (Employee emp : emps) {
            if (emp.getId() == null || StringUtils.isEmpty(emp.getName())) {
                return ResultBean.ok("删除错误，缺少参数！");
            }
            i = employeeMapper.deleteEmployee(emp.getId());
            if (i != 1) {
                throw new RuntimeException("删除异常");
            }
        }
        return ResultBean.ok("删除员工成功！");
    }

    /**
     * 检查数据
     * @param employee 数据
     * @return 返回校验结果
     */
    private ResultBean checkData(Employee employee) {
        if (employee == null || employee.getDepartment().getId() == null || employee.getPosition().getId() == null) {
            return ResultBean.error("添加异常，部门及职位为空！");
        }
        Department department = departmentMapper.findDepartmentById(employee.getDepartment().getId());
        if (department == null) {
            return ResultBean.error("添加异常，部门不存在！");
        }
        Position position = positionMapper.findPositionById(employee.getPosition().getId());
        if (position == null) {
            return ResultBean.error("添加异常，职位不存在！");
        }
        if (StringUtils.isEmpty(employee.getName()) || StringUtils.isEmpty(employee.getCardId())) {
            return ResultBean.error("请填写您的员工名称或身份证！");
        }
        if (employee.getSex() != 0 && employee.getSex() != 1) {
            return ResultBean.error("性别填写有误！");
        }
        if (StringUtils.isEmpty(employee.getBirthday())) {
            return ResultBean.error("请填写您的生日！");
        }
        if (StringUtils.isEmpty(employee.getTel()) || StringUtils.isEmpty(employee.getPhone())) {
            return ResultBean.error("请填写您的电话号码或手机号码！");
        }
        if (StringUtils.isEmpty(employee.getEmail()) || StringUtils.isEmpty(employee.getQqNum())) {
            return ResultBean.error("请填写您的email或QQ邮箱！");
        }
        if (StringUtils.isEmpty(employee.getAddress()) || StringUtils.isEmpty(employee.getPostCode())) {
            return ResultBean.error("请填写您的联系地址或QQ邮箱！");
        }
        if (StringUtils.isEmpty(employee.getParty())) {
            return ResultBean.error("请填写您的政治面貌！");
        }
        if (StringUtils.isEmpty(employee.getRace())) {
            return ResultBean.error("请填写您的民族！");
        }
        if (StringUtils.isEmpty(employee.getEducation()) || StringUtils.isEmpty(employee.getSpeciality())) {
            return ResultBean.error("请填写您的学历或专业！");
        }
        if (StringUtils.isEmpty(employee.getHobby()) || StringUtils.isEmpty(employee.getRemark())) {
            return ResultBean.error("请填写您的爱好或自我描述！");
        }
        List<Employee> employeeByCardId = employeeMapper.findEmployeeByCardId(employee.getCardId());
        if (employeeByCardId == null) {
            return ResultBean.error("身份证异常！");
        }
        return null;
    }

}
