<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNews.aspx.cs" Inherits="Manager_AddNews" ValidateRequest="false" EnableEventValidation="false" %>

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
</head>
<body data-headerbg="default" data-logobg="color_3" data-sidebarbg="color_3">

    <form id="form1" runat="server">
    <input runat="server" type="hidden" id="txtTitle" value="" />
    <input runat="server" type="hidden" id="txtCheck" value="" />
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
                    <div id="swfu_container" style="margin: 25px 0px;">
                                    <div>
                                        <span id="spanButtonPlaceholder"></span>
                                    </div>
                                    <div id="divFileProgressContainer" >
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


    
    <%--批量添加--%>
    <script type="text/javascript" src="swfupload/swfupload.js"></script>
    <script type="text/javascript" src="js/handlers.js"></script>
    <script type="text/javascript">
        var swfu;
        window.onload = function ()
        {

            swfu = new SWFUpload({

                upload_url: "Tools/uploadnews.aspx?ClassID=" + escape($("#txtClassID").val()) + "&Title=" + escape($("#txtTitle").val()) + "&Check=" + escape($("#txtCheck").val()),
                post_params: {
                    "ASPSESSID": "<%=Session.SessionID %>" // 附加参数,版本2新功能
                },

                // File Upload Settings
                file_size_limit: "29 MB", // 单位kb, 限制文件大小
                file_types: "*.jpg;*.gif;*.png;*.jpeg", //允许的文件类型
                file_types_description: "JPG Images",
                file_upload_limit: "999",    // Zero means unlimited

                file_queue_error_handler: fileQueueError,
                file_dialog_complete_handler: fileDialogComplete,
                upload_progress_handler: uploadProgress,
                upload_error_handler: uploadError,
                upload_success_handler: uploadSuccess,
                upload_complete_handler: uploadComplete,

                // Button settings
                button_image_url: "images/XPButtonNoText_160x22.png",
                button_placeholder_id: "spanButtonPlaceholder",
                button_width: 160,
                button_height: 22,
                button_text: '<span class="button">选择图片</span>',
                button_text_style: '.button { font-size: 14px; line-height:22px; text-align:center;}',
                button_text_top_padding: 1,
                button_text_left_padding: 5,

                // Flash Settings
                flash_url: "swfupload/swfupload.swf", // Relative to this file

                custom_settings: {
                    upload_target: "divFileProgressContainer"
                },

                // Debug Settings
                debug: false
            });
        }
    </script>
</body>
</html>
