<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProClass.aspx.cs" Inherits="Manager_ProClass" %>

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
            if (document.getElementById("txtPaixu").value == "") { alert("排序为必填项！"); document.getElementById("txtPaixu").focus(); return false; }
            if (document.getElementById("txtContext").value == "") { alert("分类名称为必填项！"); document.getElementById("txtContext").focus(); return false; }
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
            return true;
        }
        function winconfirm()
        {
            if (confirm("警告：\n\n删除这个分类，该分类下的产品将被一起删除！\n\n点“确定“执行本次操作，点”取消“结束本次操作")) { return true; }
            else { return false; }
        }
    </script>
    <script type="text/javascript">
        function checkFormAll(chk)
        {
            form = document.getElementById("form1");
            for (var i = 0; i < form.elements.length; i++)
            {
                if (form.elements[i].type == "checkbox")
                {
                    form.elements[i].checked = chk;
                }
            }
        }
        function buttonPaixu_Delete()
        {
            var strID = "";
            form = document.getElementById("form1");
            for (var i = 0; i < form.elements.length; i++)
            {
                if (form.elements[i].type == "checkbox")
                {
                    if (form.elements[i].checked == true && form.elements[i].value != "-1")
                    {
                        strID = strID + "," + form.elements[i].value;
                    }
                }
            }
            if (strID != "")
            {
                document.getElementById("divbutton").style.display = "none";
                document.getElementById("loading").style.display = "inline";
                //提交信息开始
                $.ajax({
                    type: "get",
                    url: "ashx/delete.aspx?tb=ProClass&id=" + strID,
                    success: function (msg)
                    {
                        if (msg == "success")
                        {
                            document.getElementById("divbutton").style.display = "inline";
                            document.getElementById("loading").style.display = "none";
                            alert("操作成功！");
                            window.location.reload();
                        }
                        else
                        {
                            document.getElementById("divbutton").style.display = "inline";
                            document.getElementById("loading").style.display = "none";
                            alert("操作失败！");
                            window.location.reload();
                        }
                    }
                });
                //提交信息结束
            }
            else
            {
                alert("请勾选需要删除的项目！");
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

                            <asp:Panel ID="pnlAdd" runat="server">
                
              <div class="card-header"><h4>添加分类 <span>带 "<strong class="red">*</strong>" 的为必填信息</span></h4></div>
              <div class="tab-content">
                <div class="tab-pane active">
                  
                  <div class="edit-form">
                    <div class="form-group">
                      <label for="web_site_title">排列顺序</label>
                      <asp:TextBox ID="txtPaixu" CssClass="form-control" runat="server"  onKeyUp="this.value=this.value.replace(/[^\d]/g,'')"
                                    Text="0"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                      <label for="web_site_title">父级</label>
                     <div class="form-controls">
                        <asp:DropDownList runat="server" CssClass="form-control" ID="dropParentId">
                        </asp:DropDownList>
                    </div>
                    
                    </div>
                    
                    <div class="form-group">
                      <label for="web_site_title">分类名称  <strong class="red">*</strong></label>
                         <asp:TextBox runat="server" CssClass="form-control" ID="txtContext"></asp:TextBox>
                    </div>
                    <div class="form-group">
                         <div id="divHidden" style="display: none;">
                                    <img src="images/admin_images/loading.gif" alt="" />
                                    <span style="color: #666;">正在保存...</span></div>
                                <div id="divShow">
                        <asp:Button ID="btnSave" runat="server" Text="确 定" OnClick="btnSaveClick" class="btn btn-primary m-r-5" />
                      <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                                    </div>

                    </div>
                  </div>
                  
                </div>
              </div>
                </asp:Panel>
                <asp:Panel ID="pnlList" runat="server">




               <div class="card-header"><h4>添加分类</h4></div>
              <div class="card-toolbar clearfix">
                
                <div class="toolbar-btn-action">
                  <a class="btn btn-primary" href="ProClass.aspx?Action=Add"><i class="mdi mdi-plus"></i> 添加分类</a>
                  <a id="divbutton" class="btn btn-danger" href="javascript:buttonPaixu_Delete()"><i class="mdi mdi-window-close"></i> 删除分类</a>
                  <a id="loading"  style="display: none;" class="btn btn-danger" ><i class="mdi mdi-window-close"></i> 正在删除...</a>
                </div>
              </div>
              <div class="card-body">
                
                <div class="table-responsive">
                  
                          <table class="table table-bordered">
                        <tr>
                            <th style="width: 40px; padding-left:10px;">
                                <label class="lyear-checkbox checkbox-primary">
                                <input onclick="checkFormAll(checked)" type="checkbox" id="chk_1" name="chk_1" value="-1"><span></span>
                                    </label>
                            </th>
                             <th>编号</th>
                            <th>商品分类</th>
                            <th>排序</th>
                            <th>分类状态</th>
                            <th>索引图片</th>
                            <th>商品管理</th>
                            <th>操作</th>
                        </tr>
                        <asp:Literal runat="server" ID="litlist"></asp:Literal>
                    </table>
                </div>
                
       
              </div>

                    
              
                   
                </asp:Panel>


            
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

