package com.hou.xjw.service.juhe;

import com.hou.xjw.model.test.TestQueryLog;

import java.util.List;

public interface QueryLogService {

    List<TestQueryLog> queryLogByParam(TestQueryLog testQueryLog);

}
