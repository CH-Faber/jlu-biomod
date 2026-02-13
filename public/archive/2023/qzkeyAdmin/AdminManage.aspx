<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminManage.aspx.cs" Inherits="Manager_AdminManage" %>

<%@ Register Src="Head.ascx" TagName="HeadControl" TagPrefix="ucHeadControl" %>
<%@ Register Src="Left.ascx" TagName="LeftControl" TagPrefix="ucLeftControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>首页-腾云网后台管理系统</title>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <meta name="keywords" content="腾云网后台管理系统">
    <meta name="description" content="腾云网后台管理系统">
    <meta name="author" content="yinqi">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/materialdesignicons.min.css" rel="stylesheet">
    <link href="css/style.min.css?v=11" rel="stylesheet">
    <script type="text/javascript">
        function checkNull()
        {
            if (document.getElementById("txtAdminName") != null)
            {
                if (document.getElementById("txtAdminName").value == "") { alert("帐号为必填项！"); document.getElementById("txtAdminName").focus(); return false; }
            }
            if (document.getElementById("txtAdminPassword").value == "") { alert("密码为必填项！"); document.getElementById("txtAdminPassword").focus(); return false; }
            if (!/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[A-Za-z0-9]{8,16}$/.test(document.getElementById("txtAdminPassword").value)) {
                alert("密码必须由8~16位数字、大小写字母组合");
                $("#txtAdminPassword").focus();
                return false;
            }
            if (document.getElementById("txtAdminPassword").value == document.getElementById("txtAdminName").value) { alert("账户与密码不能一致！"); return false; }
            if (document.getElementById("txtAdminPassword2").value == "") { alert("请重复再输一次密码！"); document.getElementById("txtAdminPassword2").focus(); return false; }
            if (document.getElementById("txtAdminPassword").value != document.getElementById("txtAdminPassword2").value) { alert("两次输入的密码不一致！"); return false; }
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
    <main class="lyear-layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
            
            <asp:Panel ID="pnlList" runat="server">
            <div class="card-header"><h4>账户管理</h4></div>
            <div class="card-toolbar clearfix">
                
                <div class="toolbar-btn-action">
                  <a class="btn btn-primary m-r-5" href="AdminManage.aspx?Action=View"><i class="mdi mdi-plus"></i> 新增</a>
                </div>
              </div>
            <div class="card-body">
                
                <div class="table-responsive">

                    <asp:GridView ID="gvList" DataKeyNames="id" runat="server" Class="table table-bordered" OnRowDeleting="gvList_RowDeleting" OnDataBound="GridView_DataBind" AllowPaging="True" PageSize="10" GridLines="None" AutoGenerateColumns="False" EmptyDataText="暂无数据">
                        <Columns>
                            <asp:TemplateField HeaderText="帐号">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("AdminName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="密码">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("AdminPassword")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="角色">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#ChangeRole(Eval("Role","{0}"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <div class="btn-group">
                                    <a class="btn btn-xs btn-default" href="?Action=View&ID=<%# Eval("ID") %>" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
                                         <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" title="删除" data-toggle="tooltip" CssClass="btn btn-xs btn-default"  OnClientClick="return confirm('删除后无法恢复！您确定要删除吗？')"><i class="mdi mdi-window-close"></i></asp:LinkButton>
                                    </div>
                                   
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
                    </asp:GridView>

                    
                    
                </div>
                
       
              </div>
                </asp:Panel>
            <asp:Panel ID="pnlEdit" runat="server">
            <div class="card-header"><h4>账户管理 <span>带 "<strong class="red">*</strong>" 的为必填信息</span></h4></div>
                <div class="card-body">
                    <div class="row">
                    <div class="form-group col-md-12">
                    <label for="title">帐号 <strong class="red">*</strong></label>
                        <asp:TextBox ID="txtAdminName" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>
                  <div class="form-group col-md-12">
                    <label for="seo_keywords">密码 <strong class="red">必须由8~16位数字、大小写字母组合</strong></label>
                                <asp:TextBox ID="txtAdminPassword" CssClass="form-control" runat="server"></asp:TextBox>


                  </div>
                  
                  
                   <div class="form-group col-md-12">
                    <label for="seo_keywords">重复密码 <strong class="red">*</strong></label>
                                <asp:TextBox ID="txtAdminPassword2" CssClass="form-control" runat="server"></asp:TextBox>

                  </div>
                  
              
                  <div class="form-group col-md-12">
                      <div id="divHidden" style="display: none;">
                                    <img src="images/admin_images/loading.gif" alt="" />
                                    <span style="color: #666;">正在保存...</span></div>
                                <div id="divShow">
                                    <asp:Button ID="btnSave" runat="server" Text="确 认" CssClass="btn btn-primary ajax-post" OnClick="btnSaveClick"  />
                                    <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                                </div>
                  </div>

                </div>
                   </div> 
                </asp:Panel>
            <asp:Panel ID="pnlShow" runat="server" Visible="false">
                <div class="card-toolbar clearfix">
                
                <div class="toolbar-btn-action">
                  <a class="btn btn-primary m-r-5" href="AdminManage.aspx?Action=View"><i class="mdi mdi-plus"></i> 新增</a>
                </div>
              </div>
            <div class="card-body">
                
                <div class="table-responsive">
                    目前没有任何数据

                 </div> </div></asp:Panel>
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
