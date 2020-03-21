package com.xiaoyu.hrm.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

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

    private Jedis getJedis() {
        return jedisPool.getResource();
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
//            log.error("set key:{} value:{} error", key, value, e);
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
//            log.error("set key:{} value:{} expireTime:{} error", key, value, expireTime, e);
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
//            log.error("get key:{} error", key, e);
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
//            log.error("del key:{} error", key, e);
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
//            log.error("exists key:{} error", key, e);
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
//            log.error("expire key:{} error", key, e);
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
//            log.error("ttl key:{} error", key, e);
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
