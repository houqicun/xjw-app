package com.hou.xjw.controller.juhe;

import com.alibaba.fastjson.JSONObject;
import com.hou.xjw.model.juhe.weatherForecast.ResponseJson;
import com.hou.xjw.service.juhe.WeatherQueryService;
import com.hou.xjw.util.AjaxPrint;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/juheWeather")
public class WeatherQueryController {

    @Resource
    private WeatherQueryService weatherQueryService;

    @RequestMapping("/toQuery")
    public String toQuery() {
        return "jsp/weatherManage/weatherQuery";
    }

    @RequestMapping("/query")
    public void queryWeather(HttpServletRequest request, HttpServletResponse response) {
        String cityName = request.getParameter("cityName");
        ResponseJson responseJson = weatherQueryService.getQueryResponse(cityName);
        String json = JSONObject.toJSONString(responseJson);
        AjaxPrint.renderData(response, json);
    }

}
