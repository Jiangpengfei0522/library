<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/23
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;控制台<small>&nbsp;&nbsp;&nbsp;欢迎使用五更鸡后台管理系统</small></h1>
    <form action="${pageContext.request.contextPath }/report/queryReport" method="get">
        <div class="col-xs-3">
            <input type="text" placeholder="请输入查询学号" name="stuId" id="stuID" class="form-control">
        </div>
        <input type="submit" value="查询" class="btn btn-default" id="btn_submit">
    </form>
    <%--<button type="button" id="btn_submit">查询</button>--%>
    <c:if test="${empty requestScope.reportPageMsg}">
        没有任何用户信息
    </c:if>
    <c:if test="${!empty requestScope.reportPageMsg}">
        <table  class="table">
            <thead>
            <tr>
                <td>序号</td>
                <td>举报者学号</td>
                <td>楼层号</td>
                <td>区号</td>
                <td>桌子号</td>
                <td>座位号</td>
                <td>举报日期</td>
                <td>举报时间</td>
                <td>处理状态</td>
                <td>操作</td>
            </tr>
            </thead>
            <c:forEach items="${requestScope.reportPageMsg.lists}" var="u">
                <tr>
                    <td>${u.reportId}</td>
                    <td>${u.stuId}</td>
                    <td>${u.floorId}</td>
                    <td>${u.blockId}</td>
                    <td>${u.deskId}</td>
                    <td>${u.seatId}</td>
                    <td>${u.reportDate}</td>
                    <td>${u.reportTime}</td>
                    <c:if test="${u.isConfirmed==0}">
                        <td style="color: goldenrod">未处理</td>
                        <td>
                            <a href="${pageContext.request.contextPath }/report/updateConfirm?isConfirmed=1&reportId=${u.reportId}" onclick="if(confirm('确认为违约吗？')==false)return false;">确认违约&nbsp;</a>
                            <a href="${pageContext.request.contextPath }/report/updateConfirm?isConfirmed=3&reportId=${u.reportId}" onclick="if(confirm('确认为恶意举报吗？')==false)return false;">恶意举报</a>
                        </td>
                    </c:if>
                    <c:if test="${u.isConfirmed==1 || u.isConfirmed==3}">
                        <td style="color: green">已处理</td>
                        <td>无</td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <table   class="table">
        <tr>
            <td class="td2">
                <span>第${requestScope.reportPageMsg.currPage }/ ${requestScope.reportPageMsg.totalPage}页</span>
                <span>总记录数：${requestScope.reportPageMsg.totalCount }  每页显示:${requestScope.reportPageMsg.pageSize}</span>
                <span>
           <c:if test="${requestScope.reportPageMsg.currPage != 1}">
               <a href="${pageContext.request.contextPath }/report/queryReport?currentPage=1">[首页]</a>
               <a href="${pageContext.request.contextPath }/report/queryReport?currentPage=${requestScope.reportPageMsg.currPage-1}">[上一页]</a>
           </c:if>

           <c:if test="${requestScope.reportPageMsg.currPage != requestScope.reportPageMsg.totalPage}">
               <a href="${pageContext.request.contextPath }/report/queryReport?currentPage=${requestScope.reportPageMsg.currPage+1}">[下一页]</a>
               <a href="${pageContext.request.contextPath }/report/queryReport?currentPage=${requestScope.reportPageMsg.totalPage}">[尾页]</a>
           </c:if>
       </span>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
