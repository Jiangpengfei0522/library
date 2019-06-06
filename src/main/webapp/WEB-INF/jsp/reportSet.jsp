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
                <td>操作</td>
            </tr>
            </thead>
            <c:forEach items="${requestScope.reportPageMsg.lists}" var="u">
                <tr>
                    <th>${u.reportId}</th>
                    <th>${u.stuId}</th>
                    <th>${u.floorId}</th>
                    <th>${u.blockId}</th>
                    <th>${u.deskId}</th>
                    <th>${u.seatId}</th>
                    <th>${u.reportDate}</th>
                    <th>${u.reportTime}</th>
                    <th>
                        <a href="${pageContext.request.contextPath }/report/updateConfirm?isConfirmed=1&reportId=${u.reportId}">确认违约&nbsp;</a>
                        <a href="${pageContext.request.contextPath }/report/updateConfirm?isConfirmed=2&reportId=${u.reportId}">暂时离座&nbsp;</a>
                        <a href="${pageContext.request.contextPath }/report/updateConfirm?isConfirmed=3&reportId=${u.reportId}">恶意举报</a>
                    </th>
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
