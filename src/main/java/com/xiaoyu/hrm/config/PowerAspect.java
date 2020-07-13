package com.xiaoyu.hrm.config;

import com.xiaoyu.hrm.pojo.*;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

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
            if (user.getStatus() != 2 && user.getStatus() != 3) {
                return ResultBean.loginError("拦截到您没有权限操作！");
            }
            // 获取方法全部参数
            Object[] args = pjp.getArgs();
            Object loggerInfo = null;
            // 遍历参数，不同参数处理不同业务
            for (Object arg : args) {
                // 如果参数是：用户信息、部门信息、职位信息、员工信息、文件信息，则记录日志
                if (arg instanceof User || arg instanceof Department || arg instanceof Position || arg instanceof Employee || arg instanceof Document) {
                    loggerInfo = arg;
                }
            }
            // 记录一下日志
            logger.info("拦截到用户：{} --> 操作：{}，操作信息：{} ~~~ 时间：{}", user.getLoginname(), pjp.getSignature().getName(), loggerInfo, new Date());
            // 有权限验证完毕，放行
            return pjp.proceed(args);
        } catch (Throwable e) {
            e.printStackTrace();
            logger.error("操作：{} ~~~ 出现异常：{} ~~~ 时间：{}", pjp.getSignature(), e.getMessage(), new Date());
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
