<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/23
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
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

        <form action="${pageContext.request.contextPath }/user/doQuery" method="get">
            <div class="col-xs-3">
                <input type="text" placeholder="请输入查询学号" name="stuId" id="stuID" class="form-control">
            </div>
            <input type="submit" value="查询" class="btn btn-default" id="btn_submit">
        </form>
        <%--<button type="button" id="btn_submit">查询</button>--%>
        <c:if test="${empty requestScope.pageMsg}">
            没有任何用户信息！
        </c:if>
        <c:if test="${!empty requestScope.pageMsg}">
            <table  class="table">
                <thead>
                    <tr>
                        <td>学号</td>
                        <td>姓名</td>
                        <td>学校</td>
                        <td>联系电话</td>
                        <td>本人照片</td>
                        <td>信用分</td>
                        <td>账号状态</td>
                        <td>操作</td>
                    </tr>
                </thead>
                <c:forEach items="${requestScope.pageMsg.lists}" var="u">
                    <tr>
                        <td>${u.stuId}</td>
                        <td>${u.name}</td>
                        <td>${u.university}</td>
                        <td>${u.telephone}</td>
                        <td><a href="${u.selfPhoto}">点击查看图片</a></td>
                        <td>${u.creditScore}</td>
                        <td>未审核</td>
                        <td><a href="${pageContext.request.contextPath }/user/check?stuId=${u.stuId}" onclick="if(confirm('确认通过审核吗？')==false)return false;">通过审核</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <table   class="table">
            <tr>
                <td class="td2">
                    <span>第${requestScope.pageMsg.currPage }/ ${requestScope.pageMsg.totalPage}页</span>
                    <span>总记录数：${requestScope.pageMsg.totalCount }  每页显示:${requestScope.pageMsg.pageSize}</span>
                    <span>
           <c:if test="${requestScope.pageMsg.currPage != 1}">
               <a href="${pageContext.request.contextPath }/user/doQuery?currentPage=1">[首页]</a>
               <a href="${pageContext.request.contextPath }/user/doQuery?currentPage=${requestScope.pageMsg.currPage-1}">[上一页]</a>
           </c:if>

           <c:if test="${requestScope.pageMsg.currPage != requestScope.pageMsg.totalPage}">
               <a href="${pageContext.request.contextPath }/user/doQuery?currentPage=${requestScope.pageMsg.currPage+1}">[下一页]</a>
               <a href="${pageContext.request.contextPath }/user/doQuery?currentPage=${requestScope.pageMsg.totalPage}">[尾页]</a>
           </c:if>
       </span>
                </td>
            </tr>
        </table>
    </div>

</body>
</html>
