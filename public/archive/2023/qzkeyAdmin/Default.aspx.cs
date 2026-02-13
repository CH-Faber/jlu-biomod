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
using WebApp.Components;
using System.Data.SqlClient;
using basic;
using System.Web.Services;
using System.Net;
using System.Text;
using System.IO;
using System.Security.Cryptography;

public partial class Manager_Default : Basic.ManagerPage
{
    BasicPage bp = new BasicPage();
    public string strQq = "";
    public string strUserName = "";
    public string strRole = "0";

    string space_size;//空间总大小
    public string percentage;//已使用百分比
    public string dropType = "";//版本
    public string txtBeginTime = "";//开始时间
    public string txtEndTime = "";//结束时间
    public int NewsNum = 0;//新闻条数
    public int MessageNum = 0;//留言条数
    public string putdate = "";//更新时间
    public int open = 1;//更新显示
    public string strQQ = "";//客服QQ
    public string strnum_zong = "50";//更新总次数
    public string strnum = "1";//更新次数
    public string State = "";
    public string space_size_yiyong = "";//已用空间大小

    Time time = new Time();
    protected Basic.Model.ManagerInfo admin_info;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            admin_info = GetAdminInfo();
            strUserName = admin_info.UserID;
            strRole = admin_info.Role;
            showContent();
        }
        //空间总大小
        string space_size = Math.Round(Convert.ToDouble(spcaet) * 1024, 2).ToString();
        //已用空间大小
        space_size_yiyong = Math.Round(Convert.ToDouble(bp.GetDirectoryLength(HttpContext.Current.Request.PhysicalApplicationPath)) / 1048576, 2).ToString();
        //计算百分比
        percentage = (Math.Round(Convert.ToDouble(space_size_yiyong) / Convert.ToDouble(space_size), 2) * 100).ToString();

        if (Int32.Parse(percentage) > 100 && strRole == "0")
        {
            Response.Write("<script>window.location.href='Logout.aspx';window.location.href='../404_space.html';</script>");
        }
        else if (Int32.Parse(percentage) > 100)
        {
            Response.Write("<script>alert('网站使用空间已满，请通知客户扩容！');</script>");
        }

        SqlDataReader myread = bp.getRead("select Phone from TbTimeLimit");
        if (myread.Read())
        {
            strQq = myread[0].ToString();
        }
        myread.Close();
    }
    public string spcaet = "";
    protected void showContent()
    {
        int intID = 1;
        SqlDataReader reader = time.GetTimeLimit(intID);
        if (reader.Read())
        {
            txtBeginTime = reader["BeginTime"].ToString();
            txtEndTime = reader["EndTime"].ToString();
            dropType = reader["Type"].ToString();
            strQQ = reader["Phone"].ToString();
            spcaet = reader["beizhu"].ToString();
            if(!IsNumberic(spcaet))
            {
                spcaet = "2";
            }

            if (!string.IsNullOrEmpty(reader["SMSToMobile"].ToString()))
            {
                strnum_zong = reader["SMSToMobile"].ToString();
            }
        }
        reader.Close();
        SqlDataReader myreadNews = bp.getRead("select COUNT(a) from (select id as a  from news union all select Proid as a from product) as a");
        if (myreadNews.Read())
        {
            NewsNum = Int32.Parse(myreadNews[0].ToString());
        }
        myreadNews.Close();
        SqlDataReader myreadMessage = bp.getRead("select count(id) from message");
        if (myreadMessage.Read())
        {
            MessageNum = Int32.Parse(myreadMessage[0].ToString());
        }
        myreadMessage.Close();
        WebSite website = new WebSite();
        SqlDataReader readerguanbi = website.GetWebSiteControl(1);
        if (readerguanbi.Read())
        {
            State = readerguanbi["State"].ToString();

        }
        readerguanbi.Close();

        SqlDataReader myreadgengxin = bp.getRead("select * from tbGrab where title='流量统计'");
        if (myreadgengxin.Read())
        {
            putdate = myreadgengxin["putdate"].ToString();
            if(!string.IsNullOrEmpty(myreadgengxin["ClassId"].ToString()))
            {
                strnum = myreadgengxin["ClassId"].ToString();

            }
            if (!string.IsNullOrEmpty(putdate))
            {
                if (DateTime.Parse(putdate).ToString("yyyy-MM-dd") == DateTime.Now.ToString("yyyy-MM-dd"))
                {
                    open = 0;
                }
                putdate = "最近更新时间：" + putdate;
            }
        }
        myreadgengxin.Close();
    }
    [WebMethod]
    public static void btnSaveClick(string date)
    {
        WebSite website = new WebSite();
        int intID = 1;
        int intRowCount = website.UpdateWebSiteControl(intID, date, "网站维护中   请稍候访问");
        if (intRowCount > 0)
        {
            Basic.Model.ManagerInfo admin_info;
            Basic.ManagerPage bm = new Basic.ManagerPage();
            admin_info = bm.GetAdminInfo();
            string strUserName = admin_info.UserID;
            Log log = new Log();
            log.AddSingleLog(DateTime.Now.ToString(), HttpContext.Current.Request.UserHostAddress, strUserName, "网站开关-状态：" + date);
        }
    }

    /// <summary>
    /// 判断是否是数字
    /// </summary>
    /// <param name="oText"></param>
    /// <returns></returns>
    public bool IsNumberic(string oText)//判断是否是数字
    {
        try
        {
            double var1 = System.Convert.ToDouble(oText);
            return true;
        }
        catch
        {
            return false;
        }
    }

}

