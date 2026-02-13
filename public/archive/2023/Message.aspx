<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="Message2" %>

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
    <%--默认--%>
    <script type="text/javascript" src="js/message.js"></script>
    <link href="css/update.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1">
        <ucStart:Start ID="Start" runat="server" />
        <!--Content Start-->
        <asp:Panel ID="MessageZidingyi" runat="server" Width="100%">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="5">
            <tr>
                <td align="left">主题：
                </td>
                <td>
                    <input name="txtTitle" type="text" id="txtTitle" style="width: 400px; border: #CCCCCC solid 1px; margin: 0; padding: 0; height: 20px;" />
                    <font color="red">* 必填</font>
                </td>
            </tr>
            <tr>
                <td align="left">姓名：
                </td>
                <td>
                    <input name="txtRealname" type="text" id="txtRealname" style="width: 180px; border: #CCCCCC solid 1px; margin: 0; padding: 0; height: 20px;" />
                    <font color="red">* 必填</font>
                </td>
            </tr>
            <tr>
                <td align="left">手机：
                </td>
                <td>
                    <input name="txtPhone" type="text" id="txtPhone" style="width: 180px; border: #CCCCCC solid 1px; margin: 0; padding: 0; height: 20px;" />
                    <font color="red">* 必填</font>
                </td>
            </tr>
            <tr>
                <td align="left">邮箱：
                </td>
                <td>
                    <input name="txtEmail" type="text" id="txtEmail" style="width: 180px; border: #CCCCCC solid 1px; margin: 0; padding: 0; height: 20px;" />
                    <font color="red">* 必填</font>
                </td>
            </tr>
            <tr>
                <td align="left">内容：
                </td>
                <td>
                    <textarea name="txtContent" rows="2" cols="20" id="txtContent" style="height: 80px; width: 400px; border: #CCCCCC solid 1px; margin: 0; padding: 0;"></textarea>
                    <font color="red">* 必填</font>
                </td>
            </tr>
            <tr>
                <td align="left">验证码：
                </td>
                <td>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td style="width: 70px;">
                                <input name="txtCode" type="text" id="txtCode" style="width: 60px; border: #CCCCCC solid 1px; margin: 0; padding: 0; height: 20px;" />
                            </td>
                            <td style="width: 100px;">
                                <img id="Image1" align="absmiddle" onclick="this.src='/Check/Code.aspx?' + Math.random()"
                                    alt="点击刷新" src="/Check/Code.aspx" style="border-width: 0px; cursor: pointer; width: 92px; height: 20px; border: 0px;" />
                            </td>
                            <td>
                                <a href="javascript:imgchange('Image1');" title="看不清？换一张">看不清？换一张</a>
                                <font color="red">* 必填</font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td></td>
                <td valign="bottom" align="left">
                    <span id="divbutton" style="padding-left: 0px;">
                        <input id="Button1" name="Button1" type="button" onclick="checkNull();" style="background-image: url(/images/testdrive_button5_10.gif); border: 0px; height: 22px; width: 64px; cursor: pointer;" />
                    </span>
                    <span id="loading" style="display: none;">
                        <img src="/images/loading_small.gif" alt="" />
                        <span style="color: #666;">正在提交...</span></span>
                </td>
            </tr>
        </table>
        </asp:Panel>
        <asp:Panel ID="MessageMoban" runat="server" Width="100%">
            <%=strhtml %>
        </asp:Panel>
      
        <!--Content End-->
        <ucEnd:End ID="End" runat="server" />
        
    </form>
</body>
</html>

