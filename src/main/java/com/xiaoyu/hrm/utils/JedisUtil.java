package com.xiaoyu.hrm.utils;

import com.xiaoyu.hrm.component.PowerAspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.Date;

/**
 * 操作redis的客户端jedis（工具类）
 *
 * @author xiaoyu
 * @date 2020/3/20 23:01
 */
//@Slf4j
@Component
public class JedisUtil {

    @Autowired
    private JedisPool jedisPool;

    /**
     * slf4j
     */
    private final static Logger logger = LoggerFactory.getLogger(PowerAspect.class);

    private Jedis getJedis() {
        try {
            return jedisPool.getResource();
        } catch (Exception e) {
            logger.error("获取redis连接池失败", e);
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 设置
     *
     * @param key
     * @param value
     * @return
     */
    public String set(String key, String value) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            return jedis.set(key, value);
        } catch (Exception e) {
            logger.error("set key:{} value:{} error：{}", key, value, e);
            return null;
        } finally {
            close(jedis);
        }

    }

    /**
     * 取值
     *
     * @param key
     * @param value
     * @param expireTime
     * @return
     */
    public String set(String key, String value, int expireTime) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            return jedis.setex(key, expireTime, value);
        } catch (Exception e) {
            logger.error("set key:{} value:{} expireTime:{} error：{} ~~~ 时间：{}", key, value, expireTime, e, new Date());
            return null;
        } finally {
            close(jedis);
        }

    }

    /**
     * 取值
     *
     * @param key
     * @return
     */
    public String get(String key) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            return jedis.get(key);
        } catch (Exception e) {
            logger.error("get key:{} error：{} ~~~ 时间：{}", key, e, new Date());
            return null;
        } finally {
            close(jedis);
        }

    }

    /**
     * 删除key
     * @param key
     * @return
     */
    public Long del(String key) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            return jedis.del(key.getBytes());
        } catch (Exception e) {
            logger.error("del key:{} error：{} ~~~ 时间：{}", key, e, new Date());
            return null;
        } finally {
            close(jedis);
        }

    }

    /**
     * 判断key是否存在
     * @param key
     * @return
     */
    public Boolean exists(String key) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            return jedis.exists(key.getBytes());
        } catch (Exception e) {
            logger.error("exists key:{} error：{} ~~~ 时间：{}", key, e, new Date());
            return null;
        } finally {
            close(jedis);
        }

    }

    /**
     * 设值key过期时间
     * @param key
     * @param expireTime
     * @return
     */
    public Long expire(String key, int expireTime) {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            return jedis.expire(key.getBytes(), expireTime);
        } catch (Exception e) {
            logger.error("expire key:{} error：{} ~~~ 时间：{}", key, e, new Date());
            return null;
        } finally {
            close(jedis);
        }
    }

    /**
     * 获取剩余时间
     * @param key
     * @return
     */
    public Long ttl(String key) {
        Jedis jedis = null;
        try{
            jedis = getJedis();
            return jedis.ttl(key);
        } catch (Exception e) {
            logger.error("ttl key:{} error：{} ~~~ 时间：{}", key, e, new Date());
            return null;
        } finally {
            close(jedis);
        }
    }

    private void close(Jedis jedis) {
        if (null != jedis) {
            jedis.close();
        }
    }

}
