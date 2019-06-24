package com.hou.xjw.controller;

import com.alibaba.fastjson.JSONObject;
import com.hou.xjw.model.test.TestQueryLog;
import com.hou.xjw.service.juhe.QueryLogService;
import com.hou.xjw.util.AjaxPrint;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/juheQueryLog")
public class QueryLogController {

    @Resource
    private QueryLogService queryLogService;

    @RequestMapping("/toQuery")
    public String toQuery() {
        return "jsp/weatherManage/queryLog";
    }

    @RequestMapping("/query")
    public void query(HttpServletRequest request, HttpServletResponse response) {
        String reqAddr = request.getParameter("reqAddr");
        String respCode = request.getParameter("respCode");
//        String startTime = request.getParameter("startTime");
//        String endTime = request.getParameter("endTime");
        TestQueryLog testQueryLog = buildTestQueryLog(reqAddr, respCode);
        List<TestQueryLog> result = queryLogService.queryLogByParam(testQueryLog);
        String json = JSONObject.toJSONString(result);
        AjaxPrint.renderData(response, json);
    }

    private TestQueryLog buildTestQueryLog(String reqAddr, String respCode) {
        TestQueryLog testQueryLog = new TestQueryLog();
        testQueryLog.setReqAddr(reqAddr);
        testQueryLog.setRespCode(respCode);
//        testQueryLog.setStartTime(startTime);
//        testQueryLog.setEndTime(endTime);
        return testQueryLog;
    }

}
