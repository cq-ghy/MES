//package com.haoyu.service;
//
//import javax.annotation.Resource;
//
//import org.springframework.stereotype.Service;
//
//import com.google.common.base.Joiner;
//import com.haoyu.beans.CacheKeyConstants;
//import com.haoyu.util.JsonMapper;
//
//import lombok.extern.slf4j.Slf4j;
//import redis.clients.jedis.ShardedJedis;
//
////@Service
//@Slf4j
//public class SysCacheService {
//
////    @Resource(name = "redisPool")
//    private RedisPool redisPool;
//
//    public void saveCache(String toSavedValue, int timeoutSeconds, CacheKeyConstants prefix) {
//        saveCache(toSavedValue, timeoutSeconds, prefix, null);
//    }
//
//    public void saveCache(String toSavedValue, int timeoutSeconds, CacheKeyConstants prefix, String... keys) {
//        if (toSavedValue == null) {
//            return;
//        }
//        ShardedJedis shardedJedis = null;
//        try {
//            String cacheKey = generateCacheKey(prefix, keys);
//            shardedJedis = redisPool.instance();
//            shardedJedis.setex(cacheKey, timeoutSeconds, toSavedValue);
//        } catch (Exception e) {
//            log.error("save cache exception, prefix:{}, keys:{}", prefix.name(), JsonMapper.obj2String(keys), e);
//        } finally {
//            redisPool.safeClose(shardedJedis);
//        }
//    }
//
//    public String getFromCache(CacheKeyConstants prefix, String... keys) {
//        ShardedJedis shardedJedis = null;
//        String cacheKey = generateCacheKey(prefix, keys);
//        try {
//            shardedJedis = redisPool.instance();
//            String value = shardedJedis.get(cacheKey);
//            return value;
//        } catch (Exception e) {
//            log.error("get from cache exception, prefix:{}, keys:{}", prefix.name(), JsonMapper.obj2String(keys), e);
//            return null;
//        } finally {
//            redisPool.safeClose(shardedJedis);
//        }
//    }
//
//    private String generateCacheKey(CacheKeyConstants prefix, String... keys) {
//        String key = prefix.name();
//        if (keys != null && keys.length > 0) {
//            key += "_" + Joiner.on("_").join(keys);
//        }
//        return key;
//    }
//}
