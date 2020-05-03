package com.xiaoyu.hrm.service;

import com.xiaoyu.hrm.pojo.Position;
import com.xiaoyu.hrm.pojo.ResultBean;

import java.util.List;

/**
 * 职位管理
 *
 * @author xiaoyu
 * @date 2020/3/26 14:28
 */
public interface IPositionService {

    /**
     * 根据条件动态查询职位信息
     * @param position 条件
     * @return 返回操作结果和查询到的信息
     */
    ResultBean findAllPosition(Position position);

    /**
     * 更新职位信息
     * @param position 职位信息
     * @return 返回操作结果
     */
    ResultBean updatePosition(Position position);

    /**
     * 新增职位
     * @param position 职位信息
     * @return 返回操作结果
     */
    ResultBean insertPosition(Position position);

    /**
     * 根据id删除职位
     * @param position 职位信息
     * @return 返回操作结果
     */
    ResultBean deletePosition(Position position);

    /**
     * 根据id批量删除职位
     * @param poss 职位信息数组
     * @return 返回操作结果
     */
    ResultBean deletesPosition(List<Position> poss);



}
