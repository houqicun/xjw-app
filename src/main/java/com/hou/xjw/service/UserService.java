package com.hou.xjw.service;

import com.hou.xjw.model.shiroPermission.User;

import java.util.Map;

public interface UserService {

    Map<String, Object> doUserLogin(User user);

}
