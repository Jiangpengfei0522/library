<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar">
    <div class="logo">
        <a href="#"><img src="${pageContext.request.contextPath }/image/logo_small.png" height="55" width="56"></a>
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
            <a href="${pageContext.request.contextPath }/library/accountCheck">账户审核</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath }/library/confirmSeated">确认是否本人就坐</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath }/library/seatCondition" >座位情况</a>
        </li>
        <li>
            <a href="#sub1" data-toggle="collapse">数据统计
                <span class="glyphicon glyphicon-menu-right pull-right"></span>
            </a>
        </li>
        <ul id="sub1" class="nav collapse">
            <li><a href="${pageContext.request.contextPath }/library/arrivedPeople" >&nbsp;&nbsp;到达人数统计</a></li>
            <li><a href="${pageContext.request.contextPath }/library/lostFaithPeople" >&nbsp;&nbsp;失信人数统计</a></li>
        </ul>
        <li>
            <a href="${pageContext.request.contextPath }/library/accountAuthority">账户恢复/禁用</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath }/library/reportSet">举报记录</a>
        </li>
    </ul>
</div>