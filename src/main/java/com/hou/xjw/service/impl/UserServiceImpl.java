package com.hou.xjw.service.impl;

import com.google.common.collect.Maps;
import com.hou.xjw.mapper.UserMapper;
import com.hou.xjw.model.shiroPermission.User;
import com.hou.xjw.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    //验证用户登陆
    @Override
    public Map<String, Object> doUserLogin(User user) {
        HashMap retMap = Maps.newHashMap();
        String userName = user.getUserName();
        String password = user.getPassword();
        User retUser = userMapper.getUserForLogin(userName, password);
        retMap.put("retUser", retUser);
        return retMap;
    }

    @Override
    public List<User> getUserList() {
        List<User> userList = userMapper.getUserList();
        return userList;
    }
}
