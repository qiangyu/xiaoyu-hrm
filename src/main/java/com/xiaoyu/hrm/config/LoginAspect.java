package com.xiaoyu.hrm.config;

import com.alibaba.fastjson.JSON;
import com.xiaoyu.hrm.mapper.ILogMapper;
import com.xiaoyu.hrm.pojo.LogLogin;
import com.xiaoyu.hrm.pojo.ResultBean;
import com.xiaoyu.hrm.pojo.User;
import com.xiaoyu.hrm.utils.JedisUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 记录登陆的aop
 *
 * @author xiaoyu
 * @date 2020/7/12 17:04
 */
@Aspect
@Component
public class LoginAspect {

    /**
     * 操作redis
     */
    @Autowired
    private JedisUtil jedisUtil;

    @Autowired
    private ILogMapper logMapper;

    @Autowired
    private LogLogin logLogin;

    @Pointcut("execution(public * com.xiaoyu.hrm.controller.LoginController.log*(..))")
    private void loginPointcut() {}

    /**
     * 记录日志
     * @param pjp
     * @return
     * @throws Throwable
     */
    @Around(value = "loginPointcut()")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        // 获取 request 域
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        assert attributes != null;
        HttpServletRequest request = attributes.getRequest();

        // 获取方法全部参数
        Object[] args = pjp.getArgs();

        // 获取用户账号
        User userInfo = getUserInfoByToken(request);
        if (userInfo != null) {
            logLogin.setUser(userInfo.getLoginname());
        }

        // 执行目标方法
        Object proceed = pjp.proceed(args);
        ResultBean result = (ResultBean) proceed;

        // 登陆成功，记录登录日志
        if (result.getStatus() == 200) {

            if (StringUtils.isEmpty(logLogin.getUser())) {
                // 获取用户账号
                userInfo = (User) result.getObj();
                logLogin.setUser(userInfo.getLoginname());
            }
            // 获取ip地址
            logLogin.setIp(getIpAddress(request));
            // 获取操作类型：登陆
            logLogin.setOperating(pjp.getSignature().getName());
            logLogin.setDate(new Date());
            // 保存日志
            logMapper.insertLogLogin(logLogin);
        }
        return proceed;
    }

    /**
     * 根据token获取用户信息
     * @param request
     * @return
     */
    private User getUserInfoByToken(HttpServletRequest request) {
        // 从请求头获取 token
        String token = request.getHeader("token");
        // 如 token 为空，则没登录
        if (StringUtils.isEmpty(token)) {
            return null;
        }
        // token 为key，在redis中查询
        String jsonUser = jedisUtil.get(token);
        // 如果不存在则用户没登录
        if (StringUtils.isEmpty(jsonUser)) {
            return null;
        }
        return JSON.parseObject(jsonUser, User.class);
    }


    /**
     * 获取用户真实IP地址，不使用request.getRemoteAddr();的原因是有可能用户使用了代理软件方式避免真实IP地址,
     * <p>
     * 可是，如果通过了多级反向代理的话，X-Forwarded-For的值并不止一个，而是一串IP值，究竟哪个才是真正的用户端的真实IP呢？
     * 答案是取X-Forwarded-For中第一个非unknown的有效IP字符串。
     * <p>
     * 如：X-Forwarded-For：192.168.1.110, 192.168.1.120, 192.168.1.130,
     * 192.168.1.100
     * <p>
     * 用户真实IP为： 192.168.1.110
     *
     * @param request
     * @return
     */
    public static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("X-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

}
