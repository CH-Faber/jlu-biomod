layui.config({
    base: '../layui/' //静态资源所在路径
}).extend({
    index: 'lib/index' //主入口模块
}).use(['index'], function () {
    var $ = layui.$
        , admin = layui.admin
        , element = layui.element
        , layer = layui.layer;});
$(function () {
    GetYangshi();
    $("#dropColumnType").change(function () {
        GetYangshi();
    });
    $(".yulan").click(function () {
        var Url = yulanUrl();
        layer.open({
            type: 2,
            area: ['1100px', '700px'],
            fixed: false,
            maxmin: true,
            content: Url
        });
    });
})
function GetYangshi() {
    $(".news, .pic, .download, .contact, .message").hide();
    var fenlei = $("#dropColumnType").val().replace(/\s+/g, "");
    switch (fenlei)
    {
        case "新闻列表": $(".news").show(); break;
        case "图片列表": $(".pic").show(); break;
        case "下载中心": $(".download").show(); break;
        case "联系方式": $(".contact").show(); break;
        case "在线留言": $(".message").show(); break;
    }
}
function yulanUrl() {
    var fenlei = $("#dropColumnType").val().replace(/\s+/g, "");
    var Url = "#";
    switch (fenlei) {
        case "新闻列表": Url = "yangbanyulan.aspx?Column=News"; break;
        case "图片列表": Url = "yangbanyulan.aspx?Column=Pic"; break;
        case "下载中心": Url = "yangbanyulan.aspx?Column=DownLoad"; break;
        case "联系方式": Url = "yangbanyulan.aspx?Column=Contact"; break;
        case "在线留言": Url = "yangbanyulan.aspx?Column=Message"; break;
    }
    return Url;
}