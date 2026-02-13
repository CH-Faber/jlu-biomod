// JavaScript Document
function CheckUser()
{
    if (document.getElementById("txtUserName").value == "") { alert("请输入用户名"); document.getElementById("txtUserName").focus(); return false; }
    else if (document.getElementById("txtPassword").value == "") { alert("请输入密码"); document.getElementById("txtPassword").focus(); return false; }
    else if (document.getElementById("tbxRegisterVerifier").value == "") { alert("请输入验证码"); document.getElementById("tbxRegisterVerifier").focus(); return false; }
    else
    {
        document.getElementById("CommonMessage").innerHTML = "";
        Login();
        return false;
    }
}
//检测用户名
function Login()
{
    var xmlObj = null;
    if (window.XMLHttpRequest)
    {
        xmlObj = new XMLHttpRequest();
    } else if (window.ActiveXObject)
    {
        xmlObj = new ActiveXObject("Microsoft.XMLHTTP");
    } else
    {
        return;
    }
    xmlObj.onreadystatechange = function ()
    {
        if (xmlObj.readyState == 4)
        {
            if (xmlObj.status == 200)
            { loginupdateObj(xmlObj.responseText); }
        }
    }
    xmlObj.open('Post', 'checkUser.aspx?UserName=' + document.getElementById("txtUserName").value + '&Password=' + document.getElementById("txtPassword").value + '&Code=' + document.getElementById("tbxRegisterVerifier").value, true);
    xmlObj.send('');
}
function loginupdateObj(data)
{
    if (data == "验证码错误") { lightyear.loading('show');
    // 假设ajax提交操作
    setTimeout(function() {
        lightyear.loading('hide');
        lightyear.notify('验证码错误', 'danger', 100);
    }, 1e3) }
    else if (data == "ERROR") {
        lightyear.loading('show');
        // 假设ajax提交操作
        setTimeout(function () {
            lightyear.loading('hide');
            lightyear.notify('用户名或者密码错误', 'danger', 100);
        }, 1e3) }
    else if (data == "SUCCESS")
    {
        window.location = "Default.aspx";
    }
}
//验证码，看不请，换一张
function imgchange(imgid)
{
    var img = document.getElementById(imgid);
    img.src = img.src + '?' + Math.random();
}
//email
$(document).ready(function ()
{
    $(".SendToMobile").click(
		function () { $(".email").css("display", "block") }
	)
    $(".email h2 span").click(
		function () { $(".email").css("display", "none") }
	)
    $(".SendToMobile").hover(
		function () { $(this).css("color", "#f60") }, function () { $(this).css("color", "#c00") }
	)
})