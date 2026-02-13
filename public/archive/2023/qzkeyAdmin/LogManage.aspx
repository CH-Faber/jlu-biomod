<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogManage.aspx.cs" Inherits="Manager_LogManage" %>

<%@ Register Src="Head.ascx" TagName="HeadControl" TagPrefix="ucHeadControl" %>
<%@ Register Src="Left.ascx" TagName="LeftControl" TagPrefix="ucLeftControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>网站管理系统</title>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <meta name="keywords" content="网站管理系统">
    <meta name="description" content="网站管理系统">
    <meta name="author" content="yinqi">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/materialdesignicons.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-1-7-2.js"></script>
    <script type="text/javascript">
        //全选
        function checkFormAll(chk) {
            form = document.getElementById("form1");
            for (var i = 0; i < form.elements.length; i++) {
                if (form.elements[i].type == "checkbox") {
                    form.elements[i].checked = chk;
                }
            }
        }
        //删除
        function buttonPaixu_Delete() {
            var strID = "";
            form = document.getElementById("form1");
            for (var i = 0; i < form.elements.length; i++) {
                if (form.elements[i].type == "checkbox") {
                    if (form.elements[i].checked == true && form.elements[i].value != "-1") {
                        strID = strID + "," + form.elements[i].value;
                    }
                }
            }
            if (strID != "") {
                document.getElementById("divbutton").style.display = "none";
                document.getElementById("loading").style.display = "block";
                //提交信息开始
                $.ajax({
                    type: "get",
                    //url: "ashx/delete.aspx?tb=&id=" + strID,
                    success: function (msg) {
                        if (msg == "success") {
                            document.getElementById("divbutton").style.display = "block";
                            document.getElementById("loading").style.display = "none";
                            alert("操作成功！");
                            window.location.reload();
                        }
                        else {
                            document.getElementById("divbutton").style.display = "block";
                            document.getElementById("loading").style.display = "none";
                            alert("操作失败！");
                            window.location.reload();
                        }
                    }
                });
                //提交信息结束
            }
            else {
                alert("请勾选需要删除的项目！");
            }
        }
    </script>
</head>

<body data-headerbg="default" data-logobg="color_3" data-sidebarbg="color_3">
    <form id="form1" runat="server">
        <div class="lyear-layout-web">
            <div class="lyear-layout-container">
                <!--左侧导航-->
                <ucLeftControl:LeftControl runat="server" ID="LeftControl1" />
                <!--End 左侧导航-->

                <!--头部信息-->
                <ucHeadControl:headcontrol id="HeadControl1" runat="server" />
                <!--End 头部信息-->

                <!--页面主要内容-->
                <main class="lyear-layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
               <div class="card-header"><h4>操作日志</h4></div>
              <div class="card-body">
                
                <div class="table-responsive">
                   <asp:Panel ID="pnlList" runat="server">
                    <asp:GridView ID="gvList" DataKeyNames="id" runat="server"  CssClass="table table-bordered"  OnRowDeleting="gvList_RowDeleting" OnDataBound="GridView_DataBind" AllowPaging="True" PageSize="20" GridLines="None" AutoGenerateColumns="False" EmptyDataText="暂无数据">
                        <Columns>
                            <asp:TemplateField HeaderText="<label class='lyear-checkbox checkbox-primary'><input onclick='checkFormAll(checked)' type='checkbox' id='chk_1' name='chk_1' value='-1' /><span></span></label>">
                                <HeaderStyle HorizontalAlign="center" />
                                <ItemStyle HorizontalAlign="center" />
                                <ItemTemplate>
                                    <label class="lyear-checkbox checkbox-primary">
                                    <input type='checkbox' id='chk_<%#Eval("id")%>' name='chk_<%#Eval("id")%>' value='<%#Eval("id")%>' />
                                    <span></span>
                                    </label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IP地址">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("IP") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="时间">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("Times")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="帐号">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("UserName","{0}").Trim()=="qizhinet"?"管理员":Eval("UserName","{0}")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="事件">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("Result")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerTemplate>
                            <div id="main" style="width: 100%; padding-top: 10px; text-align: center;">
                                &nbsp;&nbsp;页次：<asp:Label ID="lblPageCurrent" runat="server" Text="1" CssClass="txtInfo"></asp:Label>
                                /<asp:Label ID="lblPageCount" runat="server" Text="1"></asp:Label>&nbsp;&nbsp; 共&nbsp;<asp:Label ID="lblPageRow" runat="server" Text="1" CssClass="txtInfo"></asp:Label>&nbsp;条记录
                                <asp:LinkButton ID="btnFirst" runat="server" CssClass="link" CommandName="Pager" CommandArgument="First" OnCommand="NavigateToPage">[首页]</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="btnPrev" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Prev" OnCommand="NavigateToPage">[前一页]</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="btnNext" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Next" OnCommand="NavigateToPage">[下一页]</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="btnLast" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Last" OnCommand="NavigateToPage">[尾页]</asp:LinkButton>&nbsp;
                                <asp:textbox ID="txtNewPageIndex" runat="server" width="40px" text='<%#((GridView)Container.Parent.Parent).PageIndex + 1 %>' /> 
                                <asp:linkbutton id="btnGo" runat="server" CssClass="link" CommandName="Page" CommandArgument="Go"  OnCommand="NavigateToPage" text="GO" />
                            </div>
                        </PagerTemplate>
                        <RowStyle BackColor="#F9F9F9" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <%if (rowCount > 0)
                        {
                    %>
                    <%--<div style="text-align: left;">
                        <span id="divbutton" style="padding-left: 15px;">
                            <input type="button" name="buttonPaixu" id="buttonPaixu" value="批量删除" onclick="buttonPaixu_Delete()"
                                style="cursor: pointer;" />
                        </span><span id="loading" style="display: none;">
                            <img src="../images/loading_small.gif" />
                            <span style="color: #666;">正在删除...</span></span>
                    </div>--%>
                    <%
                        } %>
                </asp:Panel>
                <asp:Panel ID="pnlShow" runat="server" Visible="false" align="center">
                    目前没有任何数据</asp:Panel>
                </div>
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
                <!--End 页面主要内容-->
            </div>
        </div>
    </form>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="js/main.min.js"></script>
<script type="text/javascript">
$(function(){
    $('.search-bar .dropdown-menu a').click(function() {
        var field = $(this).data('field') || '';
        $('#search-field').val(field);
        $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
    });
});
</script>
</body>



</html>
