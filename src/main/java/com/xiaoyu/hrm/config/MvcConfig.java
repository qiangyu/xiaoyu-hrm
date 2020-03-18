package com.xiaoyu.hrm.config;

import com.xiaoyu.hrm.component.LoginHandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 使用 WebMvcConfig来扩展SpringMVC功能
 * 添加拦截器等
 *
 * @author xiaoyu
 * @date 2020/3/18 22:50
 */
public class MvcConfig implements WebMvcConfigurer {

    /**
     * 视图控制器
     * @param registry
     */
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        // 浏览器发送 /index.html 请求跳转到到login页面等
//        registry.addViewController("/").setViewName("login");
//        registry.addViewController("/index.html").setViewName("login");
    }

    /**
     * 添加拦截器
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginHandlerInterceptor()).addPathPatterns("/**")
                .excludePathPatterns("/", "/index.html");
    }

    /**
     * 资源处理器
     * @param registry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/static/");
    }
}
