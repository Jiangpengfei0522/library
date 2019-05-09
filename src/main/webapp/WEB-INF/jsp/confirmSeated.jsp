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
        <form action="${pageContext.request.contextPath }/order/queryOrder" method="get">
            <input type="submit" value="查询" class="btn btn-default" id="btn_submit">
        </form>
        <%--<button type="button" id="btn_submit">查询</button>--%>
        <c:if test="${empty requestScope.orderPageMsg}">
            没有任何用户信息
        </c:if>
        <c:if test="${!empty requestScope.orderPageMsg}">
            <table  class="table">
                <thead>
                <tr>
                    <td>订单号</td>
                    <td>学号</td>
                    <td>楼层号</td>
                    <td>区号</td>
                    <td>桌子号</td>
                    <td>座位号</td>
                    <td>预约日期</td>
                    <td>预约时间</td>
                    <td>确认照片</td>
                    <td>操作</td>
                </tr>
                </thead>
                <c:forEach items="${requestScope.orderPageMsg.lists}" var="u">
                    <tr>
                        <th>${u.orderId}</th>
                        <th>${u.stuId}</th>
                        <th>${u.floorId}</th>
                        <th>${u.blockId}</th>
                        <th>${u.deskId}</th>
                        <th>${u.seatId}</th>
                        <th>${u.orderDate}</th>
                        <th>${u.orderTime}</th>
                        <th><a href="${u.arrivedPhoto}">点击查看图片</a></th>
                        <th><a href="${pageContext.request.contextPath }/order/confirm?orderId=${u.orderId}">确认本人到达</a></th>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <table   class="table">
            <tr>
                <td class="td2">
                    <span>第${requestScope.orderPageMsg.currPage }/ ${requestScope.orderPageMsg.totalPage}页</span>
                    <span>总记录数：${requestScope.orderPageMsg.totalCount }  每页显示:${requestScope.orderPageMsg.pageSize}</span>
                    <span>
           <c:if test="${requestScope.orderPageMsg.currPage != 1}">
               <a href="${pageContext.request.contextPath }/order/queryOrder?currentPage=1">[首页]</a>
               <a href="${pageContext.request.contextPath }/order/queryOrder?currentPage=${requestScope.orderPageMsg.currPage-1}">[上一页]</a>
           </c:if>

           <c:if test="${requestScope.orderPageMsg.currPage != requestScope.orderPageMsg.totalPage}">
               <a href="${pageContext.request.contextPath }/order/queryOrder?currentPage=${requestScope.orderPageMsg.currPage+1}">[下一页]</a>
               <a href="${pageContext.request.contextPath }/order/queryOrder?currentPage=${requestScope.orderPageMsg.totalPage}">[尾页]</a>
           </c:if>
       </span>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
