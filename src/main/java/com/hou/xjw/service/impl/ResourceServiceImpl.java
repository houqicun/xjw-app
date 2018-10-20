package com.hou.xjw.service.impl;

import com.hou.xjw.mapper.ResourceMapper;
import com.hou.xjw.model.shiroPermission.Resource;
import com.hou.xjw.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;

    @Override
    public List<Resource> getResourceByRoleId(Integer roleId) {
        List<Resource> list = resourceMapper.getResourceByRoleId(roleId);
        return list;
    }

    @Override
    public List<Resource> getMenuByRoleId(Integer roleId) {
        List<Resource> list = resourceMapper.getMenuByRoleId(roleId);
        return list;
    }

    @Override
    public List<Resource> getResourceList() {
        List<Resource> resourceList = resourceMapper.getResourceList();
        return resourceList;
    }
}
