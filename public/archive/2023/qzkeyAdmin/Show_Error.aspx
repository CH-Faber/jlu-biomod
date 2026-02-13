<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Show_Error.aspx.cs" Inherits="Manager_Show_Error" %>

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
</head>
    <body data-headerbg="color_3" data-logobg="color_3">
    <form id="form2" runat="server">
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
              <div class="tab-content">
                <div class="tab-pane active">
                  
                  <div  class="edit-form">
                     <!--内容开始-->
                <table cellpadding="0" cellspacing="10" align="center" width="100%">
                    <tr>
                        <td align="right" width="40%">
                            <img src="images/admin_images/error.jpg" />
                        </td>
                        <td align="left" width="60%" valign="bottom">
                            <table cellpadding="0" cellspacing="10" align="center" width="100%">
                                <tr align="left">
                                    <td width="100%" colspan="2" style="color: Red;">
                                        <%=strMessage%>
                                    </td>
                                </tr>
                                                              <tr>
                                    <td valign="middle" colspan="2" style="text-align: left;">
                                        <a href="<%=strUrl%>" title="返回上一页">返回上一页</a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <!--内容结束-->
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

    </form>
</body>

</html>

