<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sponsors.aspx.cs" Inherits="Content" %>

<%@ Register Src="~/UserControls/Head.ascx" TagName="HeadControl" TagPrefix="ucHeadControl" %>
<%@ Register Src="~/UserControls/BannerControl.ascx" TagName="BannerControl" TagPrefix="ucBannerControl" %>
<%@ Register Src="~/UserControls/Link.ascx" TagName="LinkControl" TagPrefix="ucLinkControl" %>
<%@ Register Src="~/UserControls/Foot.ascx" TagName="FootControl" TagPrefix="ucFootControl" %>
<%@ Register Src="~/UserControls/Category.ascx" TagName="CategoryControl" TagPrefix="ucCategoryControl" %>
<%@ Register Src="~/UserControls/Left.ascx" TagName="LeftControl" TagPrefix="ucLeftControl" %>
<%@ Register Src="~/UserControls/Contact.ascx" TagName="ContactControl" TagPrefix="ucContactControl" %>

<%--fastcontrol 0.1--%>
<%@ Register Src="~/UserControls/Top.ascx" TagName="Top" TagPrefix="ucTop" %>
<%@ Register Src="~/UserControls/Start.ascx" TagName="Start" TagPrefix="ucStart" %>
<%@ Register Src="~/UserControls/End.ascx" TagName="End" TagPrefix="ucEnd" %>
<!doctype html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <meta name="description" id="description" content="" runat="server" />
    <meta name="keywords" id="keywords" content="" runat="server" />
    <ucTop:Top ID="Top" runat="server" />
</head>
<body>
    <ucHeadControl:HeadControl ID="HeadControl" runat="server" />
    <!--content-->
    <div class="aboLinks">
        <div class="nav-height" id="navHeight">
            <div class="nav-wrap" id="nav-wrap">
                <div class="nav-mobile">Click</div>
                <ul>
                    <%showNews(intClassID, 4); %>
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
                                if (columntype == "新闻列表") { url = "NewsDetail.aspx?ID=" + id; }
                                else if (columntype == "图片列表") { url = "PicDetail.aspx?ID=" + id; }
                                else { url = "DownloadDetail.aspx?ID=" + id; }
                            }



                    %>
                    <li>
                        <a href="#abo<%=j+1 %>"><%=title %></a>
                    </li>

                    <%} %>
                </ul>
            </div>
        </div>
    </div>

    <div class="about about2">

        <div class="aboTop">
            <div class="aboTit">
                <%=strColumnSubName %><span><%=mc.ShowColumnKeyById(intClassID,"remarks") %></span>.
            </div>
        </div>

        <%showNews(intClassID, 4); %>
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
                    if (columntype == "新闻列表") { url = "NewsDetail.aspx?ID=" + id; }
                    else if (columntype == "图片列表") { url = "PicDetail.aspx?ID=" + id; }
                    else { url = "DownloadDetail.aspx?ID=" + id; }
                }



        %>
        <div class="abList1" id="abo<%=j+1 %>">
            <div class="disFlex jusBet aliCet">
                <div class="img wow fadeIn">
                    <img src="<%=path %>" />
                </div>
                <div class="desc wow fadeInRight">
                    <div class="tit1">
                        <strong><%=keywords %></strong>
                    </div>
                    <div class="tit2"><%=keycontent %></div>
                    <div class="info">
                        <%=content %>
                    </div>
                </div>
            </div>
        </div>


        <%} %>
    </div>

    <div class="pHei"></div>

    <ucFootControl:FootControl ID="FootControl" runat="server" />

    <script type="text/javascript" src="js/pSlide.js"></script>
    <script>
        //内容信息导航吸顶
        $(document).ready(function () {
            var navHeight = $("#navHeight").offset().top;
            var navFix = $("#nav-wrap");
            $(window).scroll(function () {
                if ($(this).scrollTop() > navHeight) {
                    navFix.addClass("navFix");
                } else {
                    navFix.removeClass("navFix");
                }
            })
        })
        //内容信息导航锚点
        $('.nav-wrap').navScroll({
            mobileDropdown: true,
            mobileBreakpoint: 768,
            scrollSpy: true
        });

        $('.click-me').navScroll({
            navHeight: 0
        });

        $('.nav-wrap').on('click', '.nav-mobile', function (e) {
            e.preventDefault();
            $('.nav-wrap ul').slideToggle('fast');
        });
    </script>

    <script type="text/javascript">
        new WOW().init();
    </script>


</body>
</html>

