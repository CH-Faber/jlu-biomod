<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Head.ascx.cs" Inherits="Head" %>
<header class="lyear-layout-header">

    <nav class="navbar navbar-default">
        <div class="topbar">

            <div class="topbar-left">
                <div class="lyear-aside-toggler">
                    <span class="lyear-toggler-bar"></span>
                    <span class="lyear-toggler-bar"></span>
                    <span class="lyear-toggler-bar"></span>
                </div>
                <span class="navbar-page-title"><%=ColumnName %> </span>
            </div>
            <ul class="topbar-right">
                <li class="dropdown dropdown-profile">
                    <a href="javascript:void(0)" data-toggle="dropdown">
                       <i class="mdi  mdi-account"></i> <span><%=strUserName %><span class="caret"></span></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="UpdatePassword.aspx"><i class="mdi mdi-lock-outline"></i>修改密码</a> </li>
                        <li class="divider"></li>
                        <li><a href="javascript:if(confirm('你真的要退出吗?')){location='Logout.aspx'}"><i class="mdi mdi-logout-variant"></i>退出登录</a> </li>
                    </ul>
                </li>
                <li><a target="_blank" href="../"><i class="mdi mdi-edge"></i> 浏览网站</a></li>

            </ul>

        </div>
    </nav>

</header>
