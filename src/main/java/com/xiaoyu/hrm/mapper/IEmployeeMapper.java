package com.xiaoyu.hrm.mapper;


import com.xiaoyu.hrm.pojo.Employee;
import com.xiaoyu.hrm.pojo.Nation;
import com.xiaoyu.hrm.pojo.Politicsstatus;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 员工 增删改查
 *
 * @author xiaoyu
 * @date 2020/3/24 12:41
 */
public interface IEmployeeMapper {

    /**
     * 根据条件查询员工
     * @param page 从page开始查询
     * @param size 每次查询size个
     * @param employee 条件
     * @param positionId 职位id
     * @param departmentId 部门id
     * @return 返回查询的结果
     */
    List<Employee> findAllEmployee(@Param("page") Integer page,
                                   @Param("size") Integer size,
                                   @Param("emp") Employee employee,
                                   @Param("positionId") Integer positionId,
                                   @Param("departmentId") Integer departmentId);

    /**
     * 根据条件查询员工
     * @param employee 条件
     * @param positionId 职位id
     * @param departmentId 部门id
     * @return 返回查询的结果
     */
    Long getTotal(@Param("emp") Employee employee,
                  @Param("positionId") Integer positionId,
                  @Param("departmentId") Integer departmentId);

    /**
     * 获取民族
     * @return 返回56个民族
     */
    @Select("select * from nation ")
    List<Nation> getAllNations();

    /**
     * 获取政治面貌
     * @return 返回政治面貌信息
     */
    @Select("select * from politicsstatus ")
    List<Politicsstatus> getAllPoliticsstatus();

    /**
     * 添加员工
     * @param employee 信息
     * @param positionId 职位id
     * @param departmentId 部门id
     * @return 返回影响行数
     */
    int insertEmployee(@Param("emp") Employee employee,
                       @Param("positionId") Integer positionId,
                       @Param("departmentId") Integer departmentId);

    /**
     * 更新员工信息
     * @param employee 信息
     * @param positionId 职位id
     * @param departmentId 部门id
     * @return 返回影响行数
     */
    int updateEmployee(@Param("emp") Employee employee,
                       @Param("positionId") Integer positionId,
                       @Param("departmentId") Integer departmentId);

    /**
     * 根据员工 id 删除用户
     * @param id 员工id
     * @return 返回影响的行数
     */
    @Delete("delete from employee_inf where id = #{id} ")
    int deleteEmployee(Integer id);

}
