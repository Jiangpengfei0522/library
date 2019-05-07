<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/23
  Time: 16:38
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
    <script src="../../js/echarts.js"></script>
    <script src="../../js/YYMMDD.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;控制台<small>&nbsp;&nbsp;&nbsp;欢迎使用五更鸡后台管理系统</small></h1>
        <form name="reg_testdate">
            <select name="YYYY" onChange="YYYYDD(this.value)">
                <option value="">请选择 年</option>
            </select>
            <select name="MM" onChange="MMDD(this.value)">
                <option value="">选择 月</option>
            </select>
            <select name="DD" onChange="DDD(this.value)">
                <option value="">选择 日</option>
            </select>
        </form>
        <div id="main" style="width: 1000px;height: 450px;"></div>
    </div>
    <script type="text/javascript">
        var myChart = echarts.init(document.getElementById('main'));
        myChart.setOption({
            grid: { // 控制图的大小，调整下面这些值就可以，
                x: 100,//控制x轴文字与底部的距离
                y2: 200 // y2可以控制倾斜的文字狱最右边的距离，放置倾斜的文字超过显示区域
            },
            title : {
                text : '人数到达统计图'
            },
            tooltip : {},
            legend : {
                data : [ '人数' ]
            },
            xAxis : {
                type : 'category',
                data : ['杭州国际服务工程学院',
                    '外国语学院',
                    '经济与管理学院',
                    '法学院',
                    '政治与社会学院',
                    '教育学院',
                    '体育与健康学院',
                    '人文学院',
                    '理学院',
                    '材料与化学化工',
                    '生命与环境科学学院',
                    '医学院',
                    '阿里巴巴商学院',
                    '美术学院',
                    '经亨颐学院',
                    '国际教育学院'],
                axisLabel: {
                    interval: 0,    //强制文字产生间隔
                    rotate: 45,     //文字逆时针旋转45°
                    textStyle: {    //文字样式
                        color: "black",
                        fontSize: 16,
                        fontFamily: 'Microsoft YaHei'
                    }
                }
            },
            yAxis : [{
                type:'value'
            }],
            series : [ {
                name : '人数',
                type : 'bar',
                data : []
            } ]
        });

        myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画

        var nums = []; //销量数组（实际用来盛放Y坐标值）
        $.ajax({
            type : "get",
            async : true, //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url : "/order/queryPeople", //请求发送到TestServlet处
            data : {},
            dataType : "json", //返回数据形式为json
            success : function(result) {
                console.log(result);
                //请求成功时执行该函数内容，result即为服务器返回的json对象
                if (result) {
                    for (var i = 0; i < result.success.length; i++) {
                        nums.push(result.success[i]); //挨个取出销量并填入销量数组
                    }
                    console.log(nums);
                    myChart.hideLoading(); //隐藏加载动画
                    myChart.setOption({ //加载数据图表
                        series : [ {
                            // 根据名字对应到相应的系列
                            name : '人数',
                            data : nums
                        } ]
                    });

                }

            },
            error : function(errorMsg) {
                //请求失败时执行该函数
                alert("图表请求数据失败!");
                myChart.hideLoading();
            }
        });
    </script>
</body>
</html>
