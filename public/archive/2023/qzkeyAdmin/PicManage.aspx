<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PicManage.aspx.cs" Inherits="wltx_admin_PicManage" %>

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
                <style type="text/css">
                    .masonry-grid .masonry-item {
                        padding-bottom: 0;
                    }
                    
                    .masonry-item {
                        background: #eee;
                        text-align: center;
                        margin-bottom: 20px;
                        /* min-height: 150px; */
                    }
                    
                    .tpgl-pic {
                        text-align: center;
                        position: relative;
                    }
                    
                    .tpgl-pic .h5 {
                        line-height: 24px;
                        border-bottom: solid 1px #ddd;
                        margin-bottom: 0;
                        padding: 8px 0;
                        /* position: absolute; */
                        /* bottom: 40px; */
                        width: 100%;
                        z-index: 2;
                        background: rgb(255, 255, 255, 0.9)
                    }
                    
                    .tpgl-pic span {
                        color: #bbb;
                        font-size: 12px;
                    }
                    
                    .tpgl-pic .xiugai {
                        height: 40px;
                        line-height: 40px;
                        font-size: 15px;
                        /* position: absolute; */
                        /* bottom: 0px; */
                        width: 100%;
                        z-index: 2;
                        background: rgb(255, 255, 255, 0.9);
                    }
                    
                    .tpgl-pic {
                        margin-bottom: 30px;
                        box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
                    }
                </style>
                <style>
                    .tpgl-pic {
                        width: 23%;
                    }
                </style>
                <style>
                    @media only screen and (min-width: 996px) {
                        .masonry-item img {
                            width: 100%;
                            height: 250px;
                            object-fit: contain;
                        }
                    }
                    
                    @media only screen and (max-width: 996px) {
                        .tpgl-pic {
                            width: 100% !important;
                        }
                    }
                </style>
                <script type="text/javascript" src="js/flash.js"></script>
                <script type="text/javascript">
                    function checkNull() {
                        var objType = document.getElementById("dropType").options[document.getElementById("dropType").selectedIndex].value;
                        if (objType == "0") {
                            alert("请选择文件类型！");
                            document.getElementById("dropType").focus();
                            return false;
                        }
                        var objClassID = document.getElementById("dropClassID").options[document.getElementById("dropClassID").selectedIndex].value;
                        if (objClassID == "0") {
                            alert("请选择图片要放置的位置！");
                            document.getElementById("dropClassID").focus();
                            return false;
                        }
                        if (document.getElementById("txtWidth").value == "") {
                            alert("请输入宽度！");
                            document.getElementById("txtWidth").focus();
                            return false;
                        }
                        if (document.getElementById("txtLength").value == "") {
                            alert("请输入高度！");
                            document.getElementById("txtLength").focus();
                            return false;
                        }
                        if (document.getElementById("fileup").value == "" && document.getElementById("pic").value == "upload/default.jpg") {
                            alert("请选择要上传的图片！");
                            document.getElementById("fileup").focus();
                            return false;
                        }
                        if (document.getElementById("txtBeizhu").value == "") {
                            alert("请填写备注说明！");
                            document.getElementById("txtBeizhu").focus();
                            return false;
                        }
                        document.getElementById("divShow").style.display = "none";
                        document.getElementById("divHidden").style.display = "block";
                        return true;
                    }
                </script>
                <style type="text/css">
                    .pro td img {
                        max-width: 150px;
                        max-height: 110px;
                        width: expression(this.width >150 && this.height < this.width ? 150: true);
                        height: expression(this.height > 110 ? 110: true);
                    }
                </style>
            </head>

            <body data-headerbg="default" data-logobg="color_3" data-sidebarbg="color_3">
                <form id="form1" runat="server">
                    <div class="lyear-layout-web">
                        <div class="lyear-layout-container">
                            <ucLeftControl:LeftControl runat="server" ID="LeftControl1" />
                            <ucHeadControl:headcontrol id="HeadControl1" runat="server" />
                            <!--页面主要内容-->
                            <main class="lyear-layout-content">
                                <asp:Panel ID="pnlList" runat="server" HorizontalAlign="Center" Width="100%">
                                    <div class="container-fluid">


                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h4>图片管理</h4>
                                                </div>
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-lg-12" style=" text-align:center; padding-top:10px;">
                                                            <a class="btn btn-primary m-r-5" href="PicManage.aspx?Action=Add"><i class="mdi mdi-plus"></i> 上传图片</a>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="card">
                                                                <div class="card-body">


                                                                    <div class="masonry-grid" style="display: flex;flex-wrap: wrap;" data-provide="photoswipe">


                                                                        <asp:Repeater ID="gvList" runat="server" onitemcommand="gvList_DeleteCommand">
                                                                            <ItemTemplate>
                                                                                <div class="tpgl-pic">
                                                                                    <%#change(Eval("Type", "{0}"), Eval("Path", "{0}"))%>
                                                                                        <div>
                                                                                            <div class="h5">
                                                                                                <%#Eval("Beizhu")%><span> H:<%#Eval("Width")%>px W:<%#Eval("Length")%>px</span></div>
                                                                                            <div class="xiugai"><a href="?Action=Add&ID=<%# Eval(" ID ") %>"><i class="mdi mdi-rename-box"></i> 修改</a>
                                                                                                <asp:LinkButton ID="linkbutton1" CommandArgument='<%#Eval("ID") %>' runat="server" CommandName="Delete" OnClientClick="return confirm('删除后无法恢复！您确定要删除吗？')"><i class="mdi mdi-delete-circle"></i>删除</asp:LinkButton>
                                                                                            </div>
                                                                                        </div>

                                                                                </div>

                                                                            </ItemTemplate>
                                                                        </asp:Repeater>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>





                                </asp:Panel>
                                <asp:Panel ID="pnlEdit" runat="server" Width="100%">

                                    <div class="container-fluid">

                                        <div class="row">
                                            <div class="col-lg-12">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h4>图片管理 <span>带 "<strong class="red">*</strong>" 的为必填信息</span></h4>
                                                    </div>
                                                    <div class="card-body">

                                                        <div class="row">
                                                            <div class="form-group col-md-12">
                                                                <label for="sort">显示顺序</label>
                                                                <asp:TextBox ID="txtPaixu" CssClass="form-control" runat="server" Text="0" onKeyUp="this.value=this.value.replace(/[^\d]/g,'')"></asp:TextBox>

                                                            </div>

                                                            <div class="form-group col-md-12">
                                                                <label for="type">位置 <strong class="red">*</strong></label>
                                                                <div class="form-controls">
                                                                    <asp:DropDownList ID="dropClassID" CssClass="form-control" runat="server" OnSelectedIndexChanged="dropClassID_SelectedIndexChanged" AutoPostBack="true">
                                                                        <asp:ListItem Text="---请选择---" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="公司LOGO" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="通栏图片" Value="3"></asp:ListItem>
                                                                        <asp:ListItem Text="联系电话" Value="4"></asp:ListItem>
                                                                        <asp:ListItem Text="内页通栏" Value="5"></asp:ListItem>
                                                                        <asp:ListItem Text="底部logo" Value="6"></asp:ListItem>
                                                                        <asp:ListItem Text="二维码" Value="7"></asp:ListItem>
                                                                        <asp:ListItem Text="关于我们" Value="8"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label for="title"> 尺寸(宽px)</label>
                                                                <input type="text" id="txtWidth" runat="server" class="form-control" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')" value="0" />
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label for="title"> 尺寸(高px)</label>
                                                                <input type="text" id="txtLength" runat="server" class="form-control" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]/g,'')" value="0" />
                                                            </div>


                                                            <div class="form-group col-md-6">
                                                                <label for="web_site_title">图片上传 <strong class="red">*</strong></label>
                                                                <div class="form-controls">

                                                                    <ul class="list-inline clearfix lyear-uploads-pic" id="drop_area">

                                                                        <li class="col-xs-4 col-sm-3 col-md-2 yangba" <%if (string.IsNullOrEmpty(strImg) || strImg=="upload/default.jpg" ) { %>style="display:none"
                                                                            <%} %>>
                                                                                <figure>
                                                                                    <img id="tupian" src="/<%=strImg %>">
                                                                                    <figcaption>
                                                                                        <a class="btn btn-round btn-square btn-primary" href="javascript:$('#fileup').click();"><i class="mdi mdi-stackexchange"></i></a>
                                                                                        <a class="btn btn-round btn-square btn-danger" href="javascript:deletepic()"><i class="mdi mdi-delete"></i></a>
                                                                                    </figcaption>
                                                                                </figure>
                                                                        </li>
                                                                        <li class="col-xs-4 col-sm-3 col-md-2 tianjia" <%if (!string.IsNullOrEmpty(strImg) && strImg !="upload/default.jpg" ) { %>style="display:none"
                                                                            <%} %>>
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

                                                                            $("#fileup").change(function() {
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
                                                                                var obj = document.getElementById('fileup');
                                                                                obj.value = "";
                                                                                $(".yangba").hide();
                                                                                $(".tianjia").show();
                                                                            }
                                                                        </script>
                                                                    </div>
                                                                </div>

                                                            </div>


                                                            <div class="form-group col-md-12">
                                                                <label for="tags">备注说明</label>
                                                                <asp:TextBox ID="txtBeizhu" runat="server" CssClass="form-control"></asp:TextBox>

                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label for="seo_keywords">链接地址</label>
                                                                <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control"></asp:TextBox>

                                                            </div>
                                                            <div style="display:none">
                                                                <asp:DropDownList ID="dropType" runat="server">
                                                                    <asp:ListItem Text="---请选择---" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="图片" Value="pic" Selected="True"></asp:ListItem>
                                                                    <asp:ListItem Text="Flash" Value="swf"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>

                                                            <div class="form-group col-md-12">
                                                                <div id="divHidden" style="display: none;">
                                                                    <img src="images/admin_images/loading.gif" alt="" />
                                                                    <span style="color: #666;">正在保存...</span></div>
                                                                <div id="divShow">
                                                                    <asp:Button ID="btnSave" runat="server" Text="确 定" CssClass="btn btn-primary ajax-post" target-form="add-form" OnClick="btnSaveClick" />
                                                                    <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                </asp:Panel>
                                <asp:Panel ID="pnlShow" runat="server" Visible="false" align="center">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h4>图片管理</h4>
                                                </div>
                                                <div class="card-body">
                                                    目前没有任何数据 <a href="PicManage.aspx?Action=Add">立即发布</a>
                                                </div>
                                            </div>
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

                </form>
            </body>

            </html>