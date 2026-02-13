<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News2" %>

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
    <%--д╛хо--%>
    <link href="css/page.css" rel="stylesheet" type="text/css" />
    <link href="css/update.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1">
        <ucStart:Start ID="Start" runat="server" />
        <!--Content Start-->
        <asp:Panel ID="NewsZidingyi" runat="server" Width="100%">
        <div class="NewList">
            <ul>
                <asp:Repeater ID="DataList2" runat="server">
                    <ItemTemplate>
                        <li style="line-height: 30px;">
                            <table style="width: 100%;">
                                <tr>
                                    <td style="background: url(/Images/bg2.gif) repeat-x left bottom;" align="left" width="85%">
                                        <img src="/images/arr.gif" alt="" />&nbsp;&nbsp;<a href="<%#CheckUrl(Eval("url", "{0}"), Eval("id", "{0}"))%>"
                                            title="<%#Eval("title") %>" target="_blank"><%#systemtools.ChangeColor(Eval("title", "{0}"), Eval("Istop", "{0}"))%></a>
                                        <span>
                                            <%#systemtools.ChangeGif(Eval("putdate", "{0}"))%>
                                        </span>
                                    </td>
                                    <td align="left" style="background: url(/Images/bg2.gif) repeat-x left bottom; color: #999999"
                                        width="15%">
                                        <%#Convert.ToDateTime(Eval("putdate")).ToString("yyyy-MM-dd")%>
                                                &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        </asp:Panel>

        <asp:Panel ID="NewsMoban" runat="server" Width="100%">
        <%=strhtml %>
        </asp:Panel>


        <div class="clear">
        </div>
        <div class="page_box" style="width: 100%; padding-top: 5px; padding-bottom: 8px;">
            <%=Basic.Engine.Get.PagiNation.GetPageHtml(intTotalCount, page)%>
        </div>

        <!--Content End-->
        <ucEnd:End ID="End" runat="server" />
    </form>
</body>
</html>

