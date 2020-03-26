package com.xiaoyu.hrm.service;

import com.xiaoyu.hrm.pojo.ResultBean;

/**
 * 首页菜单栏
 *
 * @author xiaoyu
 * @date 2020/3/26 14:25
 */
public interface IMenuService {

    /**
     * 获取菜单栏所有信息
     * @return
     */
    ResultBean getAllMenus();

}
