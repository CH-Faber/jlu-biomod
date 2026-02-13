$(function () {
    //选择文件
    $(document).off('change', '#file').on('change', '#file', function () {
        //$(".file").hide();
        //$("#hidfile").show();
        var filePath = $(this).val();
        //设置上传文件类型
        if (filePath.toLowerCase().indexOf("png") != -1 || filePath.toLowerCase().indexOf("jpg") != -1 || filePath.toLowerCase().indexOf("gif") != -1) {

            //上传文件
            $.ajaxFileUpload({
                url: 'ashx/FileHandler.ashx',//处理程序路径
                secureuri: false,
                fileElementId: 'file',
                dataType: 'json',
                success: function (data, status) {
                    //获取上传文件路径
                    var path = $("#hidfujian").val();
                    if (path == "" || path == null) {
                        path = data.filenewname;
                    }
                    else {
                        path = path + "|" + data.filenewname;
                    }
                    var str_new = data.filenewname.split("|");
                    for (var i = 0; i < str_new.length; i++) {
                        if (str_new[i] == "文件过大") {
                            $("#upStrInfoImagesDiv ul .duotupic").before("<li class=\"col-xs-4 col-sm-3 col-md-2 upload_img\"><figure><img src=\"images/guoda.jpg\"><figcaption><a target=\"_blank\" class=\"btn btn-round btn-square btn-primary editqzl\"><i class=\"mdi mdi-stackexchange\"></i></a><a class=\"btn btn-round btn-square btn-danger del\"><i class=\"mdi mdi-delete\"></i></a></figcaption></figure></li>");
                            var quchu = "文件过大|";
                            if (path.indexOf("|") != -1) {
                                if (path.indexOf(quchu) != -1) {
                                    path = path.replace(quchu, "");
                                }
                                else {
                                    path = path.replace("|文件过大", "");
                                }
                            }
                            else {
                                path = path.replace(src, "");
                            }
                            path = path.replace("文件过大", "");
                        }
                        else {
                            $("#upStrInfoImagesDiv ul .duotupic").before("<li class=\"col-xs-4 col-sm-3 col-md-2\"><figure><img src=\"/" + str_new[i] + "\"><figcaption><a target=\"_blank\" class=\"btn btn-round btn-square btn-primary editqzl\"><i class=\"mdi mdi-stackexchange\"></i></a><a class=\"btn btn-round btn-square btn-danger del\"><i class=\"mdi mdi-delete\"></i></a></figcaption></figure></li>");
                        }
                    }
                    $("#hidfujian").val(path);
                    //$(".file").show();
                    //$("#hidfile").hide();
                },
                error: function (data, status, e) {
                    alert(e);
                }
            });
        } else {
            alert("请选择正确的文件格式！");
            //清空上传路径
            return false;
        }
    });

    $(document).off('change', '#file_edit').on('change', '#file_edit', function () {
        //$(".file").hide();
        //$("#hidfile").show();
        var filePath = $(this).val();
        //设置上传文件类型
        if (filePath.toLowerCase().indexOf("png") != -1 || filePath.toLowerCase().indexOf("jpg") != -1 || filePath.toLowerCase().indexOf("gif") != -1) {

            //上传文件
            $.ajaxFileUpload({
                url: 'ashx/FileHandler.ashx',//处理程序路径
                secureuri: false,
                fileElementId: 'file_edit',
                dataType: 'json',
                success: function (data, status) {
                    //获取上传文件路径
                    var path = $("#hidfujian").val();
                    var path_edit = $("#hid_file_edit").val();
                    path = path.replace(path_edit, data.filenewname);
                    $("img[src='/" + path_edit + "']").attr("src", "/"+data.filenewname);
                    $("#hidfujian").val(path);
                },
                error: function (data, status, e) {
                    alert(e);
                }
            });
        } else {
            alert("请选择正确的文件格式！");
            //清空上传路径
            return false;
        }
    });


    var path = $("#hidfujian").val();
    if (path != "" && path != null) {
        var str_new = path.split("|");
        for (var i = 0; i < str_new.length; i++) {
            $("#upStrInfoImagesDiv ul .duotupic").before("<li class=\"col-xs-4 col-sm-3 col-md-2\"><figure><img src=\"/" + str_new[i] + "\"><figcaption><a target=\"_blank\" class=\"btn btn-round btn-square btn-primary editqzl\"><i class=\"mdi mdi-stackexchange\"></i></a><a class=\"btn btn-round btn-square btn-danger del\"><i class=\"mdi mdi-delete\"></i></a></figcaption></figure></li>");
        }
    }
});
$("body").on("click", ".del i", function () {
    var src = $(this).parent().parent().parent().parent().find("img").attr("src").replace("/Upload", "Upload");
    var quchu = src + "|";
    var path = $("#hidfujian").val();
    if (path.indexOf("|") != -1) {
        if (path.indexOf(quchu) != -1) {
            path = path.replace(quchu, "");
        }
        else {
            path = path.replace("|" + src, "");
        }
    }
    else {
        path = path.replace(src, "");
    }
    $("#hidfujian").val(path);
    $(this).parent().parent().parent().parent().remove();
});

$("body").on("click", ".editqzl i", function () {
    var src = $(this).parent().parent().parent().parent().find("img").attr("src").replace("/Upload", "Upload");
    $("#hid_file_edit").val(src);
    $('#file_edit').click();
});
