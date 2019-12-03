<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html  class="x-admin-sm">
<head>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
	<meta charset="UTF-8">
	<title>遇您识货后台登录</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${PATH}/static/css/font.css">
    <link rel="stylesheet" href="${PATH}/static/css/login.css">
	<link rel="stylesheet" href="${PATH}/static/css/xadmin.css">
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">遇您识货后台登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" action="${PATH}/admin/loginInto" class="layui-form" >
            <input name="adminName" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="adminPassword" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
        <h3 align="center" style="color: red;">${msg }</h3>
    </div>

    <script>
        
    </script>
    <!-- 底部结束 -->
   
</body>
</html>