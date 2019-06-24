package com.hou.xjw.cache;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.Cache;
import org.springframework.cache.support.SimpleValueWrapper;
import org.springframework.util.Assert;

import java.io.Serializable;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;

/*
* spring对外缓存管理的统一接口工具类---GUAVA CACHE
* create by houqc 2018/4/30
* */

public class GuavaCache implements Cache {

    private static Logger logger = LoggerFactory.getLogger(GuavaCache.class);

    private static final Object NULL_HOLDER = new NullHolder();

    private final String name;

    private final com.google.common.cache.Cache<Object, Object> cache;

    private final boolean allowNullValues;

    public GuavaCache(com.google.common.cache.Cache<Object, Object> cache) {
        this("", cache, true);
    }

    public GuavaCache(String name, com.google.common.cache.Cache<Object, Object> cache) {
        this(name, cache, true);
    }

    public GuavaCache(String name, com.google.common.cache.Cache<Object, Object> cache, boolean allowNullValues) {
        Assert.notNull(name, "Name must not be null");
        Assert.notNull(cache, "Cache must not be null");
        this.name = name;
        this.cache = cache;
        this.allowNullValues = allowNullValues;
    }

    @Override
    public String getName() {
        return this.name;
    }

    @Override
    public Object getNativeCache() {
        return this.cache;
    }

    @Override
    public ValueWrapper get(Object key) {
        //key = getKey(key.toString());
        Object value = this.cache.getIfPresent(key);
        logger.info("获取缓存key={}，获取对象values={}", key, value);
        return toWrapper(value);
    }

    @Override
    public <T> T get(Object key, Class<T> type) {
        //key = getKey(key.toString());
        Object value = fromStoreValue(this.cache.getIfPresent(key));
        logger.info("获取缓存key={}，获取对象values={}", key, value);
        if (value != null && type != null && !type.isInstance(key)) {
            throw new IllegalStateException("Cached value is not of required type [" + type.getName() + "]: " + value);
        }
        return (T) value;
    }

    @Override
    public <T> T get(Object o, Callable<T> callable) {
        return null;
    }

    @Override
    public void put(Object key, Object value) {
        //key = getKey(key.toString());
        this.cache.put(key, toStoreValue(value));
        logger.info("存入缓存key={},存入对象={}", key, value);
    }

    @Override
    public ValueWrapper putIfAbsent(Object key, Object value) {
        try {
            PutIfAbsentCallable callable = new PutIfAbsentCallable(value);
            Object result = this.cache.get(key, callable);
            return (callable.called ? null : toWrapper(result));
        }
        catch (ExecutionException ex) {
            throw new IllegalStateException(ex);
        }
    }

    @Override
    public void evict(Object key) {
        this.cache.invalidate(key);
        logger.info("删除缓存key={}",key);
    }

    @Override
    public void clear() {
        this.cache.invalidateAll();
        logger.info("清空guavacache所有缓存");
    }

    @SuppressWarnings("serial")
    private static class NullHolder implements Serializable {
    }

    /**实现key增加cache名称**/
    private String getKey(String key) {
        return name + "_" + key;
    }

    private ValueWrapper toWrapper(Object value) {
        return (value != null ? new SimpleValueWrapper(fromStoreValue(value)) : null);
    }

    protected Object fromStoreValue(Object storeValue) {
        if (this.allowNullValues && storeValue == NULL_HOLDER) {
            return null;
        }
        return storeValue;
    }

    protected Object toStoreValue(Object userValue) {
        if (this.allowNullValues && userValue == null) {
            return NULL_HOLDER;
        }
        return userValue;
    }

    private class PutIfAbsentCallable implements Callable<Object> {

        private final Object value;

        private boolean called;

        public PutIfAbsentCallable(Object value) {
            this.value = value;
        }

        @Override
        public Object call() throws Exception {
            this.called = true;
            return toStoreValue(this.value);
        }
    }
}
