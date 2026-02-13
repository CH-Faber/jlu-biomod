<%@ Page Language="C#" AutoEventWireup="true" CodeFile="build.aspx.cs" Inherits="Content" %>

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

    <div class="index1" style="background: url(<%=mc.ShowColumnKeyById(intClassID,"path") %>) center center no-repeat; background-size: cover;">
        <div class="i1Tit">
            <%=strColumnSubName %><span class="fontColor1"><%=mc.ShowColumnKeyById(intClassID,"remarks") %></span>.
        </div>

        <div class="i1Links">
            <ul>
                <%showMenu69(intClassID); %>
                <%for (int i = 0; i < intMenu69; i++)
                    {
                        string ColumnName = dstMenu69.Tables[0].Rows[i]["ColumnName"].ToString();
                        string ColumnUrlClient = dstMenu69.Tables[0].Rows[i]["ColumnUrlClient"].ToString();
                        string Id = dstMenu69.Tables[0].Rows[i]["Id"].ToString();
                %>

                <li>
                    <a href="#aaa<%=i+1 %>"><%=ColumnName %></a>
                </li>

                <%} %>
            </ul>
        </div>
    </div>

    <%showMenu69(intClassID); %>
    <%for (int i = 0; i < intMenu69; i++)
        {
            string ColumnName = dstMenu69.Tables[0].Rows[i]["ColumnName"].ToString();
            string ColumnUrlClient = dstMenu69.Tables[0].Rows[i]["ColumnUrlClient"].ToString();
            string Remarks = dstMenu69.Tables[0].Rows[i]["Remarks"].ToString();
            string Id = dstMenu69.Tables[0].Rows[i]["Id"].ToString();
    %>

    <div class="build1" id="aaa<%=i+1 %>">
        <div class="wapper2">
            <div class="i3Tit"><%=ColumnName %></div>
            <div class="build1Info">
                <%=Remarks %>
            </div>
            <div class="build1Slide">
                <div class="build1Tab">
                    <ul>
                        	<li><span>-</span></li>
                        <%showNews(int.Parse(Id), 3); %>
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

                                 string sclass = "";
                            if (j == 0) {
                                sclass = "on";
                            }

                        %>

                        <li class="<%=sclass %>"><span><%=title %></span></li>


                        <%} %>
                    </ul>
                </div>
                <div class="build1Panel">
                    	<div class="item">
				<!--第一个给空白对应上面的“-”-->
			</div>

                    <%showNews(int.Parse(Id), 4); %>
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

                    <div class="item " >
                        <%=content %>
                    </div>



                    <%} %>
                </div>
            </div>
        </div>
    </div>

    <%} %>
    
    <ucFootControl:FootControl ID="FootControl" runat="server" />
</body>
</html>

