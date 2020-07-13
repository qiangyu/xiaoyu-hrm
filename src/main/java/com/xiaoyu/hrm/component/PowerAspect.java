package com.xiaoyu.hrm.component;

import com.xiaoyu.hrm.pojo.*;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
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
     * 配置切入点，切入以power开头的方法
     */
    @Pointcut("execution(public * com.xiaoyu.hrm.controller.*.power*(..))")
    private void powerPointcut() {
    }

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
            // 有权限验证完毕，放行
            return pjp.proceed(args);
        } catch (Throwable e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

}
