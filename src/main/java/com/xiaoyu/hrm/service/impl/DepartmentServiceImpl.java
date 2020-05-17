package com.xiaoyu.hrm.service.impl;

import com.xiaoyu.hrm.mapper.IDepartmentMapper;
import com.xiaoyu.hrm.pojo.Department;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.service.IDepartmentService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * 部门管理
 * 
 * @author xiaoyu
 * @date 2020/3/22 11:18
 */
@Service
public class DepartmentServiceImpl implements IDepartmentService {

    @Autowired
    private IDepartmentMapper departmentMapper;

    private final static Logger logger = LoggerFactory.getLogger(DepartmentServiceImpl.class);

    /**
     * 根据父id查询所有部门
     * @return 查询到的所有部门
     */
    @Override
    public ResultBean findAllDepartment() {
        List<Department> list = departmentMapper.findAllDepartmentByParentId(-1);
        return ResultBean.ok(list);
    }

    /**
     * 新增部门
     * @param department 新增的部门信息
     * @return 返回操作结果集部门信息
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public ResultBean insertDepartment(Department department) {
        if (!StringUtils.isEmpty(department.getId())) {
            return ResultBean.error("添加部门异常！");
        }
        if (StringUtils.isEmpty(department.getParentId())) {
            return ResultBean.error("非法添加部门！");
        }
        if (StringUtils.isEmpty(department.getName()) || StringUtils.isEmpty(department.getRemark())) {
            return ResultBean.error("信息填写不完整！");
        }
        // 检查父节点是否存在
        Department depPath = departmentMapper.findDepPathById(department.getParentId());
        if (depPath == null || StringUtils.isEmpty(depPath.getDepPath())) {
            return ResultBean.error("非法添加部门！");
        }

        department.setEnabled(true);
        // 执行插入
        departmentMapper.insertDepartment(department);
        Integer newDepartmentId = department.getId();
        if (newDepartmentId == null) {
            throw new RuntimeException("添加部门错误");
        }
        department.setId(newDepartmentId);
        department.setDepPath(depPath.getDepPath());
        int i = departmentMapper.updateDepPathById(department);
        if (i != 1) {
            throw new RuntimeException("添加部门错误");
        }
        // 将新增节点的父节点的 isParent 字段设置为true
        departmentMapper.updateParentById(department.getParentId());
        logger.info("部门：{} --> 添加成功：{}", department.getName(), department);
        return ResultBean.ok("添加部门成功！", department);
    }

    /**
     * 根据id删除部门
     *
     * @param department 部门信息
     * @return 操作结果
     */
    @Override
    public ResultBean deleteDepartment(Department department) {
        if (department.getId() == null || StringUtils.isEmpty(department.getName())) {
            return ResultBean.error("删除错误，缺少参数！");
        }
        int i = departmentMapper.deleteDepartmentById(department.getId());
        if (i != 1) {
            return ResultBean.error("删除异常！");
        }
        logger.info("部门：{} --> 删除成功：{}", department.getName(), department);
        return ResultBean.ok("删除成功！");
    }
}
