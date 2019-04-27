<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/23
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../../js/bootstrap.min.js"></script>
</head>
<body>
    <form>
        <input type="text" placeholder="请输入查询学号" name="stuId" id="stuID">
        <%--<input type="submit" value="查询" class="btn btn-default" id="btn_submit">--%>
    </form>
    <button type="button" id="btn_submit">查询</button>
    <c:if test="${empty requestScope.pageMsg}">
        没有任何用户信息！
    </c:if>
    <c:if test="${!empty requestScope.pageMsg}">
        <table border="1" cellpadding="10" cellspacing="0" class="table">
            <thead>
                <tr>
                    <td>学号</td>
                    <td>姓名</td>
                    <td>学校</td>
                    <td>学院</td>
                    <td>联系电话</td>
                    <td>本人照片</td>
                    <td>违约次数</td>
                    <td>是否审核</td>
                </tr>
            </thead>
            <c:forEach items="${requestScope.pageMsg.lists}" var="u">
                <tr>
                    <th>${u.stuId}</th>
                    <th>${u.name}</th>
                    <th>${u.university}</th>
                    <th>${u.college}</th>
                    <th>${u.telephone}</th>
                    <th><a href="${u.selfPhoto}">点击查看图片</a></th>
                    <th>${u.defaultTimes}</th>
                    <th><a>未审核</a></th>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <table  border="0" cellspacing="0" cellpadding="0"  width="900px">
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
    <script type="text/javascript">
        $(document).ready(function(){
            $('#btn_submit').click(function(){
                var dataJson = {
                    currentPage:"1",
                    stuId:$("#stuID").val()
                };
                $.ajax({
                    type:"get",
                    url:"/user/doQuery",
                    data:dataJson,
                    dataType:"json",
                    async:true,
                    success:function (data) {
                        alert(data.pageMsg)
                    },
                    error:function (data) {
                        alert(data);
                    }
                })
            });
        });
    </script>
</body>
</html>
