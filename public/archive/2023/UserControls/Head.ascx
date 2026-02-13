<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Head.ascx.cs" Inherits="Head" %>
<%--默认--%>
<script type="text/javascript" src="https://tyw.key.400301.com/js/replace_word_limit.js"></script>
<script type="text/javascript" language="javascript">
    //①搜索开始
    function checkSearch() {
        if ($("#KeyName").val() == "" || $("#KeyName").val() == null) {
            alert("请输入搜索关键词");
            $("#KeyName").val("");
            $("#KeyName").focus();
            return false;
        }
        var Search_url = $("#key-Search").attr("value");
        window.location.href = Search_url + "?q=" + escape($("#KeyName").val());
    }

    //②按下回车键出发某个按钮开始
    document.onkeydown = function (event) {
        e = event ? event : (window.event ? window.event : null);
        if (e.keyCode == 13) {
            document.getElementById("SearchButton").click();
            return false;
        }
    }

    //③加入收藏js代码开始
    function AddFavorite(sURL, sTitle) {
        try {
            window.external.addFavorite(sURL, sTitle);
        }
        catch (e) {
            try {
                window.sidebar.addPanel(sTitle, sURL, "");
            }
            catch (e) {
                alert("您使用的浏览器不支持此功能，请按“Ctrl+D”键手工加入收藏");
            }
        }
    }
</script>
<div class="header">
    <div class="headList">
        <div class="logo">
            <%=strLogo %>
        </div>
        <!--menu start-->
        <div class="menu">
            <ul>

                <%for (int i = 0; i < intMenu; i++)
                    {
                        string Id = dstMenu.Tables[0].Rows[i]["Id"].ToString();
                        string ColumnUrlClient = dstMenu.Tables[0].Rows[i]["ColumnUrlClient"].ToString();
                        string ColumnStaticPage = dstMenu.Tables[0].Rows[i]["ColumnStaticPage"].ToString();
                        string StaticPage = dstMenu.Tables[0].Rows[i]["StaticPage"].ToString();
                        string ColumnName = dstMenu.Tables[0].Rows[i]["ColumnName"].ToString();
                        showMenuSub(Int32.Parse(Id));
                        string sClass = "";
                        if (intMenuSub > 0)
                        {
                            sClass = "menu_down";
                        }


                        string classs = "";
                        if (intClassID == Int32.Parse(Id))
                        {
                            classs = "on";
                        }
                        if (ColumnUrlClient.ToLower() == "default.aspx" && Request.Url.LocalPath.ToLower().Contains("default.aspx"))
                        {
                            classs = "on";
                        }
                        if (ColumnUrlClient.ToLower() == "product.aspx" && Request.Url.LocalPath.ToLower().Contains("product.aspx"))
                        {
                            classs = "on";
                        }
                        if (intParentId == int.Parse(Id))
                        {
                            classs = "on";
                        }



                %>


                <li class="<%=sClass %> <%=classs %>">
                    <span><a href="<%=ColumnUrlClient %>"><%=ColumnName %></a></span>

                    <%if (intMenuSub > 0)
                        {
                    %>
                    <dl>
                        <%for (int j = 0; j < intMenuSub; j++)
                            {

                                string ColumnUrlClient2 = dstMenuSub.Tables[0].Rows[j]["ColumnUrlClient"].ToString();
                                string ColumnStaticPage2 = dstMenuSub.Tables[0].Rows[j]["ColumnStaticPage"].ToString();
                                string StaticPage2 = dstMenuSub.Tables[0].Rows[j]["StaticPage"].ToString();
                                string ColumnName2 = dstMenuSub.Tables[0].Rows[j]["ColumnName"].ToString();
                        %>
                        <dd><a href="<%=ColumnUrlClient2 %>"><%=ColumnName2 %></a></dd>

                        <%} %>
                    </dl>
                    <%} %>
                </li>




                <%} %>
            </ul>
            <div class="clear"></div>
        </div>
        <!--menu end-->
    </div>
</div>

<div class="m_header">
    <!--menu_mob start-->
    <div class="sp_header">
        <div class="sp_logo"><%=strLogo %></div>
        <div class="sp_nav"><span></span><span></span><span></span></div>
    </div>

    <div class="sjj_nav">
        <div class="warp">
            <ul>

                <%for (int i = 0; i < intMenu; i++)
                    {
                        string Id = dstMenu.Tables[0].Rows[i]["Id"].ToString();
                        string ColumnUrlClient = dstMenu.Tables[0].Rows[i]["ColumnUrlClient"].ToString();
                        string ColumnStaticPage = dstMenu.Tables[0].Rows[i]["ColumnStaticPage"].ToString();
                        string StaticPage = dstMenu.Tables[0].Rows[i]["StaticPage"].ToString();
                        string ColumnName = dstMenu.Tables[0].Rows[i]["ColumnName"].ToString();
                        showMenuSub(Int32.Parse(Id));
                        string sClass = "";
                        if (intMenuSub > 0)
                        {
                            sClass = "menu_down";
                        }


                        string classs = "";
                        if (intClassID == Int32.Parse(Id))
                        {
                            classs = "on";
                        }
                        if (ColumnUrlClient.ToLower() == "default.aspx" && Request.Url.LocalPath.ToLower().Contains("default.aspx"))
                        {
                            classs = "on";
                        }
                        if (ColumnUrlClient.ToLower() == "product.aspx" && Request.Url.LocalPath.ToLower().Contains("product.aspx"))
                        {
                            classs = "on";
                        }
                        if (intParentId == int.Parse(Id))
                        {
                            classs = "on";
                        }



                %>

                <li>
                    <a href="<%=ColumnUrlClient %>"><%=ColumnName %></a>

                    <%if (intMenuSub > 0)
                        {
                    %>
                    <i class="sp_nav_xjb"></i>
                    <ul>
                        <%for (int j = 0; j < intMenuSub; j++)
                            {

                                string ColumnUrlClient2 = dstMenuSub.Tables[0].Rows[j]["ColumnUrlClient"].ToString();
                                string ColumnStaticPage2 = dstMenuSub.Tables[0].Rows[j]["ColumnStaticPage"].ToString();
                                string StaticPage2 = dstMenuSub.Tables[0].Rows[j]["StaticPage"].ToString();
                                string ColumnName2 = dstMenuSub.Tables[0].Rows[j]["ColumnName"].ToString();
                        %>
                        <li><a href="<%=ColumnUrlClient2 %>"><%=ColumnName2 %></a></li>
                        <%} %>
                    </ul>
                    <%} %>
                </li>
                <%} %>
            </ul>
        </div>
    </div>
    <!--menu_mob end-->
</div>
