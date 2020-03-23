package com.xiaoyu.hrm.config;

import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.User;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 控制切面
 * 
 * @author xiaoyu
 * @date 2020/3/22 23:27
 */
@Aspect
@Component
public class PowerAspect {

    /**
     * slf4j
     */
    private final static Logger logger = LoggerFactory.getLogger(PowerAspect.class);

    /**
     * 配置切入点，切入以power开头的方法
     */
    @Pointcut("execution(public * com.xiaoyu.hrm.controller.*.power*(..))")
    private void powerPointcut() {}

    /**
     * 环绕通知
     */
    @Around(value = "powerPointcut()")
    public Object around(ProceedingJoinPoint pjp) {
        try {
            // 获取 request 域
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            assert attributes != null;
            HttpServletRequest request = attributes.getRequest();
            User user = (User) request.getAttribute("user");
            if (user == null) {
                return ResultBean.loginError("登陆异常，请重新登陆！");
            }
            if (user.getStatus() != 2) {
                return ResultBean.loginError("拦截到您没有权限操作！");
            }
            // 记录一下日志
            String message = "用户：" +  user.getLoginname() + "--> 操作了：" + pjp.getSignature().getName();
            logger.info(message, user);
            // 有权限，放行
            return pjp.proceed();
        } catch (Throwable e) {
            logger.error(pjp.getSignature() + " 出现异常.", e);
            throw new RuntimeException();
        }
    }

//    @Before("powerPointcut()")
//    public void checkPower(JoinPoint joinPoint) {
//        // 获取 request 域
//        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
//        assert attributes != null;
//        HttpServletRequest request = attributes.getRequest();
//        if (request == null) {
//            throw new RuntimeException();
//        }
//
//        // doing
//
//    }
//
//    @After("powerPointcut()")
//    public void after() {
//
//    }
//
//    @AfterReturning("powerPointcut()")
//    public void afterReturning() {
//
//    }
//
//    @AfterThrowing("powerPointcut()")
//    public void afterThrowing() {
//
//    }

}
