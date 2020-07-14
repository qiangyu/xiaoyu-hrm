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
     * @param isPower 是否有权限：1（true，有权限）、0（false，无权限）
     * @return
     */
    List<Menu> getAllMenus(boolean isPower);

}