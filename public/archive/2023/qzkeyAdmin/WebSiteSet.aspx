<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebSiteSet.aspx.cs" Inherits="Manager_WebSiteSet" ValidateRequest="false" EnableEventValidation="false" %>

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
            var CompanyName = document.getElementById("txtCompanyName").value;
            if (CompanyName.trim() == "") { alert("请填写单位名称"); document.getElementById("txtCompanyName").focus(); return false; }
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
              <div class="card-header"><h4>基本信息 <span>带 "<strong class="red">*</strong>" 的为必填信息</span></h4></div>
              <div class="card-body">

     
                  <div class="row">
                    <div class="form-group col-md-6">
                      <label for="web_site_title">单位名称 <strong class="red">*</strong></label>
                                                  <asp:TextBox ID="txtCompanyName" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>
                    <div class="form-group col-md-6">
                      <label for="web_site_title">单位地址</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                  </div>
                    <div class="row">
                    <div class="form-group col-md-6">
                      <label for="web_site_title">固定电话</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>

                    
                    </div>
                    
                    <div class="form-group  col-md-6">
                      <label for="web_site_title">手机号码</label>
                                   <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>

                    
                    </div>
                    </div>
                    <div class="row">
                    <div class="form-group col-md-6">
                      <label for="web_site_title">邮箱</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>

                    
                    </div>

                        <div class="form-group col-md-6">
                      <label for="web_site_title">传真</label>
                                            <asp:TextBox ID="txtFax" runat="server" CssClass="form-control"></asp:TextBox>


                    
                    </div>
                    </div>
                    <div class="row">
                    <div class="form-group col-md-6">
                      <label for="web_site_title">联系人</label>
                                           <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>

                    
                    </div>
                    
                      <div class="form-group col-md-6">
                      <label for="web_site_title">QQ</label>
                                         <asp:TextBox ID="txtQQ" runat="server" CssClass="form-control"></asp:TextBox>

                    
                    </div>
                    </div>
                    <div class="row">
                          <div class="form-group col-md-6">
                      <label for="web_site_title">微信号</label>
                                         <asp:TextBox ID="txtWeChat" runat="server" CssClass="form-control"></asp:TextBox>

                    
                    </div>
                                  
                             <div class="form-group col-md-6">
                      <label for="web_site_title">邮编</label>
                                         <asp:TextBox ID="txtZip" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
</div>
<div class="row">

                    <div class="form-group col-md-6">
                      <label for="web_site_title">ICP备案号</label>
                                                  <asp:TextBox ID="txtICP" runat="server" CssClass="form-control"></asp:TextBox>
                    
                    </div>
                    
                     <div class="form-group col-md-6">
                      <label for="web_site_title">网站网址</label>
                          <asp:TextBox ID="txtWebUrl" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    
  </div>
                    <div class="form-group">
                      <label for="web_site_description">网站地图</label>
                       <textarea id="content" rows="8" cols="8" runat="server" style="height: 270px;z-index:1; position:relative;"></textarea>
                    
                    </div>
                    
                    
                    <div class="form-group">
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
                                <asp:Button ID="btnSave" Text="确 定" runat="server" OnClick="btnSaveClick"  CssClass="btn btn-primary m-r-5"/>
                                <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
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
<%--加载编辑器--%>
<script type="text/javascript" src="../qz_ueditor/ueditor.config.js?400301"></script>
<script type="text/javascript" src="../qz_ueditor/_examples/editor_api.js?400301"></script>
<script type="text/javascript">
    var ue = UE.getEditor('content', {autoHeightEnabled: false});
</script>
</html>

