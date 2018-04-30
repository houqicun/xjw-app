
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理系统 - 登陆</title>
    <link rel="shortcut icon" href="../favicon.ico">
    <link href="/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">
    <script src="/js/content.min.js?v=1.0.0"></script>
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="/js/plugins/validate/messages_zh.min.js"></script>
    <script src="/js/demo/form-validate-demo.min.js"></script>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div class="m-b-md">
            <img alt="image" class="img-circle circle-border" src="/img/login1.jpg">
        </div>
        <h3>欢迎使用</h3>
        <p>请登陆您的账号</p>
        <form class="m-t" id="loginForm" role="form" action="/login/login.hou" method="post" target="_parent">
            <div class="form-group">
                <input type="text" id="userName" class="form-control uname" name="userName" placeholder="用户名">
            </div>
            <div class="form-group">
                <input type="password" id="password" class="form-control pword m-b" name="password" placeholder="密码">
            </div>
            <c:if test="${loginMsg != null}">
                <div class="form-group">
                    <div class="alert alert-danger alert-dismissable">
                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                            ${loginMsg}.
                    </div>
                </div>
            </c:if>
            <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>
            <p class="text-muted text-center">
                <a href=""><small>忘记密码?</small></a> | <a href="/reg/toRegist.hou" target="_parent">注册</a>
            </p>
        </form>
    </div>
</div>
</body>
</html>
