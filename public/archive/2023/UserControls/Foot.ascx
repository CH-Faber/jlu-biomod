<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Foot.ascx.cs" Inherits="Foot" %>
<%if (intQQ > 0)
    {%>
<link rel="stylesheet" type="text/css" href="css/kefu.css">
<div class="scrollsidebar" id="scrollsidebar">
    <div class="side_content">
        <div class="side_list">
            <div class="side_title">
                <h2>在线客服</h2>
                <a title="隐藏" class="close_btn"><span>关闭</span></a>
            </div>
            <div class="side_center">
                <div class="custom_service">
                    <%for (int i = 0; i < intQQ; i++)
                        {
                            string qq = dstQQ.Tables[0].Rows[i]["qq"].ToString();
                    %>
                    <p>
                        <a title="点击这里给我发消息" href="http://wpa.qq.com/msgrd?v=3&uin=<%=qq %>&Site=qq&Menu=yes" target="_blank">
                            <img src="http://wpa.qq.com/pa?p=2:8983659:41"></a>
                    </p>
                    <%} %>
                </div>
                <div class="other">
                    <p>
                        <img src="<%=mc.SelectPicByClassID(7) %>" width="120" />
                    </p>
                    <p>客户服务热线</p>
                    <p><%=mc.ShowWebsiteKeyById(1,"Phone") %></p>
                </div>
                <div class="msgserver">
                    <p><a href="<%=ContactUrl %>">联系我们</a></p>
                </div>
            </div>
            <div class="side_bottom"></div>
        </div>
    </div>
    <div class="show_btn"><span>在线客服</span></div>
</div>
<script type="text/javascript" src="js/kefu.js"></script>
<%} %>
<%--<div class="footer wapper">
    <dl>
        <dd>
            <span style="font-family: Arial, Helvetica, sans-serif;">Copyright &copy; 2021 -<script type="text/javascript">var myDate = new Date(); document.write(myDate.getFullYear());</script>
            </span>
            <%=strCompanyName %>
            <%=strICP %>
        </dd>
        <dd>
            <%=strAddress%>
            <%=strContact%>
            <%=strPhone %>
            <%if (strStateManage == "1")
                {%>
            <a href="qzkeyadmin/login.aspx">管理入口</a>&nbsp;&nbsp;
            <%} %>
            <%if (strSupportState == "1")
                {%>
            <a href="<%=strWebSite %>" title="<%=strTitle %>" target="_blank"><%=strSupportName %></a>
            <%} %>
            <%if (strStateSitemap == "1")
                {%>
            <a href="/sitemap.xml" title="网站地图" target="_blank">网站地图</a>
            <%} %>
         

        </dd>
    </dl>
</div>--%>

<%if (strCodeState == "1") { Response.Write(strContent); }%>
