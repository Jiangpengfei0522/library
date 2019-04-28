<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理端登录</title>
    <link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
    <link rel="stylesheet" href="../../css/style.css">
    <script src='../../js/jquery-3.3.1.min.js'></script>
</head>
<body>
    <div class="login-form">
    <img src="../../image/logo.png" width="213" height="120">
    <form method="post">
        <div class="form-group ">
            <input type="text" class="form-control" placeholder="用户名 " id="UserName" name="username">
            <i class="fa fa-user"></i>
        </div>
        <div class="form-group log-status">
            <input type="password" class="form-control" placeholder="密码" id="Passwod" name="password">
            <i class="fa fa-lock"></i>
        </div>
        <span class="alert">用户名或密码错误！</span>

        <%--<input type="submit" class="log-btn" value="登录">--%>
    </form>
        <button type="button" class="log-btn">登录</button>
    </div>
<script>
    $(document).ready(function(){
        $('.log-btn').click(function(){
            var dataJson = {
                username:$("#UserName").val(),
                password:$("#Passwod").val()
            };
            $.ajax({
                url:"/library/dologin",
                type:"get",
                data:dataJson,
                dataType:"json",
                async:true,//设置异步，不然可能接收不到后端返回的json
                success:function (data) {
                    alert("返回成功")
                    if(data && data.success == "true"){
                        window.location.href= "/library/main";
                    }
                    else{
                        $('.log-status').addClass('wrong-entry');
                        $('.alert').fadeIn(500);
                        setTimeout( "$('.alert').fadeOut(1500);",3000 );
                    }
                },
                error:function (data) {

                    alert(data);

                }
            });
        });
        $('.form-control').keypress(function(){
            $('.log-status').removeClass('wrong-entry');
        });

    });
</script>
</body>
</html>
