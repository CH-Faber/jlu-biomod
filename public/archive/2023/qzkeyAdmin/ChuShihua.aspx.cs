using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using WebApp.Components;
using basic;

public partial class Manager_ChuShihua : Basic.ManagerPage
{
    public BasicPage bp = new BasicPage();
    public string strDataPath;
    protected Basic.Model.ManagerInfo admin_info;

    protected void Page_Load(object sender, EventArgs e)
    {
        admin_info = GetAdminInfo();
        string strRole = admin_info.Role;
        if (strRole == "1")
        {
            button1.Attributes.Add("onclick", "return Checkbtn()");
            button2.Attributes.Add("onclick", "return Checkbtn()");
            button3.Attributes.Add("onclick", "return Checkbtn()");
            button4.Attributes.Add("onclick", "return Checkbtn()");
            button5.Attributes.Add("onclick", "return Checkbtn()");
            button6.Attributes.Add("onclick", "return Checkbtn()");
            button7.Attributes.Add("onclick", "return Checkbtn()");
            button8.Attributes.Add("onclick", "return Checkbtn()");
        }
        else
        {
            Response.Write("<script>");
            Response.Write("alert('没有访问该文件的权限');parent.location.href='default.aspx'");
            Response.Write("</script>");
        }
    }
    //技术支持
    protected void button1_click(object s, EventArgs e)
    {
        bp.doExecute("update TbSupport set StateManage='0' where id=1");
        bp.doExecute("update TbSupport set State='1' where id=1");
        bp.doExecute("update TbSupport set StateSitemap='1' where id=1");
        bp.doExecute("update TbSupport set SupportName='腾云建站仅向商家提供技术服务' where id=1");
        bp.doExecute("update TbSupport set Title='腾云建站仅向商家提供技术服务' where id=1");
        bp.doExecute("update TbSupport set WebSite='https://www.400301.com/' where id=1");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //网站优化
    protected void button2_Click(object sender, EventArgs e)
    {
        bp.doExecute("update SEO set WebTitle='网站已开通，等待完善资料' where id=1");
        bp.doExecute("update SEO set WebDescription='这里是网站描述' where id=1");
        bp.doExecute("update SEO set WebKeywords='关键词,网站关键词' where id=1");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //栏目优化
    protected void button3_Click(object sender, EventArgs e)
    {
        bp.doExecute("update ColumnList set ColumnTitle=''");
        bp.doExecute("update ColumnList set ColumnDescription=''");
        bp.doExecute("update ColumnList set ColumnKeywords=''");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //用户管理
    protected void button4_Click(object sender, EventArgs e)
    {
        bp.doExecute("delete from Admin where Role=0");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //嵌入代码
    protected void button5_Click(object sender, EventArgs e)
    {
        bp.doExecute("update TbCode set State='0' where id=1");
        bp.doExecute("update TbCode set Content='' where id=1");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //客户留言
    protected void button6_Click(object sender, EventArgs e)
    {
        bp.doExecute("delete from Message");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //在线客服
    protected void button7_Click(object sender, EventArgs e)
    {
        bp.doExecute("delete from TbIM");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //网站信息
    protected void button9_Click(object sender, EventArgs e)
    {
        bp.doExecute("update Website set ICP='苏ICP备2021xxxx00号' where id=1");
        bp.doExecute("update Website set WebUrl='' where id=1");
        bp.doExecute("update Website set CompanyName='某某XXXX有限公司' where id=1");
        bp.doExecute("update Website set NameState='0' where id=1");
        bp.doExecute("update Website set Address='xx市xx区xx路xx号楼' where id=1");
        bp.doExecute("update Website set Phone='xx-xxxxxxxx' where id=1");
        bp.doExecute("update Website set Mobile='123456789xx' where id=1");
        bp.doExecute("update Website set Email='xxxxxx@xx.com' where id=1");
        bp.doExecute("update Website set Fax='xx-xxxxxxxx' where id=1");
        bp.doExecute("update Website set Contact='某某某' where id=1");
        bp.doExecute("update Website set QQ='123456xx' where id=1");
        bp.doExecute("update Website set Map='' where id=1");
        bp.doExecute("update Website set WeChat='123xxx' where id=1");
        bp.doExecute("update Website set Zip='000000' where id=1");
        bp.doExecute("update Website set ProSample=99 where id=1");
        bp.doExecute("update Website set ProDetailSample=99 where id=1");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
    //一键初始化
    protected void button8_Click(object sender, EventArgs e)
    {
        bp.doExecute("update TbSupport set StateManage='0' where id=1");
        bp.doExecute("update TbSupport set State='1' where id=1");
        bp.doExecute("update TbSupport set StateSitemap='1' where id=1");
        bp.doExecute("update TbSupport set SupportName='腾云建站仅向商家提供技术服务' where id=1");
        bp.doExecute("update TbSupport set Title='腾云建站仅向商家提供技术服务' where id=1");
        bp.doExecute("update TbSupport set WebSite='https://www.400301.com/' where id=1");
        bp.doExecute("update SEO set WebTitle='网站已开通，等待完善资料' where id=1");
        bp.doExecute("update SEO set WebDescription='这里是网站描述' where id=1");
        bp.doExecute("update SEO set WebKeywords='关键词,关键词二,关键词三' where id=1");
        bp.doExecute("update ColumnList set ColumnTitle=''");
        bp.doExecute("update ColumnList set ColumnDescription=''");
        bp.doExecute("update ColumnList set ColumnKeywords=''");
        bp.doExecute("delete from Admin where Role=0");
        bp.doExecute("update TbCode set State='0' where id=1");
        bp.doExecute("update TbCode set Content='' where id=1");
        bp.doExecute("delete from Message");
        bp.doExecute("delete from TbIM");
        //bp.doExecute("delete from TbLog");
        //网站信息
        bp.doExecute("update Website set ICP='苏ICP备2021xxxx00号' where id=1");
        bp.doExecute("update Website set WebUrl='' where id=1");
        bp.doExecute("update Website set CompanyName='某某XXXX有限公司' where id=1");
        bp.doExecute("update Website set NameState='0' where id=1");
        bp.doExecute("update Website set Address='xx市xx区xx路xx号楼' where id=1");
        bp.doExecute("update Website set Phone='xx-xxxxxxxx' where id=1");
        bp.doExecute("update Website set Mobile='123456789xx' where id=1");
        bp.doExecute("update Website set Email='xxxxxx@xx.com' where id=1");
        bp.doExecute("update Website set Fax='xx-xxxxxxxx' where id=1");
        bp.doExecute("update Website set Contact='某某某' where id=1");
        bp.doExecute("update Website set QQ='123456xx' where id=1");
        bp.doExecute("update Website set Map='' where id=1");
        bp.doExecute("update Website set WeChat='123xxx' where id=1");
        bp.doExecute("update Website set Zip='000000' where id=1");
        bp.doExecute("update Website set ProSample=99 where id=1");
        bp.doExecute("update Website set ProDetailSample=99 where id=1");

        Response.Redirect("Show_Success.aspx?Message=设置成功！&Url=ChuShihua.aspx");
    }
}

