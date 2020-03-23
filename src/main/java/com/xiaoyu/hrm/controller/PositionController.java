package com.xiaoyu.hrm.controller;

import com.xiaoyu.hrm.pojo.Position;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 接收职位相关请求
 * 
 * @author xiaoyu
 * @date 2020/3/23 15:30
 */
@RestController
@RequestMapping("/pos/basic")
public class PositionController {

    @Autowired
    private PositionService positionService;

    /**
     * 根据条件动态查询职位信息
     * @param position 条件
     * @return 返回操作结果和查询到的信息
     */
    @GetMapping("/")
    public ResultBean findAllPosition(Position position) {
        return positionService.findAllPosition(position);
    }

    /**
     * 更新职位信息
     * @param position 职位信息
     * @return 返回操作结果
     */
    @PutMapping("/")
    public ResultBean powerUpdatePosition(@RequestBody Position position) {
        return positionService.updatePosition(position);
    }

    /**
     * 新增职位
     * @param position 职位信息
     * @return 返回操作结果
     */
    @PostMapping("/")
    public ResultBean powerInsertPosition(@RequestBody Position position) {
        return positionService.insertPosition(position);
    }

    /**
     * 根据id删除职位
     * @param id id
     * @return 返回操作结果
     */
    @DeleteMapping("/{id}")
    public ResultBean powerDeletePosition(@PathVariable Integer id) {
        return positionService.deletePosition(id);
    }

    /**
     * 根据id批量删除职位
     * @param ids is数组
     * @return 返回操作结果
     */
    @DeleteMapping("/")
    public ResultBean powerDeletesPosition(@RequestBody List<Integer> ids) {
        return positionService.deletesPosition(ids);
    }

}
