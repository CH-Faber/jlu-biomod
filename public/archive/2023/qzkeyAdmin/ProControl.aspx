<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProControl.aspx.cs" Inherits="Manager_ProControl" ValidateRequest="false" EnableEventValidation="false" %>

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
<link href="../layui/css/layui.css?muban" rel="stylesheet" type="text/css" />
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/materialdesignicons.min.css" rel="stylesheet">
<link href="css/style.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1-7-2.js"></script>
<script type="text/javascript" src="js/update_Pro.js"></script>
</head>
<body data-headerbg="default" data-logobg="color_3" data-sidebarbg="color_3">
 
        <!--内容开始-->
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
                          <div class="card-header"><h4>样式设置</h4></div>
              <div class="tab-content">
                <div class="tab-pane active">
                  
                  <form action="#!" method="post" name="edit-form" class="edit-form">
                    
                    <div class="form-group">
                      <label for="web_site_title">产品列表样式</label>
                      <div class="clearfix">
                      <label class="lyear-radio radio-inline radio-primary">
                        <input type="radio" name="ProList" value="1" ><span>样式一</span>
                      </label>
                      <label class="lyear-radio radio-inline radio-primary">
                        <input type="radio" name="ProList" value="2" ><span>样式二</span>
                      </label>
                      <label class="lyear-radio radio-inline radio-primary">
                        <input type="radio" name="ProList" value="3" ><span>样式三</span>
                      </label>
                      <label class="lyear-radio radio-inline radio-primary">
                        <input type="radio" name="ProList" value="4" ><span>样式四</span>
                      </label>
                      <label class="lyear-radio radio-inline radio-primary">
                        <input type="radio" name="ProList" value="99" checked><span>自定义</span>
                      </label>
                       <a target="_blank" href="yangbanyulan.aspx?Column=Product">预览效果</a>
                    </div>
                    
                    </div>
                    
                     <div class="form-group">
                      <label for="web_site_title">产品详情样式</label>
                      <div class="clearfix">
                      <label class="lyear-radio radio-inline radio-primary">
                        <input type="radio" name="ProDetail" value="1"><span>样式一</span>
                      </label>
                      <label class="lyear-radio radio-inline radio-primary">
                        <input type="radio" name="ProDetail" value="2" ><span>样式二</span>
                      </label>
                      <label class="lyear-radio radio-inline radio-primary">
                        <input type="radio" name="ProDetail" value="3" ><span>样式三</span>
                      </label>
                      <label class="lyear-radio radio-inline radio-primary">
                        <input type="radio" name="ProDetail" value="99" checked><span>自定义</span>
                      </label>
                      <a target="_blank" href="yangbanyulan.aspx?Column=Prodetail">预览效果</a>
                    </div>
                    
                    </div>
                   
                
                    
                    <div class="form-group">
                      <button type="button" onclick="CheckEdit()" class="btn btn-primary m-r-5">确 定</button>
                      <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                    </div>
                  </form>
                  
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
<input type="hidden" runat="server" id="hidProList"/>
<input type="hidden" runat="server" id="hidProDetail"/>
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
<script type="text/javascript" src="../layui/layui.js?muban"></script>
        <script>
            layui.config({
                base: '../layui/' //静态资源所在路径
            }).extend({
                index: 'lib/index' //主入口模块
            }).use(['index', 'form'], function () {
                var $ = layui.$
                    , admin = layui.admin
                    , element = layui.element
                    , form = layui.form;

                form.render(null, 'component-form-element');
                element.render('breadcrumb', 'breadcrumb');

                form.on('submit(component-form-element)', function (data) {
                    layer.msg(JSON.stringify(data.field));
                    return false;
                });
             
                });
            function showProduct() {
                window.open("yangbanyulan.aspx?Column=Product");
            }
            function showDetail() {
                window.open("yangbanyulan.aspx?Column=Prodetail");
            }
        </script>
    </form>
</body>

</html>

