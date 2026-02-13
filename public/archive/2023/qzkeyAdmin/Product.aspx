<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Manager_Product" ValidateRequest="false" EnableEventValidation="false" %>

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
                    function checkNull() {
                        //拓展分类开始
                        var str = document.getElementsByName("box");
                        var objarray = str.length;
                        var chestr = ",";
                        for (i = 0; i < objarray; i++) {
                            if (str[i].checked == true) {
                                chestr += str[i].value + ",";
                            }
                        }
                        if (chestr == ",") {
                            alert("请选择商品分类");
                            return false;
                        }
                        document.getElementById("fenlei").value = chestr;
                        //拓展分类结束
                        if (document.getElementById("txtProName").value == "") {
                            alert("产品名称为必填项！");
                            document.getElementById("txtProName").focus();
                            return false;
                        }
                        document.getElementById("divShow").style.display = "none";
                        document.getElementById("divHidden").style.display = "block";
                        return true;
                    }
                </script>
                <script type="text/javascript">
                    function checkFormAll(chk) {
                        form = document.getElementById("form1");
                        for (var i = 0; i < form.elements.length; i++) {
                            if (form.elements[i].type == "checkbox") {
                                form.elements[i].checked = chk;
                            }
                        }
                    }

                    function buttonPaixu_Delete() {
                        var strID = "";
                        form = document.getElementById("form1");
                        for (var i = 0; i < form.elements.length; i++) {
                            if (form.elements[i].type == "checkbox") {
                                if (form.elements[i].checked == true && form.elements[i].value != "-1") {
                                    strID = strID + "," + form.elements[i].value;
                                }
                            }
                        }
                        if (strID != "") {
                            document.getElementById("divbutton").style.display = "none";
                            document.getElementById("loading").style.display = "inline";
                            //提交信息开始
                            $.ajax({
                                type: "get",
                                url: "ashx/deletePro.aspx?tb=Product&id=" + strID,
                                success: function(msg) {
                                    if (msg == "success") {
                                        document.getElementById("divbutton").style.display = "inline";
                                        document.getElementById("loading").style.display = "none";
                                        alert("操作成功！");
                                        window.location.reload();
                                    } else {
                                        document.getElementById("divbutton").style.display = "inline";
                                        document.getElementById("loading").style.display = "none";
                                        alert("操作失败！");
                                        window.location.reload();
                                    }
                                }
                            });
                            //提交信息结束
                        } else {
                            alert("请勾选需要删除的项目！");
                        }
                    }

                    function buttonShow(state) {
                        var strID = "";
                        form = document.getElementById("form1");
                        for (var i = 0; i < form.elements.length; i++) {
                            if (form.elements[i].type == "checkbox") {
                                if (form.elements[i].checked == true && form.elements[i].value != "-1") {
                                    strID = strID + "," + form.elements[i].value;
                                }
                            }
                        }
                        if (strID != "") {
                            //提交信息开始
                            $.ajax({
                                type: "get",
                                url: "ashx/ShowPro.aspx?tb=Product&state=" + state + "&id=" + strID,
                                success: function(msg) {
                                    if (msg == "success") {
                                        alert("操作成功！");
                                        window.location.reload();
                                    } else {
                                        alert("操作失败！");
                                        window.location.reload();
                                    }
                                }
                            });
                            //提交信息结束
                        } else {
                            alert("请勾选需要删除的项目！");
                        }
                    }

                    function check() {
                        var keyci = document.getElementById("keyci").value;
                        if (keyci == " ") {
                            alert("请输入关键词");
                            return false;
                        }
                        window.location.href = "Product.aspx?keyci=" + escape(keyci);
                    }
                </script>
                <style type="text/css">
                .cpzx>li>a {
                        padding: 10px 15px 10px 0px;
                    }
                    
                    .pro-ej {
                        background: #f4f4f4;
                        color: #999;
                    }
                    
                    .pro {
                        font-weight: bold;
                    }
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

                                <div class="container-fluid">

                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <asp:Panel ID="pnlList" runat="server">

                                                    <div class="card-header">
                                                        <h4>产品管理 </h4>
                                                    </div>
                                                    <div class="card-toolbar clearfix">

                                                        <div class="pull-right search-bar">
                                                            <div class="input-group">
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control" id="keyci" value="<%=keyci %>" placeholder="请输入关键词...">
                                                                    <span class="input-group-btn">
                          <button class="btn btn-default" onclick="check()" type="button">搜索</button>
                        </span>
                                                                </div>

                                                            </div>
                                                        </div>

                                                        <div class="toolbar-btn-action">
                                                            <a class="btn btn-primary" href="Product.aspx?Action=Add&Classid=<%=intClassID %>"><i class="mdi mdi-plus"></i> 添加产品</a>
                                                            <a class="btn btn-primary" href="ProAddset.aspx"><i class="mdi mdi-plus"></i> 批量添加</a>
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
                                                            <asp:GridView ID="gvList" DataKeyNames="ProId" runat="server" Class="table table-bordered" OnRowDeleting="gvList_RowDeleting" OnDataBound="GridView_DataBind" AllowPaging="True" PageSize="15" GridLines="None" AutoGenerateColumns="False" EmptyDataText="暂无数据">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="<label class='lyear-checkbox checkbox-primary'><input onclick='checkFormAll(checked)' type='checkbox' id='chk_1' name='chk_1' value='1' /><span></span></label>">
                                                                        <HeaderStyle HorizontalAlign="left" />
                                                                        <ItemStyle HorizontalAlign="left" />
                                                                        <ItemTemplate>
                                                                            <label class="lyear-checkbox checkbox-primary">
                                    <input type='checkbox' id='chk_<%#Eval("ProId")%>' name='chk_<%#Eval("ProId")%>' value='<%#Eval("ProId")%>' />
                            <span></span>
                          </label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="编号">
                                                                        <HeaderStyle HorizontalAlign="left" />
                                                                        <ItemStyle HorizontalAlign="left" />
                                                                        <ItemTemplate>
                                                                            <%#Eval("proid") %>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="置顶">
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
                                                                            &nbsp;
                                                                            <%#Eval("paixu") %>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="缩略图">
                                                                        <HeaderStyle Width="80px" HorizontalAlign="left" />
                                                                        <ItemStyle Width="80px" HorizontalAlign="left" />
                                                                        <ItemTemplate>
                                                                            <%#chkPic(Eval("ProPath", "{0}"))%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="名称">
                                                                        <HeaderStyle HorizontalAlign="left" />
                                                                        <ItemStyle HorizontalAlign="left" />
                                                                        <ItemTemplate>
                                                                            <a href="?Action=Add&Classid=<%=intClassID %>&Id=<%# Eval(" ProId ") %><%=keyciurl%>&page=<%=page %>">
                                                                                <%#Eval("ProName")%>
                                                                            </a>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="点击">
                                                                        <HeaderStyle HorizontalAlign="left" />
                                                                        <ItemStyle HorizontalAlign="left" />
                                                                        <ItemTemplate>
                                                                            <%#Eval("hits")%>
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
                                                                            <%#Convert.ToDateTime(Eval("putdate")).ToString("yyyy-MM-dd") %>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="操作">
                                                                        <HeaderStyle HorizontalAlign="left" />
                                                                        <ItemStyle HorizontalAlign="left" />
                                                                        <ItemTemplate>
                                                                            <div class="btn-group">
                                                                                <a class="btn btn-xs btn-default" href="?Action=Add&Classid=<%=intClassID %>&Id=<%# Eval(" ProId ") %><%=keyciurl%>&page=<%=page %>" title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
                                                                                <a class="btn btn-xs btn-default" target="_blank" href="../ProDetail.aspx?ProId=<%#Eval(" ProId ") %>" title="查看" data-toggle="tooltip"><i class="mdi mdi-eye"></i></a>
                                                                                <asp:LinkButton CssClass="btn btn-xs btn-default" ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Title="删除" data-toggle="tooltip" OnClientClick="return confirm('删除后无法恢复！您确定要删除吗？')"><i class="mdi mdi-window-close"></i></asp:LinkButton>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <PagerTemplate>
                                                                    <div id="main" style="width: 100%; padding-top: 10px; text-align: center;">
                                                                        &nbsp;&nbsp;页次：
                                                                        <asp:Label ID="lblPageCurrent" runat="server" Text="1" CssClass="txtInfo"></asp:Label>
                                                                        /
                                                                        <asp:Label ID="lblPageCount" runat="server" Text="1"></asp:Label>&nbsp;&nbsp; 共&nbsp;
                                                                        <asp:Label ID="lblPageRow" runat="server" Text="1" CssClass="txtInfo"></asp:Label>&nbsp;条记录
                                                                        <asp:LinkButton ID="btnFirst" runat="server" CssClass="link" CommandName="Pager" CommandArgument="First" OnCommand="NavigateToPage">[首页]</asp:LinkButton>&nbsp;
                                                                        <asp:LinkButton ID="btnPrev" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Prev" OnCommand="NavigateToPage">[前一页]</asp:LinkButton>&nbsp;
                                                                        <asp:LinkButton ID="btnNext" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Next" OnCommand="NavigateToPage">[下一页]</asp:LinkButton>&nbsp;
                                                                        <asp:LinkButton ID="btnLast" runat="server" CssClass="link" CommandName="Pager" CommandArgument="Last" OnCommand="NavigateToPage">[尾页]</asp:LinkButton>&nbsp;
                                                                        <asp:textbox ID="txtNewPageIndex" runat="server" width="40px" text='<%#((GridView)Container.Parent.Parent).PageIndex + 1 %>' />
                                                                        <asp:linkbutton id="btnGo" runat="server" CssClass="link" CommandName="Page" CommandArgument="Go" OnCommand="NavigateToPage" text="GO" />
                                                                    </div>

                                                                </PagerTemplate>
                                                            </asp:GridView>
                                                        </div>

                                                    </div>
                                                </asp:Panel>
                                                <asp:Panel ID="pnlEdit" runat="server" Width="100%">

                                                    <div class="card-header">
                                                        <h4>添加产品 <span>带 "<strong class="red">*</strong>" 的为必填信息</span></h4>
                                                    </div>
                                                    <div class="tab-content">
                                                        <div class="tab-pane active">

                                                            <div class="edit-form">
                                                                <div class="form-group">
                                                                    <label for="web_site_title">排列顺序</label>
                                                                    <asp:TextBox ID="txtPaixu" CssClass="form-control" runat="server" Text="0" onKeyUp="this.value=this.value.replace(/[^\d]/g,'')"></asp:TextBox>
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
                                                                        <div class="controls-box" hidden>
                                                                           
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                                <div class="form-group">
                                                                    <label for="web_site_title">名称 <strong class="red">*</strong></label>
                                                                    <asp:TextBox ID="txtProName" runat="server" CssClass="form-control"></asp:TextBox>


                                                                </div>

                                                                <div class="form-group col-md-4" style="padding-left:0px;">
                                                                    <label for="web_site_title">型号</label>
                                                                    <asp:TextBox ID="txtProBianhao" runat="server" CssClass="form-control"></asp:TextBox>


                                                                </div>

                                                                <div class="form-group col-md-4">
                                                                    <label for="web_site_title">产地</label>
                                                                    <asp:TextBox ID="txtProChandi" runat="server" CssClass="form-control"></asp:TextBox>


                                                                </div>

                                                                <div class="form-group col-md-4" style="padding-right:0px;">
                                                                    <label for="web_site_title">价格</label>
                                                                    <asp:TextBox ID="txtProPrice" runat="server" CssClass="form-control"></asp:TextBox>


                                                                </div>

                                                                <div class="form-group">
                                                                    <label for="web_site_title">关键词</label>
                                                                    <asp:TextBox ID="txtKeywords" runat="server" CssClass="form-control"></asp:TextBox>


                                                                </div>

                                                                <div class="form-group">
                                                                    <label for="web_site_title">缩略图</label>
                                                                    <div class="form-controls">

                                                                        <ul class="list-inline clearfix lyear-uploads-pic" id="drop_area">

                                                                            <li class="col-xs-4 col-sm-3 col-md-2 yangba" <%if (string.IsNullOrEmpty(strqzlimg) || strqzlimg=="upload/default.jpg" ) { %>style="display:none"
                                                                                <%} %>>
                                                                                    <figure>
                                                                                        <img id="tupian" src="/<%=strqzlimg %>">
                                                                                        <figcaption>
                                                                                            <a class="btn btn-round btn-square btn-primary" href="javascript:$('#fileup').click();"><i class="mdi mdi-stackexchange"></i></a>
                                                                                            <a class="btn btn-round btn-square btn-danger" href="javascript:deletepic()"><i class="mdi mdi-delete"></i></a>
                                                                                        </figcaption>
                                                                                    </figure>
                                                                            </li>
                                                                            <li class="col-xs-4 col-sm-3 col-md-2 tianjia" <%if (!string.IsNullOrEmpty(strqzlimg) && strqzlimg !="upload/default.jpg" ) { %>style="display:none"
                                                                                <%} %>>
                                                                                    <a class="pic-add" id="add-pic-btn" href="javascript:$('#fileup').click();" title="点击上传"></a>
                                                                            </li>
                                                                        </ul>
                                                                        <div style="display:none">
                                                                            <input id="fileup" type="file" runat="server" style="width: 415px;" class="button" />
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
                                                                <div class="form-group">
                                                                    <label for="web_site_title">内容提示</label>
                                                                    <asp:TextBox ID="fckProKeyDescription" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>



                                                                </div>
                                                                <%-- <div class="form-group">
                      <label for="web_site_title">状态</label>
                      <div class="clearfix">
                      <label class="lyear-radio radio-inline radio-primary">
                        <input type="radio" name="status2" value="0" checked><span>显示</span>
                      </label>
                      <label class="lyear-radio radio-inline radio-primary">
                        <input type="radio" name="status2" value="1" ><span>隐藏</span>
                      </label>
                    </div>
                    
                    </div>--%>

                                                                    <div class="form-group">
                                                                        <label for="web_site_title">置顶</label>
                                                                        <div class="clearfix qzlradio">
                                                                            <asp:RadioButtonList ID="radlState" runat="server" RepeatDirection="horizontal">
                                                                                <asp:ListItem Text="否" Value="0" Selected="true"></asp:ListItem>
                                                                                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                                                                            </asp:RadioButtonList>
                                                                        </div>

                                                                    </div>





                                                                    <ul id="myTabs" class="nav nav-tabs cpzx" role="tablist">
                                                                        <li class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab"><strong>详细内容</strong></a></li>
                                                                        <li><a href="#profile" role="tab" id="profile-tab" data-toggle="tab"><strong>规格参数</strong></a></li>
                                                                        <li><a href="#profilez" role="tab" id="profile-tab" data-toggle="tab"><strong>包装</strong></a></li>
                                                                    </ul>
                                                                    <div id="myTabContent" class="tab-content" style="padding-left:0px;">
                                                                        <div class="tab-pane fade active in" id="home">
                                                                            <textarea id="fckProDescription" rows="8" cols="8" runat="server" style="height: 320px;"></textarea>
                                                                        </div>
                                                                        <div class="tab-pane fade" id="profile" style="padding-left:0px;">
                                                                            <textarea id="Textarea1" rows="8" cols="8" runat="server" style="height: 320px;"></textarea>
                                                                        </div>
                                                                        <div class="tab-pane fade" id="profilez" style="padding-left:0px;">
                                                                            <textarea id="Textarea2" rows="8" cols="8" runat="server" style="height: 320px; "></textarea>
                                                                        </div>

                                                                    </div>

                                                                    <div class="form-group">
                                                                        <label for="web_site_title">上传图片</label>
                                                                        <div class="form-controls" id="upStrInfoImagesDiv">
                                                                            <ul class="list-inline clearfix lyear-uploads-pic">
                                                                                <li class="col-xs-4 col-sm-3 col-md-2 duotupic">
                                                                                    <a class="pic-add" href="javascript:$('#file').click();" title="点击上传"></a>
                                                                                </li>
                                                                            </ul>
                                                                            <div style="display:none">
                                                                                <input type="file" id="file" multiple="" name="file" />
                                                                                <input type="file" id="file_edit" name="file_edit" />
                                                                                <input name="hidfujian" type="hidden" runat="server" id="hidfujian" value="" />
                                                                                <input type="hidden" id="hid_file_edit"/>
                                                                            </div>
                                                                        </div>

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
                                                    <div class="card-header">
                                                        <h4>产品管理 </h4>
                                                    </div>
                                                    <div class="card-toolbar clearfix">
                                                        目前没有任何数据
                                                        <a href="Product.aspx?Action=Add&ClassId=<%=intClassID%>">立即发布</a>
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
                        $(function() {
                            $('.search-bar .dropdown-menu a').click(function() {
                                var field = $(this).data('field') || '';
                                $('#search-field').val(field);
                                $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
                            });
                        });
                    </script>

                </form>
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
            </body>
            <%--加载编辑器--%>
                <script type="text/javascript" src="../qz_ueditor/ueditor.config.js?400301"></script>
                <script type="text/javascript" src="../qz_ueditor/_examples/editor_api.js?400301"></script>
                <script type="text/javascript">
                    var ue = UE.getEditor('fckProDescription', {
                        autoHeightEnabled: false
                    });
                    var ue = UE.getEditor('Textarea1', {
                        autoHeightEnabled: false
                    });
                    var ue = UE.getEditor('Textarea2', {
                        autoHeightEnabled: false
                    });
                </script>
                <script type="text/javascript" src="js/ajaxfileupload.js"></script>
                <script type="text/javascript" src="js/update_Upload.js?v=1211"></script>
               
            </html>