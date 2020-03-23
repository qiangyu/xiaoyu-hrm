package com.xiaoyu.hrm.mapper;

import com.xiaoyu.hrm.pojo.Department;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 部门管理
 * 
 * @author xiaoyu
 * @date 2020/3/22 11:13
 */
public interface IDepartmentMapper {

    /**
     * 根据父id查询所有部门
     * @param parentId 父id
     * @return 查询到的所有部门
     */
    List<Department> findAllDepartmentByParentId(Integer parentId);

    /**
     * 新增部门
     * @param department 部门信息
     * @return 返回影响行数
     */
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into dept_inf(name, remark, parentId, enabled) values(#{name}, #{remark}, #{parentId}, #{enabled})")
    int insertDepartment(Department department);

    /**
     * 根据id查询 depPath 字段信息
     * @param id id
     * @return depPath 字段信息
     */
    @Select("select depPath from dept_inf where id = #{id}")
    Department findDepPathById(Integer id);

    /**
     * 根据 id 更新 depPath 字段的信息（父节点的depPath + 本节点的id）
     * @param department 本节点的id以及父节点的depPath
     * @return 返回影响行数
     */
    @Update("update dept_inf set depPath = concat(#{depPath}, '.', #{id}) where id = #{id}")
    int updateDepPathById(Department department);

    /**
     * 根据id更新 isParent 字段的信息（在选择的节点上添加了节点，则选中的节点更新为父节点）
     * @param id id
     * @return 返回影响行数
     */
    @Update("update dept_inf set isParent = true where id = #{id}")
    int updateParentById(Integer id);

    /**
     * 根据id删除部门
     * @param id id
     * @return 返回影响行数
     */
    @Delete("delete from dept_inf where id = #{id}")
    int deleteDepartmentById(Integer id);

}
