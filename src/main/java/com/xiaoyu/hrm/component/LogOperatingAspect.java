package com.xiaoyu.hrm.component;

import com.xiaoyu.hrm.mapper.ILogMapper;
import com.xiaoyu.hrm.pojo.IPojo;
import com.xiaoyu.hrm.pojo.LogOperating;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.User;
import com.xiaoyu.hrm.utils.JedisUtil;
import com.xiaoyu.hrm.utils.LogUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 记录操作日志的aop
 *
 * @author xiaoyu
 * @date 2020/7/13 9:04
 */
@Aspect
@Component
public class LogOperatingAspect {

    /**
     * 操作redis
     */
    @Autowired
    private JedisUtil jedisUtil;

    @Autowired
    private ILogMapper logMapper;

    @Autowired
    private LogOperating logOperating;

    /**
     * slf4j
     */
    private final static Logger logger = LoggerFactory.getLogger(PowerAspect.class);

    /**
     * 权力操作的切入点
     */
    @Pointcut("execution(public * com.xiaoyu.hrm.controller.*.power*(..))")
    private void powerOperatingPointcut() {
    }

    /**
     * 非权力操作的切入点
     */
    @Pointcut("execution(public * com.xiaoyu.hrm.controller.*.other*(..))")
    private void otherOperatingPointcut() {
    }

    @Pointcut("powerOperatingPointcut() || otherOperatingPointcut()")
    private void operatingPointcut() {
    }

    @Around("operatingPointcut()")
    public Object around(ProceedingJoinPoint pjp) {
        try {
            // 获取 request 域
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            assert attributes != null;
            HttpServletRequest request = attributes.getRequest();

            // 获取方法全部参数
            Object[] args = pjp.getArgs();

            // 执行目标方法
            Object proceed = pjp.proceed(args);

            if (proceed == null) {
                return null;
            }
            ResultBean result = (ResultBean) proceed;
            // 操作成功，记录日志
            if (result.getStatus() == 200) {
                // 获取用户账号
                User userInfo = LogUtils.getUserInfoByToken(jedisUtil, request);
                if (userInfo != null) {
                    logOperating.setUser(userInfo.getLoginname());
                }
                // 获取ip地址
                logOperating.setIp(LogUtils.getIpAddress(request));
                // 获取操作类型：登陆
                logOperating.setOperating(pjp.getSignature().getName());
                // 遍历参数，不同参数处理不同业务
                for (Object arg : args) {
                    // 如果参数是：用户信息、部门信息、职位信息、员工信息、文件信息，则记录日志
                    if (arg instanceof IPojo) {
                        logOperating.setOperatingData(arg.toString());
                        break;
                    }
                }
                logOperating.setDate(new Date());

                logger.info("拦截到用户：{} --> 操作：{}，操作信息：{} ~~~ 时间：{}",
                        logOperating.getUser(),
                        logOperating.getOperating(),
                        logOperating.getOperatingData(),
                        logOperating.getDate());

                // 保存日志
                logMapper.insertLogOperating(logOperating);
            }
            return proceed;
        } catch (Throwable throwable) {
            logger.error("拦截到用户：{} --> 操作：{} ~~~ 出现异常：{} ~~~ 时间：{}",
                    logOperating.getUser(),
                    logOperating.getOperating(),
                    throwable.getMessage(),
                    logOperating.getDate());

            throwable.printStackTrace();
            throw new RuntimeException();
        }
    }

}
