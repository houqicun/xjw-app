package com.hou.xjw.controller.shiro;

import com.alibaba.fastjson.JSONObject;
import com.hou.xjw.model.shiroPermission.Role;
import com.hou.xjw.service.RoleService;
import com.hou.xjw.util.AjaxPrint;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleService roleService;

    @RequestMapping("/toRole")
    public String toRole() {
        return "jsp/shiroManage/roleManager";
    }

    @RequestMapping("/query")
    public void query(HttpServletResponse response) {
        List<Role> roleList = roleService.getRoleList();
        String json = JSONObject.toJSONString(roleList);
        AjaxPrint.renderData(response, json);
    }
}
