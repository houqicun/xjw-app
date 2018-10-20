package com.hou.xjw.service.impl;

import com.hou.xjw.mapper.RoleMapper;
import com.hou.xjw.model.shiroPermission.Role;
import com.hou.xjw.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    //根据userId获取对应的所有角色
    @Override
    public List<Role> getRoleByUserId(Integer userId) {
        List<Role> list = roleMapper.getRoleByUserId(userId);
        return list;
    }

    @Override
    public List<Role> getRoleList() {
        List<Role> roleList = roleMapper.getRoleList();
        return roleList;
    }
}
