<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdatePassword.aspx.cs" Inherits="Manager_UpdatePassword" %>

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
            if (document.getElementById("txtAdminPassword").value == "") { alert("请输入原密码！"); document.getElementById("txtAdminPassword").focus(); return false; }
            else if (document.getElementById("txtAdminPassword2").value == "") { alert("请输入新密码！"); document.getElementById("txtAdminPassword2").focus(); return false; }
            else if (document.getElementById("txtAdminPassword3").value == "") { alert("请再输入一次新密码！"); document.getElementById("txtAdminPassword3").focus(); return false; }
            else if (document.getElementById("txtAdminPassword2").value != document.getElementById("txtAdminPassword3").value) { alert("两次输入的新密码不一致！"); return false; }
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
              <div class="card-body">
                
                <form method="post" action="#!" class="site-form">
                  <div class="form-group">
                    <label for="old-password">旧密码</label>
                            <asp:TextBox ID="txtAdminPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>

                  </div>
                  <div class="form-group">
                    <label for="new-password">新密码</label>
                                                <asp:TextBox ID="txtAdminPassword2" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>

                  </div>
                  <div class="form-group">
                    <label for="confirm-password">确认新密码</label>
                                                <asp:TextBox ID="txtAdminPassword3" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>

                  </div>
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
                                <asp:Button ID="btnSave" Text="修 改 密 码" runat="server" OnClick="btnSaveClick" CssClass="btn btn-primary" />
                                </div>
                </form>
       
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

