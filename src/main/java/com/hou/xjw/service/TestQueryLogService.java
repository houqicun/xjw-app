package com.hou.xjw.service;

import com.hou.xjw.model.juhe.weatherForecast.ResponseJson;
import com.hou.xjw.model.test.TestQueryLog;

public interface TestQueryLogService {

    ResponseJson testQueryAndLog(String cityName);

}
