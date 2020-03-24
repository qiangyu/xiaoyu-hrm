package com.xiaoyu.hrm.mapper;

import com.xiaoyu.hrm.pojo.Position;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 增删改查 职位
 *
 * @author xiaoyu
 * @date 2020/3/23 15:14
 */
public interface IPositionMapper {

    /**
     * 根据条件动态查询职位信息
     * @param position 条件
     * @return 返回查询到的信息
     */
    List<Position> findAllPosition(Position position);

    /**
     * 根据id查询职位信息
     * @param id id
     * @return 返回查询到的职位信息
     */
    @Select("select * from job_inf where id = #{id }")
    Position findPositionById(Integer id);

    /**
     * 更新职位信息
     * @param position 职位信息
     * @return 返回影响的行数
     */
    int updatePosition(Position position);

    /**
     * 新增职位
     * @param position 职位信息
     * @return 返回影响的行数
     */
    @Insert("insert into job_inf(name, remark, createDate, enabled) values(#{name}, #{remark}, #{createDate}, #{enabled}) ")
    int insertPosition(Position position);

    /**
     * 根据id删除职位
     * @param id id
     * @return 返回影响的行数
     */
    @Delete("delete from job_inf where id = #{id} ")
    int deletePositionById(Integer id);

}
