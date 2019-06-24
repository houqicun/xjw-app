package com.hou.xjw.service.impl.juhe;

import com.hou.xjw.mapper.TestMapper;
import com.hou.xjw.model.test.TestQueryLog;
import com.hou.xjw.service.juhe.QueryLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class QueryLogServiceImpl implements QueryLogService {

    @Resource
    private TestMapper testMapper;


    @Override
    public List<TestQueryLog> queryLogByParam(TestQueryLog testQueryLog) {
        List<TestQueryLog> result = testMapper.queryLogByParam(testQueryLog);
        return result;
    }
}
