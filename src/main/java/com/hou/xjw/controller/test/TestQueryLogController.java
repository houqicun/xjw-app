package com.hou.xjw.controller.test;

import com.hou.xjw.model.juhe.weatherForecast.ResponseJson;
import com.hou.xjw.service.TestQueryLogService;
import com.hou.xjw.util.AjaxPrint;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/test")
public class TestQueryLogController {

    @Resource
    private TestQueryLogService testQueryLogService;

    @RequestMapping("/query")
    public void query(HttpServletRequest request, HttpServletResponse response, Model model) {
        String cityName = request.getParameter("cityName");
        ResponseJson responseJson = testQueryLogService.testQueryAndLog(cityName);
        //model.addAttribute("responseJson", responseJson);
        AjaxPrint.renderData(response, responseJson.toString());
    }

    @RequestMapping("/toTest")
    public String toTest() {
        return "jsp/weatherManage/weatherQuery";
    }
}
