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

public partial class Manager_Left : System.Web.UI.UserControl
{
    public string strFormState = null;
    public string GetUrl = "";
    protected Basic.Model.ManagerInfo admin_info;
    public string strRole;
    protected void Page_Load(object sender, EventArgs e)
    {
        Basic.ManagerPage bm = new Basic.ManagerPage();
        if (!IsPostBack)
        {
            admin_info = bm.GetAdminInfo();
            strRole = admin_info.Role;
            showContent();
        }
        GetUrl = Request.Url.AbsoluteUri.ToLower();
    }
    protected void showContent()
    {
        Submit Submit = new Submit();
        int intID = 1;
        SqlDataReader reader = Submit.GetForm(intID);
        if (reader.Read())
        {
            strFormState = reader["FormState"].ToString();
        }
        reader.Close();
    }
    public string Getactive(string url)
    {
        string strClass = "";
        string[] urlzu = url.Split('|');
        for (int i = 0; i < urlzu.Length; i++)
        {
            if (GetUrl.Contains(urlzu[i].ToLower()))
            {
                strClass = "active";
            }
        }
        return strClass;
    }
    public string Getopen(string url)
    {
        string strClass = "";
        string[] urlzu = url.Split('|');
        for (int i = 0; i < urlzu.Length; i++)
        {
            if (GetUrl.Contains(urlzu[i].ToLower()))
            {
                strClass = "open";
            }
        }
        return strClass;
    }
}

