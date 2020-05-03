package com.xiaoyu.hrm.service.impl;

import com.xiaoyu.hrm.mapper.IPositionMapper;
import com.xiaoyu.hrm.pojo.Position;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.service.IPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
 * 职位管理
 * 
 * @author xiaoyu
 * @date 2020/3/23 15:23
 */@Service
public class PositionServiceImpl implements IPositionService {

     @Autowired
     private IPositionMapper positionMapper;

    /**
     * 根据条件动态查询职位信息
     * @param position 条件
     * @return 返回操作结果和查询到的信息
     */
     @Override
     public ResultBean findAllPosition(Position position) {
         List<Position> list = positionMapper.findAllPosition(position);
         if (list == null || list.size() == 0) {
             return ResultBean.error("查询不到职位信息！");
         }
         return ResultBean.ok("查询职位成功！", list);
     }

    /**
     * 更新职位信息
     * @param position 职位信息
     * @return 返回操作结果
     */
     @Override
     public ResultBean updatePosition(Position position) {
         if (StringUtils.isEmpty(position.getId())) {
             return ResultBean.error("此次修改操作错误！");
         }
         if (StringUtils.isEmpty(position.getName()) || StringUtils.isEmpty(position.getRemark())) {
             return ResultBean.error("职位名称以及描述不可为空！");
         }
         int i = positionMapper.updatePosition(position);
         if (i != 1) {
             return ResultBean.error("修改失败，可能是您未修改任何信息！");
         }
         return ResultBean.ok("修改职位信息成功！");
     }

    /**
     * 新增职位
     * @param position 职位信息
     * @return 返回操作结果
     */
     @Override
     public ResultBean insertPosition(Position position) {
         if (!StringUtils.isEmpty(position.getId())) {
             return ResultBean.error("添加操作异常！");
         }
         if (StringUtils.isEmpty(position.getName()) || StringUtils.isEmpty(position.getRemark())) {
             return ResultBean.error("职位名称以及描述不可为空！");
         }
         // 补全属性
         position.setCreateDate(new Date());
         position.setEnabled(true);
         // 执行插入
         int i = positionMapper.insertPosition(position);
         if (i != 1) {
             return ResultBean.error("添加职位失败！");
         }
         return ResultBean.ok("添加职位成功");
     }

    /**
     * 根据id删除职位
     * @param position 职位信息
     * @return 返回操作结果
     */
     @Override
     public ResultBean deletePosition(Position position) {
         if (position.getId() == null || StringUtils.isEmpty(position.getName())) {
             return ResultBean.ok("删除错误，缺少参数！");
         }
         int i = positionMapper.deletePositionById(position.getId());
         if (i != 1) {
             return ResultBean.error("删除职位失败！");
         }
         return ResultBean.ok("删除职位成功！");
     }

    /**
     * 根据id批量删除职位
     * @param poss 职位信息数组
     * @return 返回操作结果
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public ResultBean deletesPosition(List<Position> poss) {
        if (poss == null || poss.size() == 0) {
            return ResultBean.ok("删除错误，缺少参数！");
        }
        int i = 0;
        for (Position pos : poss) {
            if (pos.getId() == null || StringUtils.isEmpty(pos.getName())) {
                return ResultBean.ok("删除错误，缺少参数！");
            }
            i = positionMapper.deletePositionById(pos.getId());
            if (i != 1) {
                throw new RuntimeException("删除异常");
            }
        }
        return ResultBean.ok("删除职位成功！");
    }

}
