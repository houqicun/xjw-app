package com.hou.xjw.cache;

/*
* 标准化CacheLoader
* */

public interface CacheLoader {

    //查询数据加载进缓存
    void doCacheLoad();

    //指定查询某一条数据加载
    void doCacheLoadById(Integer id);

    //直接将一个对象加载
    void doCacheLoadByModel(Object o);

}
