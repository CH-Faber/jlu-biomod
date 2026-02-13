<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNewsSet.aspx.cs" Inherits="Manager_AddNewsSet" ValidateRequest="false" EnableEventValidation="false" %>

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
            var ckeckk = "";

            if ($("#ckname").is(':checked')) {
                ckeckk = "checked";
            }
            var ProName = $("#txtProName").val();
            if (ckeckk != "checked")
            {
                if (ProName == "" || ProName == null)
                {
                    alert("请填写名称");
                    $("#txtProName").focus(); //escape
                    return false;
                }
            }
            window.open("AddNews.aspx?ClassId=" + escape($("#txtClassID").val()) + "&Title=" + escape(ProName) + "&Check=" + escape(ckeckk), '_self');
        }
    </script>
</head>
<body data-headerbg="default" data-logobg="color_3" data-sidebarbg="color_3">
    <form id="form1" runat="server">

    <input runat="server" type="hidden" id="txtClassID" value="" />
        
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
                  
                  <div class="edit-form">
                    
                    
                    
                    <div class="form-group">
                      <label for="web_site_title">名称 <strong class="red">*</strong></label>
                       <input type="text" id="txtProName" class="form-control"  />
                    </div>

                          
                    <div class="form-group">
                     <div class="form-controls">
                     <div class="controls-box">
                             <label class="lyear-checkbox checkbox-inline checkbox-primary"><input class="ckbox" type="checkbox" id="ckname" /><span>使用图片名称作为标题</span></label>     
                                    
                      </div>
                         </div>
                        </div>


                    <div class="form-group">
                  
                                <div id="divShow">
                                   <input type="button" class="btn btn-primary m-r-5" value="设置好了，去添加图片" style="cursor: pointer;" onclick="checkNull()" />
                                    </div>
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
