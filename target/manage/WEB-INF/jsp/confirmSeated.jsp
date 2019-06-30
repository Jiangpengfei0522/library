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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery.dataTables.min.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.dataTables.min.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;控制台<small>&nbsp;&nbsp;&nbsp;欢迎使用五更鸡后台管理系统</small></h1>
        <form action="${pageContext.request.contextPath }/order/queryOrder" method="get">
            <div class="col-xs-3">
                <input type="text" placeholder="请输入查询学号" name="stuId" id="stuID" class="form-control">
            </div>
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
                    <td>审核状态</td>
                    <td>预约状态</td>
                    <td>操作</td>
                </tr>
                </thead>
                <c:forEach items="${requestScope.orderPageMsg.lists}" var="u">
                    <tr>
                        <td>${u.orderId}</td>
                        <td>${u.stuId}</td>
                        <td>${u.floorId}</td>
                        <td>${u.blockId}</td>
                        <td>${u.deskId}</td>
                        <td>${u.seatId}</td>
                        <td>${u.orderDate}</td>
                        <td>${u.orderTime}</td>
                        <td><a href="${pageContext.request.contextPath }/${u.arrivedPhoto}">点击查看图片</a></td>
                        <c:if test="${u.isArrived==0}">
                            <td>待审核</td>
                        </c:if>
                        <c:if test="${u.isArrived==1 || u.isArrived==2}">
                            <td>已审核</td>
                        </c:if>
                        <c:if test="${u.isUsing == 2}">
                                <td>已到达</td>
                        </c:if>
                        <c:if test="${u.isUsing == 3}">
                            <c:if test="${u.isArrived == 1}">
                                <td style="color: green">已结束</td>
                            </c:if>
                        </c:if>
                        <c:if test="${u.isUsing == 1}">
                                <td style="color: goldenrod">未到达</td>
                        </c:if>
                        <c:if test="${u.isUsing == 4}">
                            <td style="color: blue">已取消</td>
                        </c:if>
                        <c:if test="${u.isUsing == 5}">
                            <td style="color: red">违约</td>
                        </c:if>
                        <c:if test="${u.isUsing == 6}">
                            <td style="color: red">暂时离开</td>
                        </c:if>
                        <c:if test="${(u.isUsing==2 || u.isUsing==3 || u.isUsing==6) && u.isArrived==0}">
                        <td>
                            <a href="${pageContext.request.contextPath }/order/confirm?orderId=${u.orderId}" onclick="if(confirm('确认本人就坐吗？')==false)return false;">确认&nbsp;</a>
                            <a href="${pageContext.request.contextPath }/order/default?orderId=${u.orderId}" onclick="if(confirm('确认违约吗？')==false)return false;">违约</a>
                        </td>
                        </c:if>
                        <c:if test="${u.isUsing==1 || u.isUsing==4 || u.isUsing==5 || (u.isUsing==6 && u.isArrived==1) || (u.isUsing==3 && u.isArrived==1)}">
                            <td>无</td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <table id="seatConfirm" class="table">
            <tr>
                <td class="td2">
                    <span>第${requestScope.orderPageMsg.currPage }/ ${requestScope.orderPageMsg.totalPage}页</span>
                    <span>总记录数：${requestScope.orderPageMsg.totalCount }  每页显示:${requestScope.orderPageMsg.pageSize}</span>
                    <span>
           <c:if test="${requestScope.orderPageMsg.currPage != 1}">
               <a href="${pageContext.request.contextPath }/order/queryOrder?currentPage=1&stuId=${requestScope.orderPageMsg.stuId}">[首页]</a>
               <a href="${pageContext.request.contextPath }/order/queryOrder?currentPage=${requestScope.orderPageMsg.currPage-1}&stuId=${requestScope.orderPageMsg.stuId}">[上一页]</a>
           </c:if>

           <c:if test="${requestScope.orderPageMsg.currPage != requestScope.orderPageMsg.totalPage}">
               <a href="${pageContext.request.contextPath }/order/queryOrder?currentPage=${requestScope.orderPageMsg.currPage+1}&stuId=${requestScope.orderPageMsg.stuId}">[下一页]</a>
               <a href="${pageContext.request.contextPath }/order/queryOrder?currentPage=${requestScope.orderPageMsg.totalPage}&stuId=${requestScope.orderPageMsg.stuId}">[尾页]</a>
           </c:if>
       </span>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
