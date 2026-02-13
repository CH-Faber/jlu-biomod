<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
    <!--myjs-->
    <script type="text/javascript" src="js/myJs.js"></script>
    <script type="text/javascript" src="js/swiper_effect.js"></script>
    <style type="text/css">
        html, body {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
    <ucHeadControl:HeadControl ID="HeadControl" runat="server" />
    <!--content-->
    <div class="mainFull" style=" background:url(../images/12121.png)">
        <div class="swiper fullSwiper">
            <div class="swiper-wrapper">
                <!--start-->
                <!--index1-->
                <%--<div class="swiper-slide">
                    <div class="index1" style="background: url(<%=mc.ShowColumnKeyById(2,"path") %>) center center no-repeat; background-size: cover;">
                        <div class="i1Tit">
                            <%=mc.ShowColumnName(2) %><span class="fontColor1"><%=mc.ShowColumnSubName(2) %></span>.
                        </div>

                        <div class="i1Links">
                            <ul>
                                <%showNews(2, 3); %>
                                <%for (int j = 0; j < intNews; j++)
                                    {
                                        string path = dtblNews.Rows[j]["path"].ToString();
                                        string title = dtblNews.Rows[j]["title"].ToString();
                                        string id = dtblNews.Rows[j]["id"].ToString();
                                        string putdate = dtblNews.Rows[j]["putdate"].ToString();
                                        string url = dtblNews.Rows[j]["url"].ToString();
                                        string keycontent = dtblNews.Rows[j]["keycontent"].ToString();
                                        string keywords = dtblNews.Rows[j]["keywords"].ToString();
                                        int classid = int.Parse(dtblNews.Rows[j]["classid"].ToString());
                                        string columntype = mc.ShowColumnKeyById(classid, "ColumnType");

                                        if (url == "")
                                        {
                                            if (columntype == "�����б�") { url = "NewsDetail.aspx?ID=" + id; }
                                            else if (columntype == "ͼƬ�б�") { url = "PicDetail.aspx?ID=" + id; }
                                            else { url = "DownloadDetail.aspx?ID=" + id; }
                                        }



                                %>
                                <li><a href="<%=url %>"><%=title %></a></li>

                                <%} %>
                            </ul>
                        </div>
                    </div>
                </div>--%>
                <%showNews(3, 6); %>
                <%for (int j = 0; j < intNews; j++)
                    {
                        string path = dtblNews.Rows[j]["path"].ToString();
                        string title = dtblNews.Rows[j]["title"].ToString();
                        string id = dtblNews.Rows[j]["id"].ToString();
                        string putdate = dtblNews.Rows[j]["putdate"].ToString();
                        string url = dtblNews.Rows[j]["url"].ToString();
                        string keycontent = dtblNews.Rows[j]["keycontent"].ToString();
                        string content = dtblNews.Rows[j]["content"].ToString();
                        string keywords = dtblNews.Rows[j]["keywords"].ToString();
                        int classid = int.Parse(dtblNews.Rows[j]["classid"].ToString());
                        string columntype = mc.ShowColumnKeyById(classid, "ColumnType");
                        if (url == "")
                        {
                            if (columntype == "�����б�") { url = "NewsDetail.aspx?ID=" + id; }
                            else if (columntype == "ͼƬ�б�") { url = "PicDetail.aspx?ID=" + id; }
                            else { url = "DownloadDetail.aspx?ID=" + id; }
                        }


                %>
                <!--index2-->
                <div class="swiper-slide">
                    <div class="index2">
                        <div class="img ani" swiper-animate-effect="fadeIn">
                            <img src="<%=path %>" />
                        </div>
                        <div class="desc">

                            <div class="info ani" swiper-animate-effect="fadeInUp">
                           <%-- <a href="<%=url %>"><%=title %></a>--%>
                                <p><%=content%></p>
                            </div>
                        </div>
                    </div>
                </div>

                <%} %>

                <!--index3-->
                <%--<div class="swiper-slide">
                    <div class="index3">
                        <div class="wapper2">
                            <div class="i3Tit"><%=mc.ShowColumnName(4) %></div>
                            <div class="i3Info">
                                <ul>
                                    <%showNews(4, 3); %>
                                    <%for (int j = 0; j < intNews; j++)
                                        {
                                            string path = dtblNews.Rows[j]["path"].ToString();
                                            string title = dtblNews.Rows[j]["title"].ToString();
                                            string id = dtblNews.Rows[j]["id"].ToString();
                                            string putdate = dtblNews.Rows[j]["putdate"].ToString();
                                            string url = dtblNews.Rows[j]["url"].ToString();
                                            string keycontent = dtblNews.Rows[j]["keycontent"].ToString();
                                            string keywords = dtblNews.Rows[j]["keywords"].ToString();
                                            int classid = int.Parse(dtblNews.Rows[j]["classid"].ToString());
                                            string columntype = mc.ShowColumnKeyById(classid, "ColumnType");

                                            if (url == "")
                                            {
                                                if (columntype == "�����б�") { url = "NewsDetail.aspx?ID=" + id; }
                                                else if (columntype == "ͼƬ�б�") { url = "PicDetail.aspx?ID=" + id; }
                                                else { url = "DownloadDetail.aspx?ID=" + id; }
                                            }



                                    %>

                                    <li>
                                        <p>
                                            <strong><%=title %></strong>
                                            <span><%=keycontent %></span>
                                        </p>
                                    </li>

                                    <%} %>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <!--index4-->
               <div class="swiper-slide iBtmslide">
                    <div class="index4">
                        <div class="wapper2">
                            <div class="i3Tit"><%=mc.ShowColumnName(5) %></div>
                            <div class="i4List">
                                <ul>
                                    <%showNews(5, 10); %>
                                    <%for (int j = 0; j < intNews; j++)
                                        {
                                            string path = dtblNews.Rows[j]["path"].ToString();
                                            string title = dtblNews.Rows[j]["title"].ToString();
                                            string id = dtblNews.Rows[j]["id"].ToString();
                                            string putdate = dtblNews.Rows[j]["putdate"].ToString();
                                            string url = dtblNews.Rows[j]["url"].ToString();
                                            string keycontent = dtblNews.Rows[j]["keycontent"].ToString();
                                            string content = dtblNews.Rows[j]["content"].ToString();
                                            string keywords = dtblNews.Rows[j]["keywords"].ToString();
                                            int classid = int.Parse(dtblNews.Rows[j]["classid"].ToString());
                                            string columntype = mc.ShowColumnKeyById(classid, "ColumnType");

                                            if (url == "")
                                            {
                                                if (columntype == "�����б�") { url = "NewsDetail.aspx?ID=" + id; }
                                                else if (columntype == "ͼƬ�б�") { url = "PicDetail.aspx?ID=" + id; }
                                                else { url = "DownloadDetail.aspx?ID=" + id; }
                                            }



                                    %>
                                    <li>
                                        <%--<a href="<%=url %>">--%><%=content%><%--</a>--%>
                                    </li>
                                    <%} %>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>


                <!--end-->
            </div>
            <!--<div class="swiper-pagination mullPage"></div>-->
            <div class="swiper-scrollbar"></div>
        </div>
    </div>
    <script>
        var swiper = new Swiper(".fullSwiper", {
            direction: "vertical",
            slidesPerView: 'auto',
            spaceBetween: 0,
            speed: 1000,
            mousewheel: true,
			simulateTouch : false,
            scrollbar: {
                el: '.swiper-scrollbar',
                draggable: true,
                snapOnRelease: false,
                dragSize: 30,
            },
            on: {
                init: function () {
                    swiperAnimateCache(this);
                    swiperAnimate(this);
                },
                slideChangeTransitionEnd: function () {
                    swiperAnimate(this);
                }
            }
        });
    </script>
    <ucFootControl:FootControl ID="FootControl" runat="server" />
</body>
</html>
