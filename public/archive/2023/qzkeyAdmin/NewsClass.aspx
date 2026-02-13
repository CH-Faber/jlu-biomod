<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsClass.aspx.cs" Inherits="Manager_NewsClass" %>

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
        function showSelected()
        {
            var form = document.getElementById("form1");
            for (var i = 0; i < form.elements.length; i++)
            {
                if (form.elements[i].type == "checkbox" && form.elements[i].value != "-1")
                {
                    var obj = document.getElementById("select_" + form.elements[i].value);
                    for (var j = 0; j < obj.options.length; j++)
                    {
                        if (obj.options[j].value == document.getElementById("hidden_" + form.elements[i].value).value)
                        {
                            obj.options[j].selected = true;
                            break;
                        }
                    }
                }
            }
        }
        function checkNull()
        {
            var objdropColumnType = document.all("dropColumnType");
            if (objdropColumnType.options[objdropColumnType.selectedIndex].value == "--选择栏目类别--") { alert("请选择栏目类别！"); objdropColumnType.focus(); return false; }
            if (document.getElementById("txtColumnName").value == "") { alert("请输入栏目名称！"); document.getElementById("txtColumnName").focus(); return false; }
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
            return true;
        }
        function winconfirm()
        {
            if (confirm("删除后无法恢复！您确定要删除吗？")) { return true; }
            else { return false; }
        }
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
        function buttonPaixu_Save()
        {
            var xuhao = "";
            var paixu = "";
            var columnValue = "";
            var ColumnType = "";
            var ColumnUrl = "";
            form = document.getElementById("form1");
            for (var i = 0; i < form.elements.length; i++)
            {
                if (form.elements[i].type == "checkbox")
                {
                    if (form.elements[i].checked == true && form.elements[i].value != "-1")
                    {
                        xuhao = xuhao + "," + form.elements[i].value;
                        paixu = paixu + "," + document.getElementById("paixu_" + form.elements[i].value).value;
                        columnValue = columnValue + "," + document.getElementById("txt_" + form.elements[i].value).value;
                        ColumnUrl = ColumnUrl + "," + document.getElementById("txturl_" + form.elements[i].value).value;
                        var obj = document.getElementById("qzltype_" + form.elements[i].value).innerText;
                        ColumnType = ColumnType + "," + obj;
                    }
                }
            }
            if (xuhao != "")
            {
                console.log(ColumnType);
                document.getElementById("divbutton").style.display = "none";
                document.getElementById("loading").style.display = "inline";
                //提交信息开始
                $.ajax({
                    type: "get",
                    url: "ashx/Paixu.ashx?xuhao=" + xuhao + "&paixu=" + paixu + "&columnValue=" + escape(columnValue)+ "&ColumnType=" + escape(ColumnType)+ "&ColumnUrl=" + escape(ColumnUrl),
                    success: function (msg)
                    {
                        if (msg == "success")
                        {
                            document.getElementById("divbutton").style.display = "inline";
                            document.getElementById("loading").style.display = "none";
                            alert("保存成功！");
                            window.location.reload();
                        }
                        else if (msg == "failure")
                        {
                            document.getElementById("divbutton").style.display = "inline";
                            document.getElementById("loading").style.display = "none";
                            alert("含非法字符,操作失败！");
                            window.location.reload();
                        }
                        else
                        {
                            document.getElementById("divbutton").style.display = "inline";
                            document.getElementById("loading").style.display = "none";
                            alert("登录超时,请重新登录");
                            parent.window.location = "login.aspx";
                        }
                    }
                });
                //提交信息结束
            }
            else
            {
                alert("请勾选需要修改的项目！");
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
            <div class="card-header"><h4>导航栏目</h4></div>
              <div class="card-toolbar clearfix">
                
                <div class="toolbar-btn-action">
                  <a class="btn btn-primary m-r-5" href="NewsClassEdit.aspx?Action=Add"><i class="mdi mdi-plus"></i> 新增</a>
                    <a class="btn btn-success" id="divbutton" href="javascript:buttonPaixu_Save()"><i class="mdi mdi-check"></i> 更新</a>
                     <span id="loading" style="display: none;">
                            <img src="../images/loading_small.gif" />
                            <span style="color: #666;">正在保存...</span></span>
                  <%--<a class="btn btn-danger" href="#!"><i class="mdi mdi-window-close"></i> 删除</a>--%>
                </div>
              </div>
              <div class="card-body">
                
                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>
                          <label class="lyear-checkbox checkbox-primary">
                             <input onclick="checkFormAll(this.checked)" type="checkbox" value="-1" /><span></span>
                          </label>
                        </th>
                        <th>编号</th>
                        <th>栏目名称</th>
                        <th>权限</th>
                        <th>栏目</th>
                        <th>图片</th>
                        <th>排序</th>
                        <th>栏目类别</th>
                        
                        <th>链接地址</th>
                        <th>内容管理</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                    <tbody>
                    <asp:Literal runat="server" ID="litlist"></asp:Literal>
      
                      
                      
                     
                    </tbody>
                  </table>
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
