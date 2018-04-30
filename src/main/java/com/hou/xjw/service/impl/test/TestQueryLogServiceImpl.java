package com.hou.xjw.service.impl.test;

import com.hou.xjw.mapper.TestMapper;
import com.hou.xjw.model.juhe.weatherForecast.ResponseJson;
import com.hou.xjw.model.test.TestQueryLog;
import com.hou.xjw.service.TestQueryLogService;
import com.hou.xjw.utils.HttpClientUtil;
import com.hou.xjw.utils.JsonUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.net.URLEncoder;
import java.util.Date;

@Service
public class TestQueryLogServiceImpl implements TestQueryLogService {

    protected static Logger logger = Logger.getLogger(TestQueryLogServiceImpl.class);

    @Resource
    private TestMapper testMapper;

    @Override
    public ResponseJson testQueryAndLog(String cityName) {
        String cnUrlencode;

        try {
            cnUrlencode = URLEncoder.encode(cityName, "utf-8");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        String url= "http://v.juhe.cn/weather/index?cityname=" + cnUrlencode
                + "&dtype=json&format=2&key=6a4bccd1596cf1a017a4c2b379260aad";

        logger.info("run WeatherForecastServlet.doPost ; get cityName : " + cityName);
        logger.info("post url : " + url);

        String weatherJson = HttpClientUtil.get(url);
        ResponseJson responseJson = JsonUtil.getObject(weatherJson, ResponseJson.class);
        logger.info("responseJson is : " + responseJson);

        //添加查询记录-----测试
        TestQueryLog testQueryLog = buildTestQueryLog(cityName, responseJson);
        testMapper.addQueryLog(testQueryLog);

        return responseJson;
    }

    //如果要有类似功能 应有请求地址等等
    private TestQueryLog buildTestQueryLog(String cityName, ResponseJson responseJson) {
        TestQueryLog testQueryLog = new TestQueryLog();
        testQueryLog.setReqAddr(cityName);
        testQueryLog.setReqTime(new Date());
        testQueryLog.setRespCode(responseJson.getResultcode());
        testQueryLog.setRespJson(responseJson.getResult());
        return testQueryLog;
    }
}
