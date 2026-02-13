<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManage.aspx.cs" Inherits="Manager_Query" %>

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
    <script type="text/javascript">
        function BackWait()
        {
            var re = /^(\d)*$/g;
            if (!re.test(document.getElementById("txtUserAccount").value) || document.getElementById("txtUserAccount").value == "") { alert("账户余额不正确！"); document.getElementById("txtUserAccount").value = ""; document.getElementById("txtUserAccount").focus(); return false; }
            if (document.getElementById("txtUserName").value == "") { alert("会员名不能为空！"); document.getElementById("txtUserName").focus(); return false; }
            if (document.getElementById("txtUserPassword").value == "") { alert("密码不能为空！"); document.getElementById("txtUserPassword").focus(); return false; }
            if (document.getElementById("txtUserPassword").value.length < 6 || document.getElementById("txtUserPassword").value.length > 16)
            { alert("密码长度6～16位！"); document.getElementById("txtUserPassword").focus(); return false; }
            if (document.getElementById("txtUserPassword2").value == "") { alert("请再次输入密码！"); document.getElementById("txtUserPassword2").focus(); return false; }
            else if (document.getElementById("txtUserPassword").value != document.getElementById("txtUserPassword2").value) { alert("两次输入的密码不一致！"); document.getElementById("txtUserPassword2").focus(); return false; }
          
         
          
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
            return true;
        }
    </script>
</head>
<body data-headerbg="default" data-logobg="color_3" data-sidebarbg="color_3">
    <form id="form1" runat="server">


                <div class="lyear-layout-web">
        <div class="lyear-layout-container">
                <ucLeftControl:LeftControl runat="server" ID="LeftControl1" />
                <ucHeadControl:headcontrol id="HeadControl1" runat="server" />
    
   <!--页面主要内容-->
    <main class="lyear-layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
              <div class="card">
              <asp:Panel ID="pnlList" runat="server">
              <div class="card-header"><h4>会员系统 </h4></div>
              <div class="card-toolbar clearfix">
                <div class="toolbar-btn-action">
                  <a class="btn btn-primary" href="UserManage.aspx?Action=Add"><i class="mdi mdi-plus"></i> 注册会员</a>
                    <a class="btn btn-primary" href="UserManage.aspx"><i class="mdi mdi-plus"></i> 会员列表</a>

                </div>
              </div>
             <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="gvList" DataKeyNames="UserID" runat="server" Class="table table-bordered" OnRowDeleting="gvList_RowDeleting" OnDataBound="GridView_DataBind"
                        AllowPaging="True" PageSize="20" GridLines="None" AutoGenerateColumns="False"
                        EmptyDataText="暂无数据">
                        <Columns>
                            <asp:TemplateField HeaderText="邮箱">
                                <HeaderStyle Width="120px"  HorizontalAlign="left" />
                                <ItemStyle Width="120px"  HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("UserName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                              <asp:TemplateField HeaderText="密码">
                                <HeaderStyle Width="120px"  HorizontalAlign="left" />
                                <ItemStyle Width="120px"  HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("userpassword")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="姓名">
                                 <HeaderStyle Width="120px"  HorizontalAlign="left" />
                                <ItemStyle Width="120px"  HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("UserRealName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="状态">
                                <HeaderStyle Width="120px"  HorizontalAlign="left" />
                                <ItemStyle Width="120px"  HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#showUserState(Eval("UserState","{0}"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="注册日期">
                                <HeaderStyle Width="120px" HorizontalAlign="left" />
                                <ItemStyle Width="120px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Convert.ToDateTime(Eval("Putdate")).ToString("yyyy-MM-dd")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <HeaderStyle Width="80px" HorizontalAlign="left" />
                                <ItemStyle Width="80px" HorizontalAlign="left" />
                                <ItemTemplate>
                                     <a class="btn btn-xs btn-default" href="?Action=Add&Id=<%# Eval("userid") %>" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
                                    <asp:LinkButton ID="LinkButton2" CssClass="btn btn-xs btn-default" runat="server" CausesValidation="False" CommandName="Delete"
                                        Text="删除" OnClientClick="return confirm('删除后无法恢复！您确定要删除吗？')"><i class="mdi mdi-window-close"></i></asp:LinkButton>
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
                            </div>
                        </PagerTemplate>
                    </asp:GridView>
                </div>
              </div>
                </asp:Panel>
              <asp:Panel ID="pnlEdit" runat="server" Width="100%">


              <div class="tab-content">
                <div class="tab-pane active">
                  
                  <div class="edit-form">
                    <div class="form-group">
                      <label for="web_site_title">账户余额 <strong class="red">*</strong></label>
                       <asp:TextBox ID="txtUserAccount" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>



                    
                  <div class="form-group">
                      <label for="web_site_title">邮箱 <strong class="red">*</strong></label>
                       <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                      <div class="form-group">
                      <label for="web_site_title">密码 <strong class="red">*</strong></label>
                       <asp:TextBox ID="txtUserPassword" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                         <div class="form-group">
                      <label for="web_site_title">再输一次密码 <strong class="red">*</strong></label>
                       <asp:TextBox ID="txtUserPassword2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                        <div class="form-group">
                      <label for="web_site_title">邮箱 <strong class="red">*</strong></label>
                       <asp:TextBox ID="txtUserEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                        <div class="form-group">
                      <label for="web_site_title">QQ <strong class="red">*</strong></label>
                       <asp:TextBox ID="txtUserQQ" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>


                          <div class="form-group">
                      <label for="web_site_title">手机号 <strong class="red">*</strong></label>
                       <asp:TextBox ID="txtUserPhone" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>


                         <div class="form-group">
                      <label for="web_site_title">姓名 <strong class="red">*</strong></label>
                       <asp:TextBox ID="txtUserRealName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                      <div class="form-group">
                      <label for="web_site_title">联系地址 </label>
                       <asp:TextBox ID="txtUserAddress" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                          <div class="form-group">
                      <label for="web_site_title">单位名称 </label>
                       <asp:TextBox ID="txtUserCompany" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                  

                    <div class="form-group">
                      <label for="web_site_title">状态</label>
                      <div class="clearfix qzlradio">
                             <asp:RadioButtonList ID="radlUserState" runat="server" RepeatDirection="horizontal" RepeatColumns="2">
                                    <asp:ListItem Text="正常" Selected="True" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="禁止" Value="1"></asp:ListItem>
                                </asp:RadioButtonList>
                    </div>
                    
                    </div>
                    
                    <div class="form-group">
                         <div id="divHidden" style="display: none;">
                                    <img src="images/admin_images/loading.gif" alt="" />
                                    <span style="color: #666;">正在保存...</span></div>
                                <div id="divShow">
                                    <asp:Button ID="btnSave" runat="server" Text="确 定" OnClick="btnSaveClick" class="btn btn-primary m-r-5" />
                      <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                                    </div>
                    </div>
                  </div>
                </div>
              </div>
                </asp:Panel>
                <asp:Panel ID="pnlShow" runat="server" Visible="false" align="center">
                 <div class="card-header"><h4>用户管理 </h4></div>
              <div class="card-toolbar clearfix">
               目前没有任何会员信息
              </div>
                  </asp:Panel>

                </div>

            
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>

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
    
    </form>
</body>
</html>

