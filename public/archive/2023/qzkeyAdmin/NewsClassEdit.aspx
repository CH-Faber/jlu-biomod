<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsClassEdit.aspx.cs" Inherits="Manager_NewsClassNameEdit" ValidateRequest="false" EnableEventValidation="false" %>

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
<style type="text/css">
.masonry-grid .masonry-item{ padding-bottom:0;}
.masonry-item{ background:#eee; text-align:center; margin-bottom:20px; min-height:150px;}
.tpgl-pic{ text-align:center; position:relative;}
.tpgl-pic .h5{  line-height:24px;border-bottom: solid 1px #ddd; margin-bottom:0; padding:8px 0; position:absolute; bottom:40px; width:100%; z-index:2;background:rgb(255,255,255,0.9)}
.tpgl-pic span{ color:#bbb; font-size:12px; }
.tpgl-pic .xiugai{ height:40px; line-height:40px;font-size:15px; position:absolute; bottom:0px; width:100%; z-index:2; background:rgb(255,255,255,0.9); }
    .yulan {margin-left: 50px;color: #33cabb;cursor: pointer;}
    #RadioNews, #RadioPic, #RadioDownLoad, #RadioContact, #RadioMessage {float: left;}
</style>
    <script type="text/javascript" src="js/jquery-1-7-2.js"></script>
    <script type="text/javascript" src="../layui/layui.js?muban"></script>
    <script type="text/javascript" src="js/update_column.js"></script>
    <script type="text/javascript">
        function checkNull()
        {
            var objdropColumnType = document.all("dropColumnType");
            if (objdropColumnType.options[objdropColumnType.selectedIndex].value == "--选择栏目类别--")
            {
                alert("请选择栏目类别！"); objdropColumnType.focus(); return false;
            }
            if (document.getElementById("txtColumnName").value == "")
            {
                alert("栏目名称为必填项！"); document.getElementById("txtColumnName").focus(); return false;
            }
            else
            {
                document.getElementById("divShow").style.display = "none";
                document.getElementById("divHidden").style.display = "block";
                return true;
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
            <div class="card-header"><h4>导航栏目 <span>带 "<strong class="red">*</strong>" 的为必填信息</span></h4></div>
              <div class="card-body">
                
                <div  class="row">
                   
                
                  <div class="form-group col-md-4">
                    <label for="type">父级</label>
                    <div class="form-controls">
                         <asp:DropDownList CssClass="form-control" runat="server" ID="dropParentId">
                         </asp:DropDownList>
                    </div>
                  </div>
                  
                  <div class="form-group col-md-4">
                    <label for="type">栏目类别 <strong class="red">*</strong></label>
                    <div class="form-controls">
                      <asp:DropDownList CssClass="form-control" ID="dropColumnType" runat="server">
                      </asp:DropDownList>
                    </div>
                  </div>

                       <div class="form-group col-md-4">
                    <label for="sort">显示顺序</label>
                      <input type="text" id="txtColumnNo" runat="server" class="form-control" value="1" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')" />
                  </div>
                 
                 <div class="form-group col-md-4">
                    <label for="seo_keywords">栏目名称 <strong class="red">*</strong></label>
                     <asp:TextBox ID="txtColumnName" CssClass="form-control" runat="server"></asp:TextBox>
                  </div> 
                  
                   <div class="form-group col-md-4">
                    <label for="seo_keywords">链接地址</label>
                                                <asp:TextBox runat="server" ID="txtColumnUrlClient" CssClass="form-control"></asp:TextBox>

                  </div> 
                  
                  <div class="form-group col-md-4">
                    <label for="seo_keywords">副标题</label>
                                                <asp:TextBox runat="server" ID="txtColumnSubName" CssClass="form-control"></asp:TextBox>

                  </div> 
                  
                 
                  
                  <div class="form-group col-md-4">
                    <label for="seo_keywords">SEO-标题</label>
                                              <asp:TextBox ID="txtTitle" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>

                  </div>
                  
                   <div class="form-group col-md-4">
                    <label for="seo_keywords">SEO-描述</label>
                                             <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>

                  </div>
                  
                   <div class="form-group col-md-4">
                    <label for="seo_keywords">SEO-关键词</label>
                                               <asp:TextBox ID="txtKeyWords" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>

                  </div>
                  
                 
                 <div class="form-group col-md-12">
                    <label for="seo_description">备注</label>
                       <asp:TextBox runat="server" ID="txtRemarks" TextMode="MultiLine" rows="5" CssClass="form-control"></asp:TextBox>
                  </div>
                  
                 
                  
                  <div class="form-group col-md-2">
                    <label for="title"> 尺寸(宽px)</label>
                      <input type="text" id="txtWidth" runat="server" class="form-control" value="0" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')" />
                  </div>
                  <div class="form-group col-md-2">
                    <label for="title">(高px）</label>
                   <input type="text" id="txtLength" runat="server" class="form-control" value="0" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')" />
                  </div>
              
                 
                  <div class="form-group col-md-12">
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
                           <input id="pic" type="hidden" runat="server" value="" />
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
                                   $("#pic").val("");
                                   var obj = document.getElementById('fileup'); obj.value = "";
                                   $(".yangba").hide();
                                   $(".tianjia").show();
                               }
                           </script>
                     </div>
                    </div>
                    
                      </div>
                   
                  
                  
                 
                 <div class="form-group col-md-12">
                    <label for="status">网站栏目</label>
                    <div class="clearfix qzlradio">
                        <asp:RadioButtonList ID="radlIndexStatus" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Text="是" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1" Text="否"></asp:ListItem>
                            </asp:RadioButtonList>
                    </div>
                  </div>
                  
                  <div class="form-group col-md-12" <%if (strRole != "1"){%> style="display: none;" <%} %>>
                    <label for="status">权限等级</label>
                    <div class="clearfix qzlradio">
                     <asp:RadioButtonList ID="radlRole" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Value="0" Text="管理员" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1" Text="超级管理员"></asp:ListItem>
                            </asp:RadioButtonList>
                    </div>
                  </div>

                      <div class="form-group col-md-12 news">
                    <label for="status">新闻列表样式</label>
                    <div class="clearfix qzlradio">
                        <asp:RadioButtonList ID="RadioNews" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Text="样式一"></asp:ListItem>
                                <asp:ListItem Value="2" Text="样式二"></asp:ListItem>
                                <asp:ListItem Value="3" Text="样式三"></asp:ListItem>
                                <asp:ListItem Value="4" Text="样式四"></asp:ListItem>
                                <asp:ListItem Value="5" Text="样式五"></asp:ListItem>
                                <asp:ListItem Value="99"  Selected="True" Text="仿站"></asp:ListItem>
                            </asp:RadioButtonList>
                            <font class="yulan">预览</font>
                    </div>
                  </div>

                      <div class="form-group col-md-12 pic">
                    <label for="status">图片列表样式</label>
                    <div class="clearfix qzlradio">
                        <asp:RadioButtonList ID="RadioPic" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Text="样式一"></asp:ListItem>
                                <asp:ListItem Value="2" Text="样式二"></asp:ListItem>
                                <asp:ListItem Value="3" Text="样式三"></asp:ListItem>
                                <asp:ListItem Value="99" Selected="True" Text="仿站"></asp:ListItem>
                            </asp:RadioButtonList>
                            <font class="yulan">预览</font>
                    </div>
                  </div>

                      <div class="form-group col-md-12 download">
                    <label for="status">下载中心样式</label>
                    <div class="clearfix qzlradio">
                        <asp:RadioButtonList ID="RadioDownLoad" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Text="样式一"></asp:ListItem>
                                <asp:ListItem Value="2" Text="样式二"></asp:ListItem>
                                <asp:ListItem Value="99" Selected="True" Text="仿站"></asp:ListItem>
                            </asp:RadioButtonList>
                            <font class="yulan">预览</font>
                    </div>
                  </div>

                      <div class="form-group col-md-12 contact">
                    <label for="status">联系方式样式</label>
                    <div class="clearfix qzlradio">
                        <asp:RadioButtonList ID="RadioContact" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Text="样式一"></asp:ListItem>
                                <asp:ListItem Value="2" Text="样式二"></asp:ListItem>
                                <asp:ListItem Value="3" Text="样式三"></asp:ListItem>
                                <asp:ListItem Value="99" Selected="True" Text="仿站"></asp:ListItem>
                            </asp:RadioButtonList>
                            <font class="yulan">预览</font>
                    </div>
                  </div>

                      <div class="form-group col-md-12 message">
                    <label for="status">在线留言样式</label>
                    <div class="clearfix qzlradio">
                        <asp:RadioButtonList ID="RadioMessage" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Text="样式一"></asp:ListItem>
                                <asp:ListItem Value="2" Text="样式二"></asp:ListItem>
                                <asp:ListItem Value="3" Text="样式三"></asp:ListItem>
                                <asp:ListItem Value="99" Selected="True" Text="仿站"></asp:ListItem>
                            </asp:RadioButtonList>
                            <font class="yulan">预览</font>
                    </div>
                  </div>
                 
                  <div class="form-group col-md-12">
                       <div id="divHidden" style="display: none;">
                                <img src="images/admin_images/loading.gif" alt="" />
                                <span style="color: #666;">正在保存...</span></div>
                            <div id="divShow">
                                <asp:Button ID="btnSave" runat="server" Text="确 定" target-form="add-form" OnClick="btnSaveClick" class="btn btn-primary ajax-post" />
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



    
    </form>
</body>
</html>
