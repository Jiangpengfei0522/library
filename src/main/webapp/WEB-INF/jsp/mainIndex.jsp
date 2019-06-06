<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/22
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <title>五更鸡后台管理</title>
</head>
<body>
        <nav class="navbar">
            <div class="logo">
                <a href="#"><img src="${pageContext.request.contextPath }/image/logo_small.png" height="55" width="56"></a>
                <a href="#">图书馆预约系统管理平台</a>
            </div>
            <ul class="nav navbar-nav navbar-right mynavbar">
                <li class="col-xs-6"><a href="#"><span class="glyphicon glyphicon-user">&nbsp;Jiangpengfei</span></a></li>
                <li class="col-xs-6"><a href="#"><span class="glyphicon glyphicon-off">注销</span></a></li>
            </ul>

        </nav>
        <div class="navbar-default navbar-collapse" id="slider_left">
            <ul class="nav slider">
                <li>
                    <a href="${pageContext.request.contextPath }/library/accountCheck">账户审核</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/library/confirmSeated">确认是否本人就坐</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/library/seatCondition" >座位情况</a>
                </li>
                <li>
                    <a href="#sub1" data-toggle="collapse">数据统计
                        <span class="glyphicon glyphicon-menu-right pull-right"></span>
                    </a>
                </li>
                <ul id="sub1" class="nav collapse">
                    <li><a href="${pageContext.request.contextPath }/library/arrivedPeople" >&nbsp;&nbsp;到达人数统计</a></li>
                    <li><a href="${pageContext.request.contextPath }/library/lostFaithPeople" >&nbsp;&nbsp;失信人数统计</a></li>
                </ul>
                <li>
                    <a href="${pageContext.request.contextPath }/library/accountAuthority">账户恢复/禁用</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath }/library/reportSet">举报记录</a>
                </li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;控制台<small>&nbsp;&nbsp;&nbsp;欢迎使用五更鸡后台管理系统</small></h1>
        </div>
</body>
</html>
