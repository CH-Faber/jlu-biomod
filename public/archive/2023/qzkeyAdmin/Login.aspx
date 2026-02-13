<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Manager_Login" %>

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
    <!--对话框-->
    <link rel="stylesheet" href="js/jconfirm/jquery-confirm.min.css">
    <style>
        body {
            background-color: #fff;
        }

        .lyear-login-box {
            position: relative;
            overflow-x: hidden;
            width: 100%;
            height: 100%;
            -webkit-transition: 0.5s;
            -o-transition: 0.5s;
            transition: 0.5s;
        }

        .lyear-login-left {
            width: 50%;
            top: 0;
            left: 0;
            bottom: 0;
            position: fixed;
            height: 100%;
            z-index: 555;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
        }

        .lyear-overlay {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 10;
            background: rgba(72, 176, 247, 0.8);
        }

        .lyear-logo {
            margin-bottom: 50px;
        }

        .lyear-featured {
            z-index: 12;
            position: absolute;
            bottom: 0;
            padding: 30px;
            width: 100%;
        }

            .lyear-featured h4 {
                color: #fff;
                line-height: 32px;
            }

                .lyear-featured h4 small {
                    color: #fff;
                    display: block;
                    text-align: right;
                    margin-top: 15px;
                }

        .lyear-login-right {
            margin-left: 50%;
            position: relative;
            z-index: 999;
            padding: 100px;
            background-color: #fff;
        }

        @media screen and (max-width: 1024px) {
            .lyear-login-right {
                padding: 50px;
            }
        }

        @media screen and (max-width: 820px) {
            .lyear-login-left {
                width: 100%;
                position: relative;
                z-index: 999;
                height: 300px;
            }

            .lyear-login-right {
                margin-left: 0;
            }
        }

        @media screen and (max-width: 480px) {
            .lyear-login-right {
                padding: 50px;
            }
        }

        @media screen and (max-width: 320px) {
            .lyear-login-right {
                padding: 30px;
            }
        }
    </style>
    <script type="text/javascript" src="js/jquery-1-7-2.js"></script>

    <script type="text/javascript">
        //JS回车键执行按钮开始
        document.onkeydown = function (event) {
            e = event ? event : (window.event ? window.event : null);

            if (e.keyCode == 13) {
                document.getElementById("btnLogin").click();
                return false;
            }
        }
        //结束
    </script>
    <script type="text/javascript">
        function CheckEmail() {
            if (document.getElementById("Email").value == "") {
                alert("请输入邮箱地址！"); document.getElementById("Email").focus();
                return false;
            }
            else if (document.getElementById('Email').value != "") {
                if (!/^[\w-]+(\.[\w-]+)*@[\w-]+(\.(\w)+)*(\.(\w){2,3})$/.test(document.getElementById("Email").value)) { alert("请输入正确的邮箱地址！"); document.getElementById("Email").focus(); return false; }
            }
            document.getElementById('divbutton2').style.display = 'none';
            document.getElementById('loading2').style.display = 'block';
            setMessage(); return false;
        }
        function setMessage(stremail) {
            var img = "<img src='images/admin_images/loading_small.gif'/>";
            var xmlObj = null;
            if (window.XMLHttpRequest) {
                xmlObj = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                xmlObj = new ActiveXObject("Microsoft.XMLHTTP");
            } else {
                return;
            }
            xmlObj.onreadystatechange = function () {
                if (xmlObj.readyState == 0) {  }
                if (xmlObj.readyState == 1) {  }
                if (xmlObj.readyState == 2) {  }
                if (xmlObj.readyState == 3) {  }
                if (xmlObj.readyState == 4) {
                    
                    if (xmlObj.status == 200) { updateObj(xmlObj.responseText); }
                }
            }
            xmlObj.open('Post', 'SendToEmail.aspx?Email=' +stremail, true);
            xmlObj.send('');
        }
        function updateObj(data) {
            if (data == "True") {   lightyear.loading('show');
        // 假设ajax提交操作
        setTimeout(function () {
            lightyear.loading('hide');
            lightyear.notify('密码已经发送至邮箱，请注意查收！', 'success', 100);
        }, 1e3)  }
            else if (data == "False") {   lightyear.loading('show');
        // 假设ajax提交操作
        setTimeout(function () {
            lightyear.loading('hide');
            lightyear.notify('发送失败！', 'danger', 100);
        }, 1e3)  }
            else if (data == "Error") {   lightyear.loading('show');
        // 假设ajax提交操作
        setTimeout(function () {
            lightyear.loading('hide');
            lightyear.notify('邮箱不存在！', 'danger', 100);
        }, 1e3)  }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="lyear-login-box">
  <div class="lyear-login-left" style="background-image: url(images/login-bg-4.jpg)">
    <div class="lyear-overlay"></div>
    <div class="lyear-featured">
      <h4>始创于2008年，智慧网络营销服务提供商，历经10多年，服务客户超万家，遍布国内600多个城市。</h4>
    </div>
  </div>
  <div class="lyear-login-right">
    
    <div class="lyear-logo text-center"> 
      <a><img src="images/logo-sidebar.png" alt="logo" /></a> 
    </div>
    <div >
      <div class="form-group">
        <label for="username">用户名</label>
        <asp:TextBox ID="txtUserName" Class="form-control" runat="server"></asp:TextBox>
       <%-- <input type="text" class="form-control" id="username" placeholder="请输入您的用户名">--%>
      </div>

      <div class="form-group">
        <label for="password">密码</label>
        <div class="row">
          <div class="col-xs-7">
        <%--<input type="password" class="form-control" id="password" placeholder="请输入您的密码">--%>
              <asp:TextBox ID="txtPassword" Class="form-control" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <div class="col-xs-5" style="line-height:38px; text-align:right;">
        <a class="example-p-3" href="#">忘记密码？</a>
        </div>
      </div>
      </div>

      <div class="form-group">
        <label for="captcha">验证码</label>
        <div class="row">
          <div class="col-xs-7">
              <asp:TextBox ID="tbxRegisterVerifier" class="form-control" runat="server" ></asp:TextBox>
          </div>
          <div class="col-xs-5">
            <asp:Image ID="Image1" runat="server" ImageUrl="Code.aspx" CssClass="pull-right"  Style="cursor: pointer;height:38px" align="absmiddle" onclick="this.src='Code.aspx?' + Math.random()" alt="点击刷新" />
          </div>

        </div>
      </div>
      

      <div class="form-group">
        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-block btn-primary" Text="立即登录"/>
              <span id="CommonMessage"></span>

      </div>
      <footer class="text-center">
        <p class="m-b-0">Copyright © 2008-<script type="text/javascript">                                          var myDate = new Date(); document.write(myDate.getFullYear());</script> All Rights Reserved
           <%=Basic.Keys.Banben %>
        </p>
      </footer>
    </div>

</div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!--对话框-->
<script src="js/jconfirm/jquery-confirm.min.js"></script>
    <script src="js/bootstrap-notify.min.js"></script>
        <script type="text/javascript" src="js/lightyear.js"></script>
        <script type="text/javascript" src="js/main.min.js"></script>
        <script src="js/login.js?v=4.0.22" type="text/javascript" charset="gb2312"></script>
<script type="text/javascript">

$('.example-p-3').on('click', function () {
    $.confirm({
        title: '找回密码',
        content: '' +
        '<form action="" class="formName">' +
        '<div class="form-group">' +
        '<label>输入您的预留邮箱</label>' +
        '<input type="text" placeholder="邮箱" class="name form-control" required />' +
        '</div>' +
        '</form>',
        buttons: {
            formSubmit: {
                text: '提交',
                btnClass: 'btn-blue',
                action: function () {
                    var name = this.$content.find('.name').val();
                    if(!name){
                        $.alert('请您输入您的预留邮箱');
                        return false;
                    }
                    setMessage(name);
                }
            },
            cancel: {
                text: '取消'
            },
        },
        onContentReady: function () {
        }
    });
});

</script>

    
    </form>
</body>
</html>
