package com.hou.xjw.controller.shiro;

import com.alibaba.fastjson.JSONObject;
import com.hou.xjw.model.shiroPermission.User;
import com.hou.xjw.service.UserService;
import com.hou.xjw.util.AjaxPrint;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("/toUser")
    public String toUser() {
        return "jsp/shiroManage/userManager";
    }

    @RequestMapping("/query")
    public void query(HttpServletResponse response) {
        List<User> userList = userService.getUserList();
        String json = JSONObject.toJSONString(userList);
        AjaxPrint.renderData(response, json);
    }

}
