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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
</head>
<body>

    <jsp:include page="header.jsp"/>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;控制台<small>&nbsp;&nbsp;&nbsp;欢迎使用五更鸡后台管理系统</small></h1>

        <form action="${pageContext.request.contextPath }/user/doAuthQuery" method="get">
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
                    <td>联系电话</td>
                    <td>本人照片</td>
                    <td>信用分</td>
                    <td>恢复/禁用</td>
                </tr>
                </thead>
                <c:forEach items="${requestScope.pageMsgForAuth.lists}" var="u">
                    <tr>
                        <td>${u.stuId}</td>
                        <td>${u.name}</td>
                        <td>${u.university}</td>
                        <td>${u.telephone}</td>
                        <td><a href="${pageContext.request.contextPath }/${u.selfPhoto}">点击查看图片</a></td>
                        <td>${u.creditScore}</td>
                        <c:if test="${u.isForbidden==0}">
                            <td><a href="${pageContext.request.contextPath }/user/forbidden?stuId=${u.stuId}&isForbidden=1" onclick="if(confirm('确认禁用该用户所有权限吗？')==false)return false;">禁用</a></td>
                        </c:if>
                        <c:if test="${u.isForbidden==1}">
                            <td><a href="${pageContext.request.contextPath }/user/forbidden?stuId=${u.stuId}&isForbidden=0" onclick="if(confirm('确认恢复该用户所有权限吗？')==false)return false;">恢复</a></td>
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
