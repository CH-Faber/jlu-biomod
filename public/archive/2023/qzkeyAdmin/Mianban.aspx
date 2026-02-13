<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Mianban.aspx.cs" Inherits="Manager_Mianban" %>

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
               <div class="card-header"><h4>网站备份</h4></div>
           
              <div class="tab-content" style="padding-bottom:20px;">
                <div class="tab-pane active">
                   <div class="toolbar-btn-action">
                  <a class="btn btn-primary m-r-5" id="btnsjbf" onclick="shujubeifen()"><i class="mdi mdi-alphabetical"></i> 数据备份</a>
                  <a class="btn btn-success m-r-5 m-l-10" id="btnymbf" type="button" onclick="ymbf()"><i class="mdi mdi-auto-upload"></i> 源码备份</a>

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
<script type="text/javascript">
                                //数据库备份
                                function shujubeifen()
                                {
                                    $("#btnsjbf").unbind();
                                    $("#btnsjbf").attr("disabled", "disabled"); //不可用
                                    $("#btnsjbf").text("正在备份");
                                    $.ajax({
                                        type: "get",
                                        async: true,
                                        url: "shujukubeifen.aspx?spm" + GetCode(9),
                                        datatype: "json",
                                        success: function (msg)
                                        {
                                            if (msg == "1")
                                            {
                                                $("#btnsjbf").css("color", "blue");
                                                $("#btnsjbf").text("备份成功");
                                            }
                                            else
                                            {
                                                $("#btnsjbf").css("color", "red");
                                                $("#btnsjbf").text("备份失败");
                                            }
                                        }
                                    });
                                }

                                function ymbf()
                                {
                                    $("#btnymbf").unbind();
                                    $("#btnymbf").attr("disabled", "disabled"); //不可用
                                    $("#btnymbf").text("正在备份");
                                    $.ajax({
                                        type: "get",
                                        async: true,
                                        url: "YuanmaBeifen.aspx?key=39x3f39x2hjsfhsdfs2x3f8gs&spm=" + GetCode(9),
                                        datatype: "json",
                                        success: function (msg)
                                        {
                                            if (msg == "1")
                                            {
                                                $("#btnymbf").css("color", "blue");
                                                $("#btnymbf").text("操作成功");
                                            }
                                            else
                                            {
                                                $("#btnymbf").css("color", "red");
                                                $("#btnymbf").text("操作失败");
                                            }
                                        }
                                    });
                                }

                                function sxtz()
                                {
                                    $("#btnsxtz").unbind();
                                    $("#btnsxtz").attr("disabled", "disabled"); //不可用
                                    $("#btnsxtz").val("正在处理");
                                    $.ajax({
                                        type: "get",
                                        async: true,  // 设置同步方式  ********
                                        url: "ashx/shangxiantongzhi.aspx?action=tongzhi",
                                        datatype: "json",
                                        success: function (msg)
                                        {
                                            if (msg == "1")
                                            {
                                                $("#btnsxtz").css("color", "blue");
                                                $("#btnsxtz").val("操作成功");
                                            }
                                            else
                                            {
                                                $("#btnsxtz").css("color", "red");
                                                $("#btnsxtz").val("操作失败");
                                            }
                                        }
                                    });
                                }                                                              
                            </script>
    
    </form>
</body>
</html>
