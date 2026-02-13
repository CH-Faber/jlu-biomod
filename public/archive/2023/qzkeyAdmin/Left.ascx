<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Left.ascx.cs" Inherits="Manager_Left" %>

<aside class="lyear-layout-sidebar">

    <!-- logo -->
    <div id="logo" class="sidebar-header">
        <a href="Default.aspx">
            <img src="images/logo-sidebar-bg.png" title="LightYear" alt="LightYear" /></a>
    </div>
    <div class="lyear-layout-sidebar-scroll">

        <nav class="sidebar-main">
            <ul class="nav nav-drawer">
                <li class="nav-item <%=Getactive("Default.aspx") %>"><a href="Default.aspx"><i class="mdi mdi-home"></i>后台首页</a> </li>
                <li class="nav-item nav-item-has-subnav <%=Getopen("WebSiteSet.aspx|SEO.aspx|IM.aspx|SitemapControl.aspx") %>">
                    <a href="javascript:void(0)"><i class="mdi mdi-palette"></i>网站配置</a>
                    <ul class="nav nav-subnav">
                        <li class="<%=Getactive("WebSiteSet.aspx") %>"><a href="WebSiteSet.aspx">基本信息</a> </li>
                        <li class="<%=Getactive("SEO.aspx") %>"><a href="SEO.aspx">TDK设置</a> </li>
                        <li class="<%=Getactive("IM.aspx") %>"><a href="IM.aspx">添加客服</a> </li>
                        <li class="<%=Getactive("SitemapControl.aspx") %>"><a href="sitemapControl.aspx">网站地图</a> </li>
                    </ul>
                </li>
                <li class="nav-item <%=Getactive("PicManage.aspx") %>"><a href="PicManage.aspx"><i class="mdi mdi-image-multiple"></i>图片管理</a></li>
                <li class="nav-item <%=Getactive("NewsClass.aspx|NewsClassEdit.aspx|About.aspx|News.aspx") %>"><a href="NewsClass.aspx"><i class="mdi mdi-account-edit"></i>导航栏目</a></li>
                <li class="nav-item nav-item-has-subnav <%=Getopen("ProControl.aspx|ProClass.aspx|Product.aspx|ProClassNameEdit.aspx|ProAdd.aspx|ProAddset.aspx") %>">
                <a href="javascript:void(0)"><i class="mdi mdi-format-align-justify"></i>产品中心</a>
                <ul class="nav nav-subnav">
                <li class="<%=Getactive("ProControl.aspx") %>"> <a href="ProControl.aspx">样式设置</a> </li>
                <li class="<%=Getactive("ProClass.aspx|ProClassNameEdit.aspx") %>"> <a href="ProClass.aspx">分类设置</a> </li>
                <li class="<%=Getactive("Product.aspx|ProAddset.aspx|ProAdd.aspx") %>"> <a href="Product.aspx">产品管理</a> </li>
                </ul>
                </li>
                <li class="nav-item nav-item-has-subnav <%=Getopen("Message.aspx|SubmitList.aspx") %>">
                <a href="javascript:void(0)"><i class="mdi mdi-comment-text"></i>客户留言</a>
                <ul class="nav nav-subnav">
                <li class="<%=Getactive("Message.aspx") %>"> <a href="Message.aspx">留言中心</a> </li>
                <li class="<%=Getactive("SubmitList.aspx") %>"> <a href="SubmitList.aspx">在线表单</a> </li>
                </ul>
                </li>

                <li class="nav-item <%=Getactive("PageStateControl.aspx") %>"><a href="PageStateControl.aspx"><i class="mdi mdi-internet-explorer"></i>生成静态</a></li>
                <li class="nav-item <%=Getactive("Links.aspx") %>"><a href="Links.aspx"><i class="mdi mdi-cellphone-link"></i>友情链接</a></li>
                <li class="nav-item <%=Getactive("SetupCode.aspx") %>"><a href="SetupCode.aspx"><i class="mdi mdi-code-array"></i>嵌入代码</a></li>
                <li class="nav-item <%=Getactive("Query.aspx") %>"><a href="Query.aspx"><i class="mdi mdi-animation"></i>证书查询</a></li>
                <%if (strRole == "1")
                  {%>
                <li class="nav-item nav-item-has-subnav <%=Getopen("TimeLimit.aspx|AdminManage.aspx|Support.aspx|Mianban.aspx|LogManage.aspx|SitemapControl.aspx") %>">
                    <a href="javascript:void(0)"><i class="mdi mdi-account-key"></i>超级设置</a>
                    <ul class="nav nav-subnav">
                        <li class="<%=Getactive("TimeLimit.aspx") %>"><a href="TimeLimit.aspx">使用日期</a> </li>
                        <li class="<%=Getactive("AdminManage.aspx") %>"><a href="AdminManage.aspx">账户管理</a> </li>
                        <li class="<%=Getactive("Support.aspx") %>"><a href="Support.aspx">技术支持</a> </li>
                        <li class="<%=Getactive("Mianban.aspx") %>"><a href="Mianban.aspx">网站备份</a> </li>
                        <li class="<%=Getactive("LogManage.aspx") %>"><a href="LogManage.aspx">操作日志</a> </li>
                    </ul>
                </li>
               <%} %>
            </ul>
        </nav>

        <div class="sidebar-footer">
            <p class="copyright">Copyright &copy; 2008-<script type="text/javascript">                                  var myDate = new Date(); document.write(myDate.getFullYear());</script>
        All Rights Reserved
        </p>
        </div>
    </div>

</aside>
