package com.xiaoyu.hrm.handle;

import com.xiaoyu.hrm.pojo.ResultBean;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

/**
 * 全局异常捕捉处理的 handle
 * 
 * @author xiaoyu
 * @date 2020/7/14 14:17
 */
@RestControllerAdvice
public class HrmExceptionHandle {

    /**
     * 应用到所有@RequestMapping注解方法，在其执行之前初始化数据绑定器
     * @param binder
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {}

    /**
     * 把值绑定到Model中，使全局@RequestMapping可以获取到该值
     * @param model
     */
    @ModelAttribute
    public void addAttributes(Model model) {}

    /**
     * 全局异常捕捉处理
     * @param ex
     * @return
     */
    @ExceptionHandler(value = Exception.class)
    public ResultBean errorHandler(Exception ex) {
        return ResultBean.error(ex.getMessage());
    }

}
