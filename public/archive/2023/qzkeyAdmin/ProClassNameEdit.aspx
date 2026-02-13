<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProClassNameEdit.aspx.cs" Inherits="Manager_ProClassNameEdit" ValidateRequest="false" EnableEventValidation="false" %>

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
            if (document.getElementById("txtpaixu").value == "") { alert("排序为必填项！"); document.getElementById("txtpaixu").focus(); return false; }
            if (document.getElementById("txtConText").value == "") { alert("分类名称为必填项！"); document.getElementById("txtConText").focus(); return false; }
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
            <ul class="nav nav-tabs page-tabs">
                <li class="active"> <a>添加分类</a> </li>
              </ul>
              <div class="tab-content">
                <div class="tab-pane active">
                  
                  <div class="edit-form">
                    <div class="form-group">
                      <label for="web_site_title">排列顺序</label>
                      <asp:TextBox ID="txtpaixu" CssClass="form-control" runat="server" onKeyUp="this.value=this.value.replace(/[^\d]/g,'')"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                      <label for="web_site_title">父级</label>
                     <div class="form-controls">
                      <asp:DropDownList runat="server" CssClass="form-control" ID="dropParentId">
                            </asp:DropDownList>
                    </div>
                    
                    </div>
                    
                    <div class="form-group">
                      <label for="web_site_title">分类名称</label>
                            <asp:TextBox ID="txtConText" CssClass="form-control" runat="server"></asp:TextBox>

                    
                    </div>
                    
                    <div class="form-group">
                      <label for="web_site_title">SEO-标题</label>
                                                  <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" ></asp:TextBox>

                    
                    </div>
                    
                    <div class="form-group">
                      <label for="web_site_title">SEO-描述</label>
                                                  <asp:TextBox ID="txtDescription" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>

                    
                    </div>
                    
                    <div class="form-group">
                      <label for="web_site_title">SEO-关键词</label>
                                                  <asp:TextBox ID="txtKeyWords" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>

                    
                    </div>
                    
                    <div class="form-group">
                      <label for="web_site_title">分类状态</label>
                      <div class="clearfix qzlradio">
                      <asp:RadioButtonList ID="rblstate" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="默认显示" Value="0" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="不显示" Value="1"></asp:ListItem>
                            </asp:RadioButtonList>
                    </div>
                    
                    </div>
                    
                     <div class="form-group">
                      <label for="web_site_title">索引图片</label>
                      <div class="clearfix qzlradio">
                        <asp:RadioButtonList ID="rblpic" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="没有"></asp:ListItem>
                                <asp:ListItem Text="有"></asp:ListItem>
                            </asp:RadioButtonList>
                    </div>
                    
                    </div>
                    <div class="form-group">
                        <label for="web_site_title">缩略图</label>
                      <div class="form-controls">
                      
                      <ul class="list-inline clearfix lyear-uploads-pic" id="drop_area">
                    
                        <li class="col-xs-4 col-sm-3 col-md-2 yangba" <%if (string.IsNullOrEmpty(strImg) || strImg == "upload/default.jpg")
                            { %>style="display:none"<%} %>>
                          <figure>
                            <img id="tupian" src="/<%=strImg %>">
                            <figcaption>
                              <a class="btn btn-round btn-square btn-primary" href="javascript:$('#fileup').click();"><i class="mdi mdi-stackexchange"></i></a>
                              <a class="btn btn-round btn-square btn-danger" href="javascript:deletepic()"><i class="mdi mdi-delete"></i></a>
                            </figcaption>
                          </figure>
                        </li>
                        <li class="col-xs-4 col-sm-3 col-md-2 tianjia" <%if (!string.IsNullOrEmpty(strImg) && strImg != "upload/default.jpg")
                            { %>style="display:none"<%} %>>
                          <a class="pic-add" id="add-pic-btn" href="javascript:$('#fileup').click();" title="点击上传"></a>
                        </li>
                      </ul>
                      <div style="display:none">
                           <input id="fileup" type="file" runat="server" style="width: 260px;" class="button" />
                           <input id="pic" type="hidden" runat="server" value="upload/default.jpg" />
                           <script>
                               var dp = document.getElementById('drop_area');
                               dp.addEventListener('dragover', function (e) {
                                   e.stopPropagation();
                                   e.preventDefault();
                                   e.dataTransfer.dropEffect = 'copy';
                               });
                               dp.addEventListener("drop", function (e) {
                                   e.stopPropagation();
                                   e.preventDefault();
                                   var files = e.dataTransfer.files;
                                   console.log(files[0].name);
                                   $("#fileup")[0].files = files;
                                   var $file = $("#fileup");
                                   var fileObj = $file[0];
                                   var windowURL = window.URL || window.webkitURL;
                                   var dataURL;
                                   var $img = $("#tupian");
                                   if (fileObj && fileObj.files && fileObj.files[0]) {
                                       dataURL = windowURL.createObjectURL(fileObj.files[0]);
                                       $img.attr('src', dataURL);
                                       $(".yangba").show();
                                       $(".tianjia").hide();
                                   } else {
                                       dataURL = $file.val();
                                       var imgObj = document.getElementById("preview");
                                       // 两个坑:
                                       // 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
                                       // 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
                                       imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                                       imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;

                                   }
                               });
                               $("#fileup").change(function () {
                                   var $file = $(this);
                                   var fileObj = $file[0];
                                   var windowURL = window.URL || window.webkitURL;
                                   var dataURL;
                                   var $img = $("#tupian");
                                   if (fileObj && fileObj.files && fileObj.files[0]) {
                                       dataURL = windowURL.createObjectURL(fileObj.files[0]);
                                       $img.attr('src', dataURL);
                                       $(".yangba").show();
                                       $(".tianjia").hide();
                                   } else {
                                       dataURL = $file.val();
                                       var imgObj = document.getElementById("preview");
                                       // 两个坑:
                                       // 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
                                       // 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
                                       imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                                       imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
                           
                                   }
                               })
                               function deletepic() {
                                   $("#pic").val("upload/default.jpg");
                                   var obj = document.getElementById('fileup'); obj.value = "";
                                   $(".yangba").hide();
                                   $(".tianjia").show();
                               }
                           </script>
                     </div>
                    </div>
                    
                    
                    </div>
                    
  
                    <div class="form-group">
                      <label for="web_site_description">分类介绍</label>
                        <textarea id="content" rows="8" cols="8" runat="server" style="height: 270px;"></textarea>
                    </div>
                    
                    <div class="form-group">
                        <div id="divHidden" style="display: none;">
                                <img src="images/admin_images/loading.gif" alt="" />
                                <span style="color: #666;">正在保存...</span></div>
                            <div id="divShow">
                                <asp:Button ID="btnSave" runat="server" Text="确 定" OnClick="btnSaveClick" class="btn btn-primary m-r-5" />
                      <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button></div>
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
<%--加载编辑器--%>
<script type="text/javascript" src="../qz_ueditor/ueditor.config.js?400301"></script>
<script type="text/javascript" src="../qz_ueditor/_examples/editor_api.js?400301"></script>
<script type="text/javascript">
    var ue = UE.getEditor('content', {autoHeightEnabled: false});
</script>
</html>
