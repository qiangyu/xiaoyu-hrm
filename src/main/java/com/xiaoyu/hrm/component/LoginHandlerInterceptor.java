package com.xiaoyu.hrm.component;

import com.alibaba.fastjson.JSON;
import com.xiaoyu.hrm.pojo.User;
import com.xiaoyu.hrm.utils.JedisUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 配置拦截器，进行身份验证
 * 
 * @author xiaoyu
 * @date 2020/3/18 22:51
 */
public class LoginHandlerInterceptor implements HandlerInterceptor {

    /**
     * 操作redis
     */
    @Autowired
    private JedisUtil jedisUtil;

    private final static Logger logger = LoggerFactory.getLogger(LoginHandlerInterceptor.class);

    /**
     * 存储用户信息key的前缀
     */
    @Value("${XIAOYU_USER}")
    private String XIAOYU_USER;

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
        // 从请求头获取 token
        String token = request.getHeader("token");
        // 如 token 为空，则没登录
        if (StringUtils.isEmpty(token)) {
            // 将请求转发到 /user/error
            request.getRequestDispatcher("/user/error").forward(request, response);
            return false;
        }

        try {
            // token 为key，在redis中查询
            String jsonUser = jedisUtil.get(token);
            // 如果不存在则用户没登录
            if (StringUtils.isEmpty(jsonUser)) {
                // 将请求转发到 /user/error
                request.getRequestDispatcher("/user/error").forward(request, response);
                return false;
            }
            User user = JSON.parseObject(jsonUser, User.class);
            // 将用户信息设置到请求域，先将用户密码设置为null
            user.setPassword(null);
            request.setAttribute("user", user);
            // 重新设置过期时间 半小时
            String set = jedisUtil.set(token, jsonUser, 3600);
            if (StringUtils.isEmpty(set)) {
                // 将请求转发到 /user/error
                request.getRequestDispatcher("/user/error").forward(request, response);
                return false;
            }
            return true;
        } catch (ServletException | IOException e) {
            logger.error("验证用户登录查询token时异常：", e);
            e.printStackTrace();
        }
        return false;
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
