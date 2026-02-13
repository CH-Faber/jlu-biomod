<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetupCode.aspx.cs" ValidateRequest="false"
    Inherits="Manager_SetupCode" %>

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
            var CodeState = document.getElementsByName("radlState");
            for (var i = 0; i < CodeState.length; i++)
            {
                if (CodeState[i].checked && CodeState[i].value == "1" && document.getElementById("txtContent").value == "")
                {
                    alert("请输入要嵌入的代码！");
                    document.getElementById("txtContent").focus();
                    return false;
                }
            }
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
            <div class="card-header"><h4>嵌入代码</h4></div>
              <div class="card-body">
                
                <div class="row">
           
                  
                    <div class="form-group col-md-12">
                    <label for="seo_keywords">代码内容</label>
                            <asp:TextBox ID="txtContent" runat="server" CssClass="form-control" TextMode="MultiLine" rows="10"></asp:TextBox>

                  </div>
                 <div class="form-group col-md-12">
                    <label for="status">状态</label>
                    <div class="clearfix qzlradio">
                            <asp:RadioButtonList ID="radlState" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="关闭" Value="0" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="启用" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                    </div>
                  </div>
              
                  <div class="form-group col-md-12">
                       <div id="divHidden" style="display: none;">
                                <img src="images/admin_images/loading.gif" alt="" />
                                <span style="color: #666;">正在保存...</span></div>
                            <div id="divShow">
                                <asp:Button ID="btnSave" CssClass="btn btn-primary ajax-post" Text="确 定" runat="server"  target-form="add-form" OnClick="btnSaveClick" />
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

