package com.xiaoyu.hrm.service;

import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.User;

/**
 * 首页菜单栏
 *
 * @author xiaoyu
 * @date 2020/3/26 14:25
 */
public interface IMenuService {

    /**
     * 获取菜单栏所有信息
     * @param user 判断是否有权限
     * @return
     */
    ResultBean getAllMenus(User user);

}
