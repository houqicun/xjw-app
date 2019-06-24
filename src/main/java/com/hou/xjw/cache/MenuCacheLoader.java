package com.hou.xjw.cache;

/*
* 根据角色id获取该角色对应的菜单权限，并且加载进缓存
* 该loader主要用于控制不同角色的菜单展示
* */

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.google.common.collect.Lists;
import com.google.gson.JsonArray;
import com.hou.xjw.model.shiroPermission.Resource;
import com.hou.xjw.model.shiroPermission.Role;
import com.hou.xjw.model.shiroPermission.User;
import com.hou.xjw.service.ResourceService;
import com.hou.xjw.service.RoleService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;

import java.util.List;

public class MenuCacheLoader implements CacheLoader{

    @javax.annotation.Resource
    private ResourceService resourceService;

    @javax.annotation.Resource
    private RoleService roleService;

    private GuavaCache guavaCache;

    private User user;

    private static final String MENU_LIST = "menu_list";

    private static final String GUAVACACHE = "indexReptileKeyValue";

    private void getCurrentUser() {
        //从Session中获取当前登陆的user对象
        Session session = SecurityUtils.getSubject().getSession();
        user = (User) session.getAttribute("loginUser");
    }

    @Override
    public void doCacheLoad() {
        getCurrentUser();
        Integer userId = user.getId();
        List<Role> roleList = roleService.getRoleByUserId(userId);
        //目前只有一个user对应一个role，此处为预留写法
        if (roleList != null && roleList.size() > 0) {
            for (Role role : roleList) {
                List<Resource> menuList = resourceService.getMenuByRoleId(role.getId());
                String menuJson = buildMenuJson(menuList);
                Cache<Object, Object> cache = CacheBuilder.newBuilder().build();
                guavaCache = new GuavaCache(GUAVACACHE, cache);
                String cacheMenu = String.valueOf(guavaCache.get(MENU_LIST));
                if (StringUtils.isBlank(cacheMenu) || StringUtils.equals("null", cacheMenu)) {
                    guavaCache.put(MENU_LIST, menuJson);
                    System.out.println(guavaCache);
                }
            }
        }
    }

    public org.springframework.cache.Cache.ValueWrapper getCacheValues(Object key) {
        org.springframework.cache.Cache.ValueWrapper values = guavaCache.get(key);
        return values;
    }

    @Override
    public void doCacheLoadById(Integer id) {

    }

    @Override
    public void doCacheLoadByModel(Object o) {

    }

    //构造菜单json字符串
    private String buildMenuJson(List<Resource> menuList) {
        List<Resource> menu = Lists.newArrayList();
        for (Resource mainMenu : menuList) {
            if (mainMenu.getParentId() == null) {
                menu.add(mainMenu);
                for (Resource nodeMenu : menuList) {
                    if (nodeMenu.getParentId() == mainMenu.getId()) {
                        menu.add(nodeMenu);
                    }
                }
            }
        }
        String menuJson = JSON.toJSONString(menu);
        return menuJson;
    }
}
