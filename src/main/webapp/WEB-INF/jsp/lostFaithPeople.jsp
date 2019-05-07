<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/23
  Time: 16:39
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
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;控制台<small>&nbsp;&nbsp;&nbsp;欢迎使用五更鸡后台管理系统</small></h1>
        <div id="pie" style="width: 1000px;height: 450px;"></div>
    </div>
    <script>
        //初始化echarts
        var pieCharts = echarts.init(document.getElementById("pie"));
        //设置属性
        pieCharts.setOption({
            title: {
                text: '失信人数统计',
                x: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data: ['诚信人数','失信人数']
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {show: true},
                    dataView: {show: true, readOnly: false},
                    magicType: {
                        show: true,
                        type: ['pie', 'funnel'],
                        option: {
                            funnel: {
                                x: '25%',
                                width: '50%',
                                funnelAlign: 'left',
                                max: 1548
                            }
                        }
                    },
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            calculable: true,
            series: [
                {
                    name: '成绩',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    data: []
                }
            ]
        });
        //显示一段动画
        pieCharts.showLoading();
        //异步请求数据
        $.ajax({
            type: "post",
            async: true,
            url: '${pageContext.request.contextPath}/user/countPeople',
            data: [],
            dataType: "json",
            success: function (result) {
                pieCharts.hideLoading();//隐藏加载动画
                pieCharts.setOption({
                    series: [
                        {
                            name: '成绩',
                            type: 'pie',
                            radius: '55%',
                            center: ['50%', '60%'],
                            data: result.success
                        }
                    ]
                });
            }
        })
    </script>
</body>
</html>
