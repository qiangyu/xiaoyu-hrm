package com.xiaoyu.hrm.mapper;

import com.xiaoyu.hrm.pojo.Menu;

import java.util.List;

/**
 * 获取菜单栏信息
 *
 * @author xiaoyu
 * @date 2020/3/18 23:49
 */
public interface IMenuMapper {

    /**
     * 获取所有菜单栏信息
     * @return
     */
    List<Menu> getAllMenus();

}