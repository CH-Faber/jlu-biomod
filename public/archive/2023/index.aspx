<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/UserControls/Head.ascx" TagName="HeadControl" TagPrefix="ucHeadControl" %>
<%@ Register Src="~/UserControls/BannerControl.ascx" TagName="BannerControl" TagPrefix="ucBannerControl" %>
<%@ Register Src="~/UserControls/Link.ascx" TagName="LinkControl" TagPrefix="ucLinkControl" %>
<%@ Register Src="~/UserControls/Foot.ascx" TagName="FootControl" TagPrefix="ucFootControl" %>
<%@ Register Src="~/UserControls/Category.ascx" TagName="CategoryControl" TagPrefix="ucCategoryControl" %>
<%@ Register Src="~/UserControls/Left.ascx" TagName="LeftControl" TagPrefix="ucLeftControl" %>
<%@ Register Src="~/UserControls/Contact.ascx" TagName="ContactControl" TagPrefix="ucContactControl" %>
<!doctype html>
<html>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <meta name="description" id="description" content="" runat="server" />
    <meta name="keywords" id="keywords" content="" runat="server" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/swiper-bundle.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/animate.min.css" rel="stylesheet" type="text/css" />
    <!--js-->
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/jquery-migrate-3.4.1.js"></script>
    <script type="text/javascript" src="js/jquery.SuperSlide.2.1.3.js"></script>
    <script type="text/javascript" src="js/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="js/swiper.animate.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <!--myjs-->
    <script type="text/javascript" src="js/myJs.js"></script>
    <script type="text/javascript" src="js/swiper_effect.js"></script>

</head>
<body>
    <ucHeadControl:HeadControl ID="HeadControl" runat="server" />
    <!--content-->
    <div class="banner2" style="background: url(<%=mc.ShowColumnKeyById(18,"path") %>) center center no-repeat; background-size: cover;">
        <div class="banDesc">
            <div class="tit1">
              <img src="<%=mc.ShowColumnKeyById(19,"path") %>" /><span><%=mc.ShowColumnName(18) %></span>
            </div>
            <div class="tit2">
                <%=mc.ShowColumnSubName(18) %>
            </div>
            <div class="info">
                <%=mc.ShowColumnKeyById(18,"Remarks") %>
            </div>
        </div>
       <%-- <div class="banImg">
            <img src="<%=mc.ShowColumnKeyById(18,"path") %>" />
        </div>--%>
     <%--   <div class="banIcon">
            <img src="images/down1.png" />
        </div>--%>
    </div>
    <div class="index_a">
        <div class="wapper">
            <div class="i3Tit"><%=mc.ShowColumnName(19) %></div>
            <div class="index_a_video">
               <%=mc.ShowAbout(19) %>
            </div>
            <div class="i3Tit"><%=mc.ShowColumnName(20) %></div>
            <div class="build1Info">
               <%=mc.ShowAbout(20) %>
            </div>
        </div>
    </div>
</body>
</html>
