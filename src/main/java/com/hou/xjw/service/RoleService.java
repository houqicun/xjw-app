package com.hou.xjw.service;

import com.hou.xjw.model.shiroPermission.Role;

import java.util.List;

public interface RoleService {

    List<Role> getRoleByUserId(Integer userId);

}
