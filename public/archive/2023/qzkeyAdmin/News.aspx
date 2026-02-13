<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="Manager_News" ValidateRequest="false" EnableEventValidation="false" %>

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
            if (document.getElementById("txtTitle").value == "") { alert("请输入文章标题！"); document.getElementById("txtTitle").focus(); return false; }
            if (document.getElementById("txtPutdate").value == "") { alert("请选择发表日期！"); document.getElementById("txtPutdate").focus(); return false; }
            document.getElementById("divShow").style.display = "none";
            document.getElementById("divHidden").style.display = "block";
            return true;
        }
    </script>
    <!--Import javascript file start -->
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb23112"></script>
    <!--Import javascript file end -->
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
                document.getElementById("loading").style.display = "block";
                //提交信息开始
                $.ajax({
                    type: "get",
                    url: "ashx/delete.aspx?tb=News&id=" + strID,
                    success: function (msg)
                    {
                        if (msg == "success")
                        {
                            document.getElementById("divbutton").style.display = "block";
                            document.getElementById("loading").style.display = "none";
                            alert("操作成功！");
                            window.location.reload();
                        }
                        else
                        {
                            document.getElementById("divbutton").style.display = "block";
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
        function buttonShow(state)
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
                //提交信息开始
                $.ajax({
                    type: "get",
                    url: "ashx/ShowNews.aspx?state="+state+"&id=" + strID,
                    success: function (msg)
                    {
                        if (msg == "success")
                        {
                            alert("操作成功！");
                            window.location.reload();
                        }
                        else
                        {
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
                <asp:Panel ID="pnlList" runat="server">
                <div class="card-header"><h4><%=strColumnName %></h4></div>
                
                    <div class="card-toolbar clearfix">
              
                
                <div class="toolbar-btn-action">
                  <a class="btn btn-primary" href="News.aspx?Action=Add&ClassId=<%=intClassID%>&ColumnType=<%=strColumnType%>"><i class="mdi mdi-plus"></i> 发布文章</a>
                  <a class="btn btn-primary" href="AddNewsSet.aspx?ClassId=<%=intClassID%>"><i class="mdi mdi-plus"></i> 批量添加</a>
                  <a class="btn btn-success" href="javascript:buttonShow(0)"><i class="mdi mdi-check"></i> 显示</a>
                  <a class="btn btn-warning" href="javascript:buttonShow(2)"><i class="mdi mdi-block-helper"></i> 隐藏</a>
                  <a class="btn btn-danger" id="divbutton" href="javascript:buttonPaixu_Delete()"><i class="mdi mdi-window-close"></i> 删除</a>
                  
                        <span id="loading" style="display: none;">
                            <img src="../images/loading_small.gif" />
                            <span style="color: #666;">正在删除...</span></span>
                </div>
              </div>
                       <div class="card-body">
                
                <div class="table-responsive">

                    <asp:GridView ID="gvList" DataKeyNames="id" runat="server" Class="table table-bordered" OnRowDeleting="gvList_RowDeleting" OnDataBound="GridView_DataBind" AllowPaging="True" PageSize="15" GridLines="None" AutoGenerateColumns="False" EmptyDataText="暂无数据">
                        <Columns>
                            <asp:TemplateField HeaderText="<label class='lyear-checkbox checkbox-primary'><input onclick='checkFormAll(checked)' type='checkbox' id='chk_1' name='chk_1' value='1' /><span></span></label>">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <label class="lyear-checkbox checkbox-primary">
                                    <input type='checkbox' id='chk_<%#Eval("id")%>' name='chk_<%#Eval("id")%>' value='<%#Eval("id")%>' />
                                         <span></span>
                          </label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编号">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("id") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="状态">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#chkIstop(Eval("state", "{0}"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="排序">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("paixu") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="缩略图">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" CssClass="News" />
                                <ItemTemplate>
                                    <%#chkPic(Eval("Path", "{0}"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="&nbsp;标题">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <a href="?Action=Add&Id=<%# Eval("Id") %>&ClassId=<%#Eval("ClassId") %>&ColumnType=<%=strColumnType%>">
                                        <%#Eval("Title") %></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="点击">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("hits") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="状态">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Eval("StaticPage","{0}")=="2"?"<font style=\"color:red\">隐藏</font>":"显示"%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="发布时间">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <%#Convert.ToDateTime(Eval("Putdate")).ToString("yyyy-MM-dd") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="操作">
                                <HeaderStyle HorizontalAlign="left" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                     <div class="btn-group">
                            <a class="btn btn-xs btn-default" href="?Action=Add&Id=<%# Eval("Id") %>&ClassId=<%#Eval("ClassId") %>&ColumnType=<%=strColumnType%>" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
                                           <a class="btn btn-xs btn-default" target="_blank" href="../<%#changeUrl(strColumnType,Eval("ID", "{0}")) %>" title="查看" data-toggle="tooltip"><i class="mdi mdi-eye"></i></a>
                                        <asp:LinkButton CssClass="btn btn-xs btn-default" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Title="删除" data-toggle="tooltip" OnClientClick="return confirm('删除后无法恢复！您确定要删除吗？')"><i class="mdi mdi-window-close"></i></asp:LinkButton>
                          </div>
                                
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerTemplate>
                            <div id="main" style="width: 100%; padding-top: 10px; text-align: center;">
                                &nbsp;&nbsp;页次：<asp:Label ID="lblPageCurrent" runat="server" Text="1" CssClass="txtInfo"></asp:Label>
                                /<asp:Label ID="lblPageCount" runat="server" Text="1"></asp:Label>&nbsp;&nbsp; 共&nbsp;<asp:Label ID="lblPageRow" runat="server" Text="1" CssClass="txtInfo"></asp:Label>&nbsp;条记录
                                <asp:LinkButton ID="btnFirst" runat="server" CssClass="link" CommandName="Pager" CommandArgument="First" OnCommand="NavigateToPage">[首页]</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="btnPrev" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Prev" OnCommand="NavigateToPage">[前一页]</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="btnNext" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Next" OnCommand="NavigateToPage">[下一页]</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="btnLast" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Last" OnCommand="NavigateToPage">[尾页]</asp:LinkButton>&nbsp;
                                  <asp:textbox ID="txtNewPageIndex" runat="server" width="40px" text='<%#((GridView)Container.Parent.Parent).PageIndex + 1 %>' /> 
                                <asp:linkbutton id="btnGo" runat="server" CssClass="link" CommandName="Page" CommandArgument="Go"  OnCommand="NavigateToPage" text="GO" />
                            </div>
               
                        </PagerTemplate>
                    </asp:GridView>
                 </div></div>
                </asp:Panel>
                <asp:Panel ID="pnlEdit" runat="server" Width="100%">
                <div class="card-header"><h4><%=strColumnName %> <span>带 "<strong class="red">*</strong>" 的为必填信息</span></h4></div>

                        <div class="tab-content">
                <div class="tab-pane active">
                  
                  <div class="edit-form">
                    <div class="form-group">
                      <label for="web_site_title">排列顺序</label>
                                <asp:TextBox ID="txtPaixu" runat="server" CssClass="form-control" Text="0" onKeyUp="this.value=this.value.replace(/[^\d]/g,'')"></asp:TextBox>
                           </div>

                           <div class="form-group">
                      <label for="web_site_title">发布日期</label>
                                <asp:TextBox ID="txtPutdate" runat="server" CssClass="form-control" onclick="WdatePicker()" onfocus="WdatePicker()"></asp:TextBox>
                            </div>


                         <div class="form-group">
                                 <label for="web_site_title">文章标题  <strong class="red">*</strong></label>
                         
                                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
                             
                            </div>

                                     <div class="form-group">
                      <label for="web_site_title">置顶</label>
                      <div class="clearfix qzlradio">
                       <asp:RadioButtonList ID="radlState" runat="server" RepeatDirection="horizontal">
                                <asp:ListItem Text="否" Value="0" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="是" Value="1" ></asp:ListItem>
                       </asp:RadioButtonList>
                    </div>
                    
                    </div>


                        <div class="form-group">
                                 <label for="web_site_title">
                                关键词
                            </label>
                                <asp:TextBox ID="txtKeywords" runat="server" CssClass="form-control"></asp:TextBox>
                              </div>
                       <div class="form-group">
                                 <label for="web_site_title">
                                链接地址
                             </label>
                                <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                          <div class="form-group">
                                 <label for="web_site_title">
                                内容提示
                           </label>
                                <asp:TextBox ID="fckKeyContent" runat="server" CssClass="form-control" TextMode="MultiLine" row="5"></asp:TextBox>
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
                  
                       <div class="form-group" <%if (strColumnType != "下载中心") { Response.Write("style=\"display:none;\""); } %>>
                        <label for="web_site_title">
                                上传附件：
                            </label>
                                <input id="fileup2" type="file" runat="server" style="width: 260px;" class="button" />
                                <input id="pic2" type="hidden" runat="server" value="upload/fujian.jpg" />
                                [附件".doc", ".zip", ".rar", ".xls", ".docx", ".txt"]
                                <%if (!string.IsNullOrEmpty(strFujian) && strFujian != "upload/fujian.jpg")
                                  {
                                %>
                                <a style="color: Blue;" href="../<%=strFujian %>" target="_blank">已上传</a>
                                <%
                                  }
                                  else
                                  { 
                                %>
                                <a style="color: Red;">未上传</a>
                                <%
                                  }%>
                           </div>
                       
                    <div class="form-group">
                      <label for="web_site_title">详细内容</label>
                                <textarea id="content" rows="8" cols="8" runat="server"  style="height: 320px;"></textarea>
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
                <asp:Panel ID="pnlShow" runat="server" Visible="false" align="center">
                     <div class="card-header"><h4><%=strColumnName %></h4></div>
                
              <div class="card-toolbar clearfix">
                目前没有任何数据
                    <a href="News.aspx?Action=Add&ClassId=<%=intClassID%>&ColumnType=<%=strColumnType%>">立即发布</a>
                  <br />
                   <br /> <br />
            
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
<%--加载编辑器--%>
<script type="text/javascript" src="../qz_ueditor/ueditor.config.js?400301"></script>
<script type="text/javascript" src="../qz_ueditor/_examples/editor_api.js?400301"></script>
<script type="text/javascript">
    var ue = UE.getEditor('content', {autoHeightEnabled: false});
</script>
</html>
