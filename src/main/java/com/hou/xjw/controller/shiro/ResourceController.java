package com.hou.xjw.controller.shiro;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.hou.xjw.service.ResourceService;
import com.hou.xjw.util.AjaxPrint;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/resource")
public class ResourceController {

    @Resource
    private ResourceService resourceService;

    @RequestMapping("/toResource")
    public String toResource() {
        return "jsp/shiroManage/resourceManager";
    }

    @RequestMapping("/query")
    public void query(HttpServletResponse response) {
        List<com.hou.xjw.model.shiroPermission.Resource> resourceList
                = resourceService.getResourceList();
        String json = JSONObject.toJSONString(resourceList, SerializerFeature.WriteNullStringAsEmpty);
        AjaxPrint.renderData(response, json);
    }

}
