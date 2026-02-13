<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PageStateControl.aspx.cs" Inherits="Manager_PageStateControl" %>

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
        function checkNull()
        {
            if (confirm('此操作可能需要花费一些时间！\n\n请谨慎！确定要执行该操作吗？'))
            {
                document.getElementById("divShow").style.display = "none";
                document.getElementById("divHidden").style.display = "block";
                return true;
            }
            else
            {
                return false;
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
            <div class="card-header"><h4>生成静态</h4></div>
              <div class="card-body">
                
                <div  class="row">
           
                  
                    <div class="form-group col-md-12">
                    <label for="seo_keywords">注：本功能可能耗时长，请耐心等待。</label>
                    <p>启用生成静态的情况下，网站每次数据有变动都要在这里保存更新一下。</p>
                  </div>
                 <div class="form-group col-md-12">
                    <label for="status">状态</label>
                    <div class="clearfix qzlradio">
                       <asp:RadioButtonList ID="radState" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1">全站静态</asp:ListItem>
                                    <asp:ListItem Value="2">首页静态</asp:ListItem>
                                    <asp:ListItem Value="0">禁用</asp:ListItem>
                                </asp:RadioButtonList>
                    </div>
                  </div>
              
                  <div class="form-group col-md-12">
                       <div id="divHidden" style="display: none; padding: 5px 0px;">
                                    <table>
                                        <tr>
                                            <td>
                                                <img src="images/admin_images/loading.gif" />
                                            </td>
                                            <td>
                                                <span style="color: #666; padding-left:5px;">正在保存，请耐心等待...</span>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div id="divShow" style="padding-top: 5px;">
                                    <asp:Button ID="btnStaticPage" Text="确 定" CssClass="btn btn-primary ajax-post" runat="server" OnClick="btnSaveStaticPage" target-form="add-form"/>
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

