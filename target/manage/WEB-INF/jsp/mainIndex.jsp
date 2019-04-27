<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/22
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="stylesheet" href="../../css/bootstrap.min.css" type="text/css">
    <script src="../../js/jquery-3.3.1.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <title>五更鸡后台管理</title>
    <style>

        .mynavbar{
            min-width: 240px;
        }
        .navbar{
            background-color: #fff4e3;
            margin-bottom: 0px;
            margin-right: 0px;
        }
        a{
            color: black;
        }
        .logo{
            background-color: #ffa45c;
            width: 220px;
            float: left;
        }
        .logo a{
            color:white;
        }
        #slider_left{
            background-color: #fff4e3;
        }
        @media (min-width: 768px) {
            #slider_left{
                width:200px;
                height:100%;
                position: absolute;
            }
        }
        .slider li{
            margin-top: 10px;
            font-family: Arial;
            font-size: 15px;
            color: #5d5d5a;
        }
        .active{
            background-color: #ffa45c;
        }
    </style>
</head>
<body>
        <nav class="navbar">
            <div class="logo">
                <a href="#"><img src="../../image/logo_small.png" height="55" width="56"></a>
                <a href="#">图书馆预约系统管理平台</a>
            </div>
            <ul class="nav navbar-nav navbar-right mynavbar">
                <li class="col-xs-6"><a href="#"><span class="glyphicon glyphicon-user">&nbsp;Jiangpengfei</span></a></li>
                <li class="col-xs-6"><a href="#"><span class="glyphicon glyphicon-off">注销</span></a></li>
            </ul>

        </nav>
        <div class="navbar-default navbar-collapse" id="slider_left">
            <ul class="nav slider">
                <li>
                    <a href="#" onclick="showAtRight('accountCheck.jsp')">账户审核</a>
                </li>
                <li>
                    <a href="#" onclick="showAtRight('confirmSeated.jsp')">确认是否本人就坐</a>
                </li>
                <li>
                    <a href="#" onclick="showAtRight('seatCondition.jsp')">座位情况</a>
                </li>
                <li>
                    <a href="#sub1" data-toggle="collapse">数据统计
                        <span class="glyphicon glyphicon-menu-right pull-right"></span>
                    </a>
                </li>
                <ul id="sub1" class="nav collapse">
                    <li><a href="#" onclick="showAtRight('arrivedPeople.jsp')">&nbsp;&nbsp;到达人数统计</a></li>
                    <li><a href="#" onclick="showAtRight('lostFaithPeople.jsp')">&nbsp;&nbsp;失信人数统计</a></li>
                </ul>
                <li>
                    <a href="#" onclick="showAtRight('accountAuthority.jsp')">账户恢复/禁用</a>
                </li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;控制台<small>&nbsp;&nbsp;&nbsp;欢迎使用XXX后台管理系统</small></h1>

            <!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
            <div id="content">

                <h4>
                    <strong>使用指南：</strong><br>
                    <br><br>默认页面内容……
                </h4>

            </div>
        </div>
        <script type="text/javascript">

            /*
             * 对选中的标签激活active状态，对先前处于active状态但之后未被选中的标签取消active
             * （实现左侧菜单中的标签点击后变色的效果）
             */
            $(document).ready(function () {
                $('ul.nav > li').click(function (e) {
                    //e.preventDefault();    加上这句则导航的<a>标签会失效
                    $('ul.nav > li').removeClass('active');
                    $(this).addClass('active');
                });
            });

            /*
             * 解决ajax返回的页面中含有javascript的办法：
             * 把xmlHttp.responseText中的脚本都抽取出来，不管AJAX加载的HTML包含多少个脚本块，我们对找出来的脚本块都调用eval方法执行它即可
             */
            function executeScript(html)
            {

                var reg = /<script[^>]*>([^\x00]+)$/i;
                //对整段HTML片段按<\/script>拆分
                var htmlBlock = html.split("<\/script>");
                for (var i in htmlBlock)
                {
                    var blocks;//匹配正则表达式的内容数组，blocks[1]就是真正的一段脚本内容，因为前面reg定义我们用了括号进行了捕获分组
                    if (blocks = htmlBlock[i].match(reg))
                    {
                        //清除可能存在的注释标记，对于注释结尾-->可以忽略处理，eval一样能正常工作
                        var code = blocks[1].replace(/<!--/, '');
                        try
                        {
                            eval(code) //执行脚本
                        }
                        catch (e)
                        {
                        }
                    }
                }
            }

            /*
             * 利用div实现左边点击右边显示的效果（以id="content"的div进行内容展示）
             * 注意：
             *   ①：js获取网页的地址，是根据当前网页来相对获取的，不会识别根目录；
             *   ②：如果右边加载的内容显示页里面有css，必须放在主页（即例中的index.jsp）才起作用
             *   （如果单纯的两个页面之间include，子页面的css和js在子页面是可以执行的。 主页面也可以调用子页面的js。但这时要考虑页面中js和渲染的先后顺序 ）
            */
            function showAtRight(url) {
                var xmlHttp;

                if (window.XMLHttpRequest) {
                    // code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlHttp=new XMLHttpRequest();    //创建 XMLHttpRequest对象
                }
                else {
                    // code for IE6, IE5
                    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                }

                xmlHttp.onreadystatechange=function() {
                    //onreadystatechange — 当readystate变化时调用后面的方法

                    if (xmlHttp.readyState == 4) {
                        //xmlHttp.readyState == 4    ——    finished downloading response

                        if (xmlHttp.status == 200) {
                            //xmlHttp.status == 200        ——    服务器反馈正常

                            document.getElementById("content").innerHTML=xmlHttp.responseText;    //重设页面中id="content"的div里的内容
                            executeScript(xmlHttp.responseText);    //执行从服务器返回的页面内容里包含的JavaScript函数
                        }
                        //错误状态处理
                        else if (xmlHttp.status == 404){
                            alert("出错了☹   （错误代码：404 Not Found），……！");
                            /* 对404的处理 */
                            return;
                        }
                        else if (xmlHttp.status == 403) {
                            alert("出错了☹   （错误代码：403 Forbidden），……");
                            /* 对403的处理  */
                            return;
                        }
                        else {
                            alert("出错了☹   （错误代码：" + request.status + "），……");
                            /* 对出现了其他错误代码所示错误的处理   */
                            return;
                        }
                    }

                }

                //把请求发送到服务器上的指定文件（url指向的文件）进行处理
                xmlHttp.open("GET", url, true);        //true表示异步处理
                xmlHttp.send();
            }
        </script>
</body>
</html>
