package com.xiaoyu.hrm.service.impl;

import com.xiaoyu.hrm.mapper.IMenuMapper;
import com.xiaoyu.hrm.pojo.Menu;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.User;
import com.xiaoyu.hrm.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 管理页面左侧菜单栏
 *
 * @author xiaoyu
 * @date 2020/3/18 23:28
 */
@Service
public class MenuServiceImpl implements IMenuService {

    @Autowired
    IMenuMapper menuMapper;

    /**
     * 获取菜单栏所有信息
     * @return
     */
    @Override
    public ResultBean getAllMenus(User user) {
        // 获取用户权限
        Integer status = user.getStatus();
        // 开始判断权限
        boolean isPower = false;
        if (status > 1 && status <= 3) {
            isPower = true;
        }
        // 获取菜单栏
        List<Menu> list = menuMapper.getAllMenus(isPower);
        return ResultBean.ok(list);
    }

}
