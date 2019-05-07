<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/23
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../../css/header.css" type="text/css">
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;控制台<small>&nbsp;&nbsp;&nbsp;欢迎使用五更鸡后台管理系统</small></h1>

        <form action="/user/doAuthQuery" method="get">
            <div class="col-xs-3">
                <input type="text" placeholder="请输入查询学号" name="stuId" id="stuID" class="form-control">
            </div>
            <input type="submit" value="查询" class="btn btn-default" id="btn_submit">
        </form>
        <%--<button type="button" id="btn_submit">查询</button>--%>
        <c:if test="${empty requestScope.pageMsgForAuth}">
            没有任何用户信息！
        </c:if>
        <c:if test="${!empty requestScope.pageMsgForAuth}">
            <table  class="table">
                <thead>
                <tr>
                    <td>学号</td>
                    <td>姓名</td>
                    <td>学校</td>
                    <td>学院</td>
                    <td>联系电话</td>
                    <td>本人照片</td>
                    <td>信用分</td>
                    <td>恢复/禁用</td>
                </tr>
                </thead>
                <c:forEach items="${requestScope.pageMsgForAuth.lists}" var="u">
                    <tr>
                        <th>${u.stuId}</th>
                        <th>${u.name}</th>
                        <th>${u.university}</th>
                        <th>${u.college}</th>
                        <th>${u.telephone}</th>
                        <th><a href="${u.selfPhoto}">点击查看图片</a></th>
                        <th>${u.creditScore}</th>
                        <c:if test="${u.isForbidden==0}">
                            <th><a href="${pageContext.request.contextPath }/user/forbidden?stuId=${u.stuId}&isForbidden=1">禁用</a></th>
                        </c:if>
                        <c:if test="${u.isForbidden==1}">
                            <th><a href="${pageContext.request.contextPath }/user/forbidden?stuId=${u.stuId}&isForbidden=0">恢复</a></th>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <table   class="table">
            <tr>
                <td class="td2">
                    <span>第${requestScope.pageMsgForAuth.currPage }/ ${requestScope.pageMsgForAuth.totalPage}页</span>
                    <span>总记录数：${requestScope.pageMsgForAuth.totalCount }  每页显示:${requestScope.pageMsgForAuth.pageSize}</span>
                    <span>
           <c:if test="${requestScope.pageMsgForAuth.currPage != 1}">
               <a href="${pageContext.request.contextPath }/user/doAuthQuery?currentPage=1">[首页]</a>
               <a href="${pageContext.request.contextPath }/user/doAuthQuery?currentPage=${requestScope.pageMsgForAuth.currPage-1}">[上一页]</a>
           </c:if>

           <c:if test="${requestScope.pageMsgForAuth.currPage != requestScope.pageMsgForAuth.totalPage}">
               <a href="${pageContext.request.contextPath }/user/doAuthQuery?currentPage=${requestScope.pageMsgForAuth.currPage+1}">[下一页]</a>
               <a href="${pageContext.request.contextPath }/user/doAuthQuery?currentPage=${requestScope.pageMsgForAuth.totalPage}">[尾页]</a>
           </c:if>
       </span>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
