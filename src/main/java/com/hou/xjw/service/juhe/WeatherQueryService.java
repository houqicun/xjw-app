package com.hou.xjw.service.juhe;

import com.hou.xjw.model.juhe.weatherForecast.ResponseJson;

public interface WeatherQueryService {

    ResponseJson getQueryResponse(String cityName);

}
