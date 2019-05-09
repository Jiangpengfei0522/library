<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/23
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/seatStyle.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/YYMMDD.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;控制台<small>&nbsp;&nbsp;&nbsp;欢迎使用五更鸡后台管理系统</small></h1>
        <form name="seat_select">
            <p>日期</p>
            <select name="YYYY" onChange="YYYYDD(this.value)" id="year">
                <option value="">请选择 年</option>
            </select>
            <select name="MM" onChange="MMDD(this.value)" id="month">
                <option value="">选择 月</option>
            </select>
            <select name="DD" onChange="DDD(this.value)" id="day">
                <option value="">选择 日</option>
            </select>
            <br/>
            <p style="margin-top: 10px">楼层分区</p>
            <select name="floor" id="floor" style="width: 70px;margin-right: 10px">
                <option value="1">一</option>
                <option value="2">二</option>
                <option value="3">三</option>
                <option value="4">四</option>
            </select>
            <select name="block" id="block" style="width: 70px;margin-right: 10px">
                <option value="N">北</option>
                <option value="S">南</option>
                <option value="W">西</option>
                <option value="E">东</option>
            </select>
            <input type="button" id="btn_submit" value="查询" class="btn" style="width: 60px;height: 30px">
        </form>
        <div class="seatTable">
            <%
                int count=0;
                String idName="desk";
                for(int i=1;i<=20;i++){
                    count++;
            %>
            <div id="<%=idName+count%>" class="desk">
                <div id="<%=idName+count+"A"%>" style="width: 30px;height: 30px;border: 1px solid black" class="seat_A seat">A</div>
                <div id="<%=idName+count+"B"%>" style="width: 30px;height: 30px;border: 1px solid black" class="seat_B seat">B</div>
                <div id="<%=idName+count+"C"%>" style="width: 30px;height: 30px;border: 1px solid black" class="seat_C seat">C</div>
                <div id="<%=idName+count+"D"%>" style="width: 30px;height: 30px;border: 1px solid black" class="seat_D seat">D</div>
                <br/>
                <div style="margin-left: 35px"><span><%=count%></span></div>
            </div>
            <% }%>
        </div>
    </div>
<script type="text/javascript">
    $("#btn_submit").click(function () {
        for(var i=1;i<=20;i++){
            var index=i;
            var idNameA="desk"+index+"A";
            var idNameB="desk"+index+"B";
            var idNameC="desk"+index+"C";
            var idNameD="desk"+index+"D";
            document.getElementById(idNameA).classList.remove("occupied");
            document.getElementById(idNameB).classList.remove("occupied");
            document.getElementById(idNameC).classList.remove("occupied");
            document.getElementById(idNameD).classList.remove("occupied");
        }
        var year = $("#year").val();
        var month = $("#month").val();
        var day = $("#day").val();
        var floor = parseInt($("#floor").val());
        var block = $("#block").val();
        var Date = year+"-"+month+"-"+day;
        var dateJson={"orderDate":Date,"floor":floor,"block":block};
        $.ajax({
            type : "post",
            async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url : "${pageContext.request.contextPath }/order/querySeat",
            data : dateJson,
            dataType : "json", //返回数据形式为json
            success : function(result) {
                console.log(result);
                //请求成功时执行该函数内容，result即为服务器返回的json对象
                if (result) {
                    for (var i = 0; i < result.listA.length; i++) {
                        if(result.listA[i]!=0){
                            var index=i+1;
                            var idName="desk"+index+"A";
                            document.getElementById(idName).classList.add("occupied");
                        }
                        if(result.listB[i]!=0){
                            var index=i+1;
                            var idName="desk"+index+"B";
                            document.getElementById(idName).classList.add("occupied");
                        }
                        if(result.listC[i]!=0){
                            var index=i+1;
                            var idName="desk"+index+"C";
                            document.getElementById(idName).classList.add("occupied");
                        }
                        if(result.listD[i]!=0){
                            var index=i+1;
                            var idName="desk"+index+"D";
                            document.getElementById(idName).classList.add("occupied");
                        }
                    }

                }

            },
            error : function(errorMsg) {
                //请求失败时执行该函数
                alert("图表请求数据失败!");
            }
        });
    })
</script>
</body>
</html>
