package com.xiaoyu.hrm.utils;

import com.alibaba.fastjson.JSON;
import com.xiaoyu.hrm.pojo.User;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * 记录日志的工具类：根据获取token获取用户信息、获取ip地址
 * 
 * @author xiaoyu
 * @date 2020/7/13 9:44
 */
public class LogUtils {

    /**
     * 根据token获取用户信息
     *
     * @param JedisUtil redis
     * @param request request
     * @return
     */
    public static User getUserInfoByToken(JedisUtil jedisUtil, HttpServletRequest request) {
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
     * @param request request
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
