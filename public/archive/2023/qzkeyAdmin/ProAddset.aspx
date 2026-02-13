<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProAddset.aspx.cs" Inherits="Manager_ProAdd"
    ValidateRequest="false" EnableEventValidation="false" %>

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
            //拓展分类开始
            var str = document.getElementsByName("box");
            var objarray = str.length;
            var chestr = ",";
            for (i = 0; i < objarray; i++)
            {
                if (str[i].checked == true)
                {
                    chestr += str[i].value + ",";
                }
            }
            if (chestr == ",") { alert("请选择商品分类"); return false; }
            //商品名称
            var ProName = $("#txtProName").val();

            if (ckeckk != "checked")
            {
                if (ProName == "" || ProName == null)
                {
                    alert("请填写商品名称");
                    $("#txtProName").focus(); //escape
                    return false;
                }
            }
            window.open("ProAdd.aspx?Fenlei=" + escape(chestr) + "&ProName=" + escape(ProName) + "&Check=" + escape(ckeckk), '_self');
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

              <div class="tab-content">
                <div class="tab-pane active">
                  
                  <div class="edit-form">
                    <div class="form-group">
                      <label for="web_site_title">显示顺序</label>
                        <asp:TextBox ID="txtPaixu" runat="server"  CssClass="form-control" Text="0" onKeyUp="this.value=this.value.replace(/[^\d]/g,'')"></asp:TextBox>
                            (从大到小显示，最大的排在最上面)
                    </div>
                    
                    <div class="form-group">
                      <label for="web_site_title">商品分类 <strong class="red">*</strong></label>
                     <div class="form-controls">
             
                       <div class="controls-box">
                            
                             <div class="out_range">
                      
                      
                                    <%=strList %>
                                    <input type="hidden" id="fenlei" runat="server" />
                                    <script type="text/javascript">
                                        var objClassIdList = "<%=strClassID2 %>";
                                        var objClassId = "<%=intClassID%>";
                                        objClassIdList = objClassIdList.split(',');
                                        var str = document.getElementsByName("box");
                                        var objarray = str.length;
                                        for (i = 0; i < objarray; i++) {
                                            for (j = 0; j < objClassIdList.length; j++) {
                                                if (str[i].value == objClassIdList[j] || str[i].value == objClassId) {
                                                    str[i].checked = true;
                                                }
                                            }
                                        }
                                    </script>
                                 </div>
                      </div>
                    </div>
                    
                    </div>
                    
                    <div class="form-group">
                      <label for="web_site_title">名称 <strong class="red">*</strong></label>
                       <input type="text" id="txtProName" class="form-control"  />
                    </div>

                          
                    <div class="form-group">
                     <div class="form-controls">
                     <div class="controls-box">
                             <label class="lyear-checkbox checkbox-inline checkbox-primary"><input class="ckbox" type="checkbox"id="ckname" /><span>使用图片名称作为标题</span></label>     
                                    
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

        <script>
                    $(".pro-ej").change(function () {
                        if ($(this).find("input[type='checkbox']").is(":checked")) {
                            var date = $(this).find("input[type='checkbox']").attr("date");
                            if (!$("input[type='checkbox'][value='" + date + "']").is(":checked")) {
                                $("input[type='checkbox'][value='" + date + "']").click();
                            }
                        }
                    })
                </script>
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

