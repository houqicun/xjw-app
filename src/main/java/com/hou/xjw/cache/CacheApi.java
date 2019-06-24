package com.hou.xjw.cache;

import com.hou.xjw.model.shiroPermission.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.cache.Cache;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/*
* 获取缓存内容的服务
* */
@Service
public class CacheApi {

    @Resource
    private MenuCacheLoader menuCacheLoader;

    private static final String MENU_LIST = "menu_list";

    private static final String GUAVACACHE = "indexReptileKeyValue";

    public String getMenu() {
        Cache.ValueWrapper valueWrapper = menuCacheLoader.getCacheValues(MENU_LIST);
        Object menuList = valueWrapper.get();
        String a = String.valueOf(menuList);
        return a;
    }

    public String getResource() {
        return null;
    }

    public User getCurrentUser() {
        Session session = SecurityUtils.getSubject().getSession();
        User user = (User) session.getAttribute("loginUser");
        return user;
    }

    public Object getCacheByKey(Object key) {
        return null;
    }
}
