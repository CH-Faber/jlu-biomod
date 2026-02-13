<%@ Page Language="C#" AutoEventWireup="true" CodeFile="design.aspx.cs" Inherits="Content" %>

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
<style>



         .i3Info table tr {
              border:1px solid #ccc;
        }
            .i3Info table td {
              border:1px solid #ccc;}


</style>
<body>
    <ucHeadControl:HeadControl ID="HeadControl" runat="server" />
    <!--content-->
    <div class="index1" <%--style="background: url(<%=mc.ShowColumnKeyById(intClassID,"path") %>) center center no-repeat; background-size: cover;"--%>>
        <div class="i1VideoBg">
            <%=mc.ShowAbout(24)%>
        </div>

        <div class="i1Tit">
            <%=strColumnSubName %> <span class="fontColor1"><%=mc.ShowColumnKeyById(intClassID,"remarks") %></span>
        </div>

        <div class="i1Links">
            <ul>
                <%showNews(intClassID, 5); %>
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
                <li><a href="#des<%=j+1 %>"><%=title %></a></li>

                <%} %>
            </ul>
        </div>
    </div>

    <%showNews(intClassID, 5); %>
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
    <div class="design1" id="des<%=j+1 %>">
        <div class="wapper2">
            <div class="i3Tit"><%=title %></div>
            <div class="i3Info">
                <%=content %>
            </div>
        </div>
    </div>
    <%} %>
    <ucFootControl:FootControl ID="FootControl" runat="server" />
</body>
</html>

