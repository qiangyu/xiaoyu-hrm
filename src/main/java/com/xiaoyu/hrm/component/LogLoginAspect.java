package com.xiaoyu.hrm.component;

import com.alibaba.fastjson.JSON;
import com.xiaoyu.hrm.mapper.ILogMapper;
import com.xiaoyu.hrm.pojo.LogLogin;
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
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 记录登陆日志的aop
 *
 * @author xiaoyu
 * @date 2020/7/12 17:04
 */
@Aspect
@Component
public class LogLoginAspect {

    /**
     * 操作redis
     */
    @Autowired
    private JedisUtil jedisUtil;

    @Autowired
    private ILogMapper logMapper;

    @Autowired
    private LogLogin logLogin;

    /**
     * slf4j
     */
    private final static Logger logger = LoggerFactory.getLogger(PowerAspect.class);

    @Pointcut("execution(public * com.xiaoyu.hrm.controller.LoginController.log*(..))")
    private void loginPointcut() {
    }

    /**
     * 记录日志
     *
     * @param pjp
     * @return
     * @throws Throwable
     */
    @Around(value = "loginPointcut()")
    public Object around(ProceedingJoinPoint pjp) {
        try {
            // 获取 request 域
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            assert attributes != null;
            HttpServletRequest request = attributes.getRequest();

            // 获取方法全部参数
            Object[] args = pjp.getArgs();

            // 获取用户账号
            User userInfo = LogUtils.getUserInfoByToken(jedisUtil, request);
            if (userInfo != null) {
                logLogin.setUser(userInfo.getLoginname());
            }

            // 执行目标方法
            Object proceed = null;

            proceed = pjp.proceed(args);

            if (proceed == null) {
                return null;
            }
            ResultBean result = (ResultBean) proceed;

            // 登陆成功，记录登录日志
            if (result.getStatus() == 200) {

                if (StringUtils.isEmpty(logLogin.getUser())) {
                    // 获取用户账号
                    userInfo = (User) result.getObj();
                    logLogin.setUser(userInfo.getLoginname());
                }
                // 获取ip地址
                logLogin.setIp(LogUtils.getIpAddress(request));
                // 获取操作类型：登陆
                logLogin.setOperating(pjp.getSignature().getName());
                logLogin.setDate(new Date());
                logger.info("拦截到用户：{} --> 操作：登陆，~~~ 时间：{}",
                        logLogin.getUser(),
                        logLogin.getDate());

                // 保存日志
                logMapper.insertLogLogin(logLogin);
            }
            return proceed;
        } catch (Throwable throwable) {
            logger.error("拦截到用户：{} --> 操作：{} ~~~ 出现异常：{} ~~~ 时间：{}",
                    logLogin.getUser(),
                    logLogin.getOperating(),
                    throwable.getMessage(),
                    logLogin.getDate());

            throwable.printStackTrace();
            throw new RuntimeException();
        }
    }

}
