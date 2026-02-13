<%@ Page Language="C#" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="order" %>

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
        function BackWait() {
            var objdropTitle = document.all("dropTitle");
            if (document.getElementById("txtName").value == "") { alert("请输入名称！"); document.getElementById("txtName").focus(); return false; }
            else {
                document.getElementById("divShow").style.display = "none";
                document.getElementById("divHidden").style.display = "block";
                return true;
            }
        }
        function checkFormAll(chk) {
            form = document.getElementById("form1");
            for (var i = 0; i < form.elements.length; i++) {
                if (form.elements[i].type == "checkbox") {
                    form.elements[i].checked = chk;
                }
            }
        }
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
                    url: "ashx/delete.aspx?tb=tborder&id=" + strID,
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
        function CheckPage() {
            var num = document.getElementById("num").value;
            if (num == "" || num == null) { alert("请输入页码！"); document.getElementById("num").focus(); return false; }
            else if (num > <%=Pages%>) { alert("请输入正确的页码！"); document.getElementById("num").focus(); return false; }
            window.location.href = "order.aspx?page=" + escape(num - 1);
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
                                <div class="card-header"><h4>订单管理</h4></div>

              
              <div class="card-toolbar clearfix">
                
                <div class="toolbar-btn-action">
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
                              <asp:TemplateField HeaderText="订单号">
                                    <HeaderStyle  HorizontalAlign="left" />
                                    <ItemStyle  HorizontalAlign="left" />
                                    <ItemTemplate>
                                        <%#Eval("bianhao") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="To">
                                    <HeaderStyle  HorizontalAlign="left" />
                                    <ItemStyle  HorizontalAlign="left" />
                                    <ItemTemplate>
                                        <%#Eval("Name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Receiver">
                                    <HeaderStyle  HorizontalAlign="left" />
                                    <ItemStyle  HorizontalAlign="left" />
                                    <ItemTemplate>
                                        <%#Eval("dizhi") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="支付状态">
                                    <HeaderStyle  HorizontalAlign="left" />
                                    <ItemStyle  HorizontalAlign="left" />
                                    <ItemTemplate>
                                        <%#Eval("zhuangtai") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="总价格">
                                    <HeaderStyle  HorizontalAlign="left" />
                                    <ItemStyle  HorizontalAlign="left" />
                                    <ItemTemplate>
                                        $<%#Eval("jiage") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <HeaderStyle Width="100px" HorizontalAlign="left" />
                                <ItemStyle Width="100px" HorizontalAlign="left" />
                                <ItemTemplate>
                                    <a class="btn btn-xs btn-default" href="?Action=Add&Id=<%# Eval("id") %>&page=<%=page %>" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
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


               <div class="card-header"><h4>订单列表</h4></div>
              <div class="tab-content">
                <div class="tab-pane active">
                  
                  <div class="edit-form">
                    <div class="form-group">
                      <label for="web_site_title">购买产品 <strong class="red">*</strong></label>
                               
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                                        <tbody>
                                            <tr style="color: #A2A2A2; background: #F7F7F7;">
                                                <td width="5%" style="border-bottom: 1px solid #ccc;">&nbsp;&nbsp;产品名称
                                                </td>
                                                <td width="25%" style="border-bottom: 1px solid #ccc;"></td>
                                                <td align="center" style="border-bottom: 1px solid #ccc;">单价
                                                </td>
                                                <td align="center" style="border-bottom: 1px solid #ccc">数量
                                                </td>
                                                <td align="center" style="border-bottom: 1px solid #ccc">总价
                                                </td>
                                            </tr>
                                            <%for (int i = 0; i < intPro; i++)
                                                {
                                                    string proname = dtPro.Rows[i]["ProName"].ToString();
                                                    string ProPath = dtPro.Rows[i]["ProPath"].ToString();
                                                    string ProPrice = dtPro.Rows[i]["ProPrice"].ToString();
                                                    string ProNumber = dtPro.Rows[i]["ProNumber"].ToString();
                                                    int shuxingid = int.Parse(dtPro.Rows[i]["shuxingid"].ToString());

                                                    if (shuxingid > 0)
                                                    {

                                                        ProPrice = Showsx(shuxingid, "price");
                                                    }

                                                    if (!IsNumberic(ProPrice))
                                                    {
                                                        ProPrice = "0.0";
                                                    }
                                            %>
                                            <tr style="color: #A2A2A2; background: #F7F7F7;">
                                                <td height="36" style="border-bottom: 1px solid #ccc;">
                                                    <img style="height: 60px; width: 60px;" src="/<%=ProPath %>">
                                                </td>
                                                <td height="36" style="border-bottom: 1px solid #ccc;">&nbsp;&nbsp;<%=proname %>&nbsp;&nbsp;
                                                    <%if (shuxingid > 0)
                                                        { %>
                                                    <br />属性：<%=Showsx(shuxingid, "title") %>
                                                    <%} %>
                                                </td>
                                                <td align="center" style="border-bottom: 1px solid #ccc;">
                                                    <%=ProPrice %>
                                                </td>
                                                <td align="center" style="border-bottom: 1px solid #ccc">
                                                    <%=ProNumber %>
                                                </td>
                                                <td align="center" style="border-bottom: 1px solid #ccc">
                                                    <%=double.Parse(ProNumber)*double.Parse(ProPrice) %>
                                                </td>
                                            </tr>
                                            <%} %>
                                        </tbody>
                                    </table>


                    </div>
                    
                    <div class="form-group">
                      <label for="web_site_title">订单号： </label>
                               <%=strBianhao %>                       
                    </div>


                         <div class="form-group">
                      <label for="web_site_title">总价格： </label>
                              $ <%=strzj %>                      
                    </div>

                       <div class="form-group">
                      <label for="web_site_title">购买账号： </label>
                              <%=strUsername %>                     
                    </div>

                       <div class="form-group">
                      <label for="web_site_title">To：</label>
                                 <asp:TextBox ID="txtName" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>                
                    </div>

                          <div class="form-group">
                      <label for="web_site_title">Receiver：</label>
                                             <asp:TextBox ID="txtdizhi" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>             
                    </div>

                          <div class="form-group">
                      <label for="web_site_title">手机号：</label>
                                             <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                          <div class="form-group">
                      <label for="web_site_title">备注：</label>
                                          <asp:TextBox ID="fckKeyContent" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>
                    </div>


                     


                    <div class="form-group">
                    <label for="status">支付状态</label>
                    <div class="clearfix qzlradio">
                          <asp:RadioButtonList ID="radlIndexStatus" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="For the payment" Text="For the payment" Selected="True"></asp:ListItem>
                                        <asp:ListItem Value="Paid" Text="Paid"></asp:ListItem>
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
                <div class="card-header"><h4>订单</h4></div>
              
              <div class="card-body">
                 目前没有任何数据
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
            $(function () {
                $('.search-bar .dropdown-menu a').click(function () {
                    var field = $(this).data('field') || '';
                    $('#search-field').val(field);
                    $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
                });
            });
        </script>




    </form>
</body>
</html>

