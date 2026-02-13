<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Manager_Default" %>

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
    <script src="js/jquery-1-7-2.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("input[name='webcontrol']").change(function () {
                var date = $(this).val();
                if (date == "1") {
                    date = "0"
                }
                else {
                    date = "1";
                }
                $(this).val(date);
                $.ajax({
                    type: "POST",//
                    url: "Default.aspx/btnSaveClick",
                    data: "{date:'" + date + "'}",
                    contentType: "application/json",
                    dataType: "json",
                    success: function (data) {
                    },
                    
                });
            });
        });
    </script>
    <style>
        .chane{
             line-height: 23px;
             padding-left: 10px;
             cursor:pointer;
        }
        .putdate{
             line-height: 23px;
             padding-left: 20px;
                 color: #929db3;
        }
.xtgg .card-header .pull-right a{ font-size:14px;}
.xtgg .card-body ul{ padding-left:20px;}
.xtgg .card-body ul li span{ color:#929db3;    float: right;}
    </style>
</head>
<body data-headerbg="default" data-logobg="color_3" data-sidebarbg="color_3">
    <div class="lyear-layout-web">
        <div class="lyear-layout-container">
            <ucLeftControl:LeftControl runat="server" ID="LeftControl1" />
            <ucHeadControl:headcontrol id="HeadControl1" runat="server" />
            <main class="lyear-layout-content">
            <div class="container-fluid">
      <div class="row">
          <div class="col-lg-9">
            <div class="card">
              <div class="card-header">
                <h4>温馨提示</h4>
              </div>
              <div class="card-body">
<p>亲爱的朋友，非常感谢您使用我们的系统！在使用过程中有合理的意见或建议欢迎您向服务支持人员提出！</p>
<p>注意事项：为了保证图片下载速度，上传的图片大小务必不能超过500K，否则上传不了并显示Generic Error Page错误！</p>
<p>后台使用教程：<a target="_blank" href="https://www.400301.com/news/195.htm">https://www.400301.com/news/195.htm</a> 专属QQ客服：<a href="tencent://message/?uin=<%=strQQ %>&Site=&Menu=yes"><%=strQQ %></a></p>
              </div>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="card xtgg">
              
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6 col-lg-3">
            <div class="card ">
              <div class="card-body clearfix" style="padding:20px 24px;">
                <div class="pull-right">
                  <p class="h5 m-t-0">版本：<%=dropType %></p>
                  <p class="h6 m-b-0 ">开始使用：<%=txtBeginTime %> </p>
                  <p class="h6 m-b-0 ">到期时间：<%=txtEndTime %> </p>
                </div>
                <div class="pull-left" style="text-align:center;"> 
                <p class="h5 m-t-0">网站开关</p>
                <label class="lyear-switch switch-primary switch-solid" style="margin-top:8px;">
                        <input name="webcontrol" value="<%=State %>" type="checkbox" <%if (State == "0")
                            { %> checked="" <%} %> />
                        <span></span>
                </label><i class="mdi fa-1-5x"></i> </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-primary">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">录入信息</p>
                  <p class="h3 text-white m-b-0 fa-1-5x"><%=NewsNum %> 条</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-format-align-left fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card bg-success">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p style="cursor:pointer" onclick="javascript:window.location.href='Message.aspx'" class="h6 text-white m-t-0">客户留言</p>
                  <p style="cursor:pointer" onclick="javascript:window.location.href='Message.aspx'" class="h3 text-white m-b-0 fa-1-5x"><%=MessageNum %> 条</p>
                </div>
                <div class="pull-left"> <span style="cursor:pointer" onclick="javascript:window.location.href='Message.aspx'" class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-comment-text-outline fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-info">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">使用空间</p>
                  <p class="h3 text-white m-b-0 fa-1-5x"><%=space_size_yiyong %> M</p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-server fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header">
                <h4>流量统计</h4>
                <font class="putdate"><%=putdate %> 总计<%=strnum_zong %>个刷新，已使用<%=strnum %>个刷新，购买刷新请联系客服</font>  
                  <%if(open==1){ %>
                <a class="chane">立即刷新</a>
                  <%} %>
              </div>
              <div class="card-body GetApi">
                 <canvas id="chart-line-4"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>
            </main>
            <!--End 页面主要内容-->
        </div>
    </div>
    <input type="hidden" id="num-zong" value="<%=strnum_zong %>"/>
    <input type="hidden" id="num" value="<%=strnum %>"/>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/perfect-scrollbar.min.js"></script>
    <script type="text/javascript" src="js/Chart.js"></script>
    <script type="text/javascript" src="js/main.min.js"></script>
    <script type="text/javascript">
      
        $(function () {
            gengxin("1");
            getannout();
            $(".chane").click(function () {
                var num_zong = $("#num-zong").val();
                var num = $("#num").val();
                if (parseFloat(num_zong) > parseFloat(num)) {
                    gengxin("action");
                    window.location.reload();
                }
                else {
                    alert("您已经没有刷新次数，请联系客服");
                }
            });
        })
        function gengxin(Action) {
            $.ajax({
                type: "get",
                dataType: "json",
                url: "GetApi.aspx?Action="+Action,
                success: function (msg) {
                         console.log(msg);
                     if (msg.message == "成功") {
                         var data = msg.data;
                         var riqi = [];
                         var uv = [];
                         var pv = [];
                         for (i = data.length-1; i >= 0; i--) {
                             riqi.push(data[i].time);
                             uv.push(data[i].uv);
                             pv.push(data[i].pv);
                         }
                         new Chart($("#chart-line-4"), {
                             type: 'line',
                             data: {
                                 labels: riqi,
                                 datasets: [{
                                     label: "访客数 UV",
                                     fill: false,
                                     borderWidth: 3,
                                     pointRadius: 4,
                                     borderColor: "#36a2eb",
                                     backgroundColor: "#36a2eb",
                                     pointBackgroundColor: "#36a2eb",
                                     pointBorderColor: "#36a2eb",
                                     pointHoverBackgroundColor: "#fff",
                                     pointHoverBorderColor: "#36a2eb",
                                     data: uv
                                 },
                                 {
                                     label: "浏览量 PV",
                                     fill: false,
                                     borderWidth: 3,
                                     pointRadius: 4,
                                     borderColor: "#ff6384",
                                     backgroundColor: "#ff6384",
                                     pointBackgroundColor: "#ff6384",
                                     pointBorderColor: "#ff6384",
                                     pointHoverBackgroundColor: "#fff",
                                     pointHoverBorderColor: "#ff6384",
                                     data: pv
                                 }]
                             },
                             options: {}
                         });
                     }
                     else {
                         $(".GetApi").html("功能故障，请联系服务商");
                         console.log("1111");
                     }
                }
            });
        }
        function getannout() {
            $.ajax({
                type: "get",
                url: "ashx/getannout.aspx",
                success: function (msg) {
                    $(".xtgg").html(msg);
                }
            })
        }
    </script>

</body>
</html>
