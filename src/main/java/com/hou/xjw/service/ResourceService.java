package com.hou.xjw.service;

import com.hou.xjw.model.shiroPermission.Resource;

import java.util.List;

public interface ResourceService {

    List<Resource> getResourceByRoleId(Integer roleId);

    List<Resource> getMenuByRoleId(Integer roleId);

    List<Resource> getResourceList();
}
