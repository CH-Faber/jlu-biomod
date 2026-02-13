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

public partial class Manager_SpaceSize : Basic.ManagerPage
{
    BasicPage bp = new BasicPage();
    public string Leixing;

    string space_size;//空间总大小
    string space_size_yiyong;//已用空间大小
    public string percentage;//已使用百分比
    protected void Page_Load(object sender, EventArgs e)
    {
        //空间总大小
        string space_size = Math.Round(Convert.ToDouble(space.spacename.GetIndexConfigValue("Space")) * 1024, 2).ToString();
        //已用空间大小
        string space_size_yiyong = Math.Round(Convert.ToDouble(bp.GetDirectoryLength(HttpContext.Current.Request.PhysicalApplicationPath)) / 1048576, 2).ToString();
        //计算百分比
        percentage = (Math.Round(Convert.ToDouble(space_size_yiyong) / Convert.ToDouble(space_size), 2) * 100).ToString();
        Lspace.Text = "已使用：" + space_size_yiyong + "M，总空间：" + space_size + "M，使用率：" + percentage + "%";
        //SqlDataReader myread = bp.getRead("select top 1 Type from TbTimeLimit");
        //if (myread.Read())
        //{
        //    Leixing = myread[0].ToString();
        //    if (Leixing == "入门型")
        //    {
        //        Leixing = "20M";
        //    }
        //    if (Leixing == "标准型")
        //    {
        //        Leixing = "100M";
        //    }
        //    if (Leixing == "旗舰型")
        //    {
        //        Leixing = "1000M";
        //    }
        //    if (Leixing == "定制型")
        //    {
        //        Leixing = "1000M";
        //    }
        //}
        //myread.Close();
    }
}

