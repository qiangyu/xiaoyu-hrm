package com.xiaoyu.hrm.component;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 配置拦截器，进行身份验证
 * 
 * @author xiaoyu
 * @date 2020/3/18 22:51
 */
public class LoginHandlerInterceptor implements HandlerInterceptor {

    /**
     * 进入Handler方法执行之前执行此方法，验证身份
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object user = request.getSession().getAttribute("isUser");
        if (StringUtils.isEmpty(user)) {
            // 未登录,返回登录页面
            request.setAttribute("msg", "没有权限，请先登录。");
            // 将请求转发到 /
            request.getRequestDispatcher("/").forward(request, response);
            return false;
        }
        return true;
    }

    /**
     * 该方法在进入Handler方法之后，返回ModelAndView之前执行
     * @param request
     * @param response
     * @param handler
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    /**
     * 该方法在handler方法执行完之后执行
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
