package com.xiaoyu.hrm.service;

import com.xiaoyu.hrm.mapper.IMenuMapper;
import com.xiaoyu.hrm.pojo.Menu;
import com.xiaoyu.hrm.pojo.ResultBean;
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
public class MenuService {

    @Autowired
    IMenuMapper menuMapper;

    /**
     * 获取菜单栏所有信息
     * @return
     */
    public ResultBean getAllMenus() {
        List<Menu> list = menuMapper.getAllMenus();
        return ResultBean.ok(null, list);
    }

}
