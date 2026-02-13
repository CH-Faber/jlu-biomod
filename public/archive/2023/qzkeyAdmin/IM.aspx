<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IM.aspx.cs" Inherits="Manager_IM" %>

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
        function checkNull()
        {
            if (document.getElementById("txtQQ").value == "") { alert("QQ号为必填项！"); document.getElementById("txtQQ").focus(); return false; }
            if (document.getElementById("txtName").value == "") { alert("QQ名称为必填项！"); document.getElementById("txtName").focus(); return false; }
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
            return true;
        }

    </script>
    <script type="text/javascript">
        function checkFormAll(chk)
        {
            form = document.getElementById("form1");
            for (var i = 0; i < form.elements.length; i++)
            {
                if (form.elements[i].type == "checkbox")
                {
                    form.elements[i].checked = chk;
                }
            }
        }
        function buttonPaixu_Delete()
        {
            var strID = "";
            form = document.getElementById("form1");
            for (var i = 0; i < form.elements.length; i++)
            {
                if (form.elements[i].type == "checkbox")
                {
                    if (form.elements[i].checked == true && form.elements[i].value != "-1")
                    {
                        strID = strID + "," + form.elements[i].value;
                    }
                }
            }
            if (strID != "")
            {
                document.getElementById("divbutton").style.display = "none";
                document.getElementById("loading").style.display = "inline";
                //提交信息开始
                $.ajax({
                    type: "get",
                    url: "ashx/delete.aspx?tb=TbIM&id=" + strID,
                    success: function (msg)
                    {
                        if (msg == "success")
                        {
                            document.getElementById("divbutton").style.display = "inline";
                            document.getElementById("loading").style.display = "none";
                            alert("操作成功！");
                            window.location.reload();
                        }
                        else
                        {
                            document.getElementById("divbutton").style.display = "inline";
                            document.getElementById("loading").style.display = "none";
                            alert("操作失败！");
                            window.location.reload();
                        }
                    }
                });
                //提交信息结束
            }
            else
            {
                alert("请勾选需要删除的项目！");
            }
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
                                <div class="card-header"><h4>添加客服</h4></div>

              
              <div class="card-toolbar clearfix">
                
                <div class="toolbar-btn-action">
                  <a class="btn btn-primary m-r-5" href="IM.aspx?Action=View"><i class="mdi mdi-plus"></i> 新增</a>
                  <a id="divbutton" class="btn btn-danger" href="javascript:buttonPaixu_Delete()"><i class="mdi mdi-window-close"></i> 删除</a>
                  <a id="loading" style="display: none;" class="btn btn-danger"><i class="mdi mdi-window-close"></i> 正在删除...</a>
                </div>
              </div>
              <div class="card-body">
                
                <div class="table-responsive">

                    <asp:GridView ID="gvList" DataKeyNames="id" runat="server" CssClass="table table-bordered" OnRowDeleting="gvList_RowDeleting" OnDataBound="GridView_DataBind"
                        AllowPaging="True" PageSize="10" GridLines="None" AutoGenerateColumns="False"
                        EmptyDataText="暂无数据">
                        <Columns>
                            <asp:TemplateField HeaderText="<label class='lyear-checkbox checkbox-primary'><input onclick='checkFormAll(checked)' type='checkbox' id='chk_1' name='chk_1' value='1' /><span></span></label>">
                                <HeaderStyle HorizontalAlign="center" />
                                <ItemStyle HorizontalAlign="center" />
                                <ItemTemplate>
                                    <label class="lyear-checkbox checkbox-primary">
                                    <input type='checkbox' id='chk_<%#Eval("id")%>' name='chk_<%#Eval("id")%>' value='<%#Eval("id")%>' /><span></span>
                                    </label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="QQ号码">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("qq") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="对外显示的名称">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="状态">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#ChangeState(Eval("State", "{0}"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <HeaderStyle Width="100px" HorizontalAlign="left" />
                                <ItemStyle Width="100px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <a class="btn btn-xs btn-default" href="?Action=View&Id=<%# Eval("id") %>" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
                                    <asp:LinkButton ID="LinkButton2" CssClass="btn btn-xs btn-default" runat="server" CausesValidation="False" CommandName="Delete"
                                        Text="删除" OnClientClick="return confirm('删除后无法恢复！您确定要删除吗？')" title="删除" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerTemplate>
                            <div id="main" style="width: 100%; padding-top: 10px; text-align: center;">
                                &nbsp;&nbsp;页次：<asp:Label ID="lblPageCurrent" runat="server" Text="1" CssClass="txtInfo"></asp:Label>
                                /<asp:Label ID="lblPageCount" runat="server" Text="1"></asp:Label>&nbsp;&nbsp; 共&nbsp;<asp:Label
                                    ID="lblPageRow" runat="server" Text="1" CssClass="txtInfo"></asp:Label>&nbsp;条记录
                                <asp:LinkButton ID="btnFirst" runat="server" CssClass="link" CommandName="Pager"
                                    CommandArgument="First" OnCommand="NavigateToPage">[首页]</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="btnPrev" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Prev"
                                    OnCommand="NavigateToPage">[前一页]</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="btnNext" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Next"
                                    OnCommand="NavigateToPage">[下一页]</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="btnLast" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Last"
                                    OnCommand="NavigateToPage">[尾页]</asp:LinkButton>&nbsp;
                                <asp:textbox ID="txtNewPageIndex" runat="server" width="40px" text='<%#((GridView)Container.Parent.Parent).PageIndex + 1 %>' /> 
                                <asp:linkbutton id="btnGo" runat="server" CssClass="link" CommandName="Page" CommandArgument="Go"  OnCommand="NavigateToPage" text="GO" />
                            </div>
                            
                        </PagerTemplate>
                    </asp:GridView>
                </div>
              </div>
                </asp:Panel>
                <asp:Panel ID="pnlEdit" runat="server">


               <div class="card-header"><h4>添加客服<span> 带 "<strong class="red">*</strong>" 的为必填信息</span></h4></div>
              <div class="tab-content">
                <div class="tab-pane active">
                  
                  <div class="edit-form">
                    <div class="form-group">
                      <label for="web_site_title">QQ号码 <strong class="red">*</strong></label>
                                <asp:TextBox ID="txtQQ" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>
                    
                    <div class="form-group">
                      <label for="web_site_title">对外显示名称 <strong class="red">*</strong></label>
                                                      <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>
                    <div class="form-group">
                    <label for="status">状态</label>
                    <div class="clearfix qzlradio">
                        <asp:RadioButtonList ID="radlManage" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="开启" Value="0" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="关闭" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                    </div>
                  </div>
                    <div class="form-group">
                         <div id="divHidden" style="display: none;">
                                    <img src="images/admin_images/loading.gif" alt="" />
                                    <span style="color: #666;">正在保存...</span></div>
                                <div id="divShow">
                                    <asp:Button ID="btnSave" runat="server" Text="确 定" CssClass="btn btn-primary m-r-5" OnClick="btnSaveClick" />
                      <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                                    </div>
                    </div>
                  </div>
                  
                </div>
              </div>

                    
                </asp:Panel>
                <asp:Panel ID="pnlShow" runat="server" Visible="false" align="center">
                <div class="card-header"><h4>添加客服</h4></div>
              
              <div class="card-body">
                
                 目前没有任何数据 <a href="IM.aspx?Action=View">立即设置</a>
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

