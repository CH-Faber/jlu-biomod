<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SEO.aspx.cs" Inherits="Manager_SEO" %>

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
            if (document.getElementById("txtTitle").value == "") { alert("网站标题为必填项！"); document.getElementById("txtTitle").focus(); return false; }
            if (document.getElementById("txtDescription").value == "") { alert("网站描述为必填项！"); document.getElementById("txtDescription").focus(); return false; }
            if (document.getElementById("txtKeywords").value == "") { alert("网站关键词为必填项！"); document.getElementById("txtKeywords").focus(); return false; }
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
            return true;
        }
        //判断字符长度开始
        function testMesLen(mes, maxlen, objID)
        {
            document.getElementById(objID).value = maxlen - mes.value.length;
            if (document.getElementById(objID).value < 0)
            {
                alert("最多输入" + maxlen + "个字符！");
                mes.value = mes.value.substring(0, maxlen);
                document.getElementById(objID).value = maxlen - mes.value.length;
            }
        }
        //判断字符长度结束
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
            <div class="card-header"><h4>TDK设置 <span>带 "<strong class="red">*</strong>" 的为必填信息</span></h4></div>
            <div class="card-body">
                      <div class="form-group">
                      <label for="web_site_title">网站标题 <strong class="red">*</strong></label>
                                                  <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" ></asp:TextBox>

                    </div>          
                    
                     <div class="form-group">
                    <label for="seo_description">网站描述 <strong class="red">*</strong></label>
                            <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" CssClass="form-control" rows="5" ></asp:TextBox>

                  </div>
                    
                   
                    <div class="form-group">
                    <label for="seo_description">网站关键词 <strong class="red">*</strong></label>
                            <asp:TextBox ID="txtKeywords" TextMode="MultiLine" runat="server" CssClass="form-control" rows="5"></asp:TextBox>

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
                                <asp:Button ID="btnSave" Text="确 定" runat="server" OnClick="btnSaveClick" CssClass="btn btn-primary m-r-5" />
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
</html>

