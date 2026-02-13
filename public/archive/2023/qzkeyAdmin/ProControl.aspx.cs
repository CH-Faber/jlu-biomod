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
using System.Web.Services;

public partial class Manager_ProControl : Basic.ManagerPage
{
    WebSite website = new WebSite();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            showContent();
        }
    }
    protected void showContent()
    {
        BasicPage bp = new BasicPage();
        int intID = 1;
        SqlDataReader reader = bp.getRead("select ProSample,ProDetailSample from website where id=" + intID);
        if (reader.Read())
        {
            hidProList.Value = reader["ProSample"].ToString();
            hidProDetail.Value = reader["ProDetailSample"].ToString();
        }
        reader.Close();
    }
    [WebMethod]
    public static string edit(string RadioPro, string RadioProDetail)
    {
        BasicPage bp = new BasicPage();
        if (bp.doExecute("update Website set ProSample='" + RadioPro + "',ProDetailSample='" + RadioProDetail + "'"))
        {
            return "成功";
        }
        else
        {
            return "失败";
        }
    }
 }
