<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SitemapControl.aspx.cs" Inherits="Manager_SitemapControl" %>

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
    <link href="css/style.min.css" rel="stylesheet">
    <script src="js/jquery-1-7-2.js" type="text/javascript"></script>
    <script src="js/common.js" type="text/javascript"></script>
    <script src="js/jquery-1.3.2.min.js?muban"></script>
    <link href="../layui/css/layui.css?muban" rel="stylesheet" type="text/css" />
    <script src="../layui/layui.js?muban"></script>
    <script type="text/javascript">
        function checkNull() {
            if (confirm('此操作可能需要花费一些时间！\n\n请谨慎！确定要执行该操作吗？')) {
                document.getElementById("divShow").style.display = "none";
                document.getElementById("divHidden").style.display = "block";
                return true;
            }
            else {
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
    <main class="lyear-layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
               <div class="card-header"><h4>网站地图</h4></div>
           
              <div class="tab-content" style="padding-bottom:20px;">
                <div class="tab-pane active " id="divShow" >
                   <div class="toolbar-btn-action">
                  <a class="btn btn-primary m-r-5" id="btnsjbf" onclick="window.open('/sitemap.xml')"><i class="mdi mdi-alphabetical"></i> 预览网站地图</a>
                  <a class="btn btn-success m-r-5 m-l-10" id="btnymbf" type="button" onclick="$('#btnStaticPage').click()"><i class="mdi mdi-auto-upload"></i> 生成网站地图</a>

                </div>

                  <div style="display:none">
                     <asp:Button ID="btnStaticPage" Text="生成网站地图" runat="server" OnClick="btnSaveStaticPage" CssClass="layui-btn layui-btn-sm" />
                  </div>
                </div>
                  <div class="tab-pane active " id="divHidden" style="display:none" >
                    <table>
                                            <tr>
                                                <td>
                                                    <i class="layui-icon layui-icon-loading-1 layui-icon layui-anim layui-anim-rotate layui-anim-loop" style="font-size: 30px; color: #666;"></i>
                                                </td>
                                                <td>
                                                    <span style="color: #666; padding-left: 5px;">正在生成，请耐心等待...</span>
                                                </td>
                                            </tr>
                                        </table>
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

