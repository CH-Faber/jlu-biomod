<%@ Page Language="C#" AutoEventWireup="true" CodeFile="yangbanyulan.aspx.cs" Inherits="Manager_yangbanyulan" ValidateRequest="false" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>样式信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <style>
.update_product2{ max-width:1050px; margin:0 auto;}
.update_product2 ul li{ float:left; margin-right:20px; margin-bottom:20px; width:1000px; transition:ease-out .35s;list-style: none;}
.update_product2 ul li .pro_pic{ border:1px solid #ccc; padding:10px; height:700px;}
.update_product2 ul li .pro_pic table tr td{ height:700px; text-align:center;}
.update_product2 ul li .pro_pic img{ max-width:100%; max-height:700px;}
.update_product2 ul li:nth-child(1n){ margin-right:0px;}
.update_product2 ul li .pro_tit{ padding:12px 20px; text-align:center; font-size:16px; color:#000;white-space: nowrap;overflow: hidden;text-overflow: ellipsis; }
.update_product2 ul li:hover .pro_pic{ border:1px solid #f60;}
.update_product2 ul li:hover .pro_tit{ color:#f60;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!--内容开始-->

        <div class="update_product2">
            <ul>
                <%for(int i=1;i<=num;i++)
                    {%>
                <li><a>
                    <div class="pro_pic">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="pro_img">
                            <tbody>
                                <tr>
                                    <td valign="middle">
                                        <img src="images/<%=Column+i.ToString() %>.jpg"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="pro_tit">样式<%=NumberToChinese(i) %></div>
                </a></li>
            <%} %>
                <div class="clear"></div>
            </ul>
        </div>
    </form>
</body>

</html>

