<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>TEST</title>
    <body>
    <label>TEST</label>
    <form action="/WeatherForecast" method="post">
        <input type="text" name="cityName">
        <input type="submit" value="post"/>
    </form>
    <label>--------------------测试-----------------------</label>
    <form action="test/query.hou" method="post">
        <input type="text" name="cityName">
        <input type="submit" value="post"/>
    </form>
</body>
</html>
