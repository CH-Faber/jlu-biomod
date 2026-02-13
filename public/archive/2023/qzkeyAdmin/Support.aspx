<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Support.aspx.cs" Inherits="Manager_Support" ValidateRequest="false" EnableEventValidation="false" %>

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
    <link href="css/style.min.css?v=1" rel="stylesheet">
    <script type="text/javascript">
        function checkNull()
        {
            if (document.getElementById("txtSupportName").value == "") { alert("技术支持名称不能为空！"); document.getElementById("txtSupportName").focus(); return false; }
            if (document.getElementById("txtWebSite").value == "") { alert("网址不能为空！"); document.getElementById("txtWebSite").focus(); return false; }
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
               <div class="card-header"><h4>技术支持</h4></div>
           
              <div class="tab-content">
                <div class="tab-pane active">
                  
                    
                    <div class="form-group">
                      <label for="web_site_title">管理入口</label>
                      <div class="clearfix qzlradio">
                      <asp:RadioButtonList ID="radlManage" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="显示" Value="1" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="不显示" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                    </div>
                    
                    </div>
                    
                     <div class="form-group">
                      <label for="web_site_title">技术支持</label>
                      <div class="clearfix qzlradio">
                      <asp:RadioButtonList ID="radlState" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="显示" Value="1" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="不显示" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                    </div>
                    
                    </div>
                    
                     <div class="form-group">
                      <label for="web_site_title">网站地图 </label>
                      <div class="clearfix qzlradio">
                       <asp:RadioButtonList ID="radlSitemap" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="显示" Value="1" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="不显示" Value="0"></asp:ListItem>
                            </asp:RadioButtonList>
                    </div>
                    
                    </div>
                    
                    
                    <div class="form-group">
                      <label for="web_site_title">技术支持名称</label>
                                                  <asp:TextBox ID="txtSupportName" CssClass="form-control" runat="server" ></asp:TextBox>

                    </div>
                    
  
                    <div class="form-group">
                      <label for="web_site_description">关键词</label>
                                                 <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" TextMode="MultiLine" rows="5"></asp:TextBox>

                    
                    </div>
                    
                    <div class="form-group">
                      <label for="web_site_title">网址</label>
                      <asp:TextBox ID="txtWebSite" CssClass="form-control" runat="server" Text="http://"></asp:TextBox>
                    <p>网址前加http://</p>
                    </div>
                    
                    <div class="form-group">
                         <div id="divHidden" style="display: none;">
                                <table>
                                    <tr>
                                        <td>
                                            <img src="images/admin_images/loading.gif" />
                                        </td>
                                        <td>
                                            <span style="color: #666; padding-left: 5px;">正在保存...</span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="divShow">
                      <asp:Button ID="btnSave" CssClass="btn btn-primary m-r-5" Text="确 定" runat="server" OnClick="btnSaveClick" />
                      <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                                </div>
                    </div>
                  
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

