<%--
  Created by IntelliJ IDEA.
  User: hqc
  Date: 2018/4/5
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
</head>
<body>
<shiro:user>
    欢迎[<shiro:principal property="userName" />]登录，<a href="${pageContext.request.contextPath}/shiro-logout">退出</a>
</shiro:user>
    <form action="/test/query.hou" method="post">
        <input type="text" name="cityName">
        <shiro:hasPermission name="test/query">
            <input type="submit" value="post"/>
        </shiro:hasPermission>
    </form>
</body>
</html>
