function CheckEdit() {
    var ProList = $("input[name='ProList']:checked").val();
    var ProDetail = $("input[name='ProDetail']:checked").val();
    $.ajax({
        type: "POST",//
        url: "ProControl.aspx/edit",
        data: "{RadioPro:'" + ProList + "',RadioProDetail:'" + ProDetail + "'}",
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            if (data.d == "成功") {
                layer.msg('修改成功');            }
            else {
                layer.msg('修改失败');
            }
        },
        error: function (msg) {
            layer.msg('修改失败');
        }
    });
}
$(function () {
    var hidProList = $("#hidProList").val();
    var hidProDetail = $("#hidProDetail").val();
    $("input[name='ProList'][value='" + hidProList + "']").attr("checked", 'checked');
    $("input[name='ProDetail'][value='" + hidProDetail + "']").attr("checked", 'checked');
});