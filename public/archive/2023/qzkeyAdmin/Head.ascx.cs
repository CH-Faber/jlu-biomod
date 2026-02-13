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
using basic;
using WebApp.Components;

public partial class Head : System.Web.UI.UserControl
{
    public string strUserName = "";
    public string strRole = "0";
    protected Basic.Model.ManagerInfo admin_info;
    Basic.ManagerPage bm = new Basic.ManagerPage();
    public string ColumnName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        admin_info = bm.GetAdminInfo();
        strUserName = admin_info.UserID;
        strRole = admin_info.Role;
        if (!Page.IsPostBack)
        {
            
        }
        ColumnName = GetName();
    }
    public string GetName()
    {
        string strName = "";
        string GetUrl = Request.Url.AbsoluteUri.ToLower();
        if(GetUrl.Contains("default.aspx".ToLower()))
        {
            strName = "后台首页";
        }
        if (GetUrl.Contains("WebSiteSet.aspx".ToLower()))
        {
            strName = "网站配置 - 基本信息";
        }
        if (GetUrl.Contains("SEO.aspx".ToLower()))
        {
            strName = "网站配置 - TDK设置";
        }
        if (GetUrl.Contains("IM.aspx".ToLower()))
        {
            strName = "网站配置 - 添加客服";
        }
        if (GetUrl.Contains("PicManage.aspx".ToLower()))
        {
            strName = "图片管理";
        }
        if (GetUrl.Contains("NewsClass.aspx".ToLower()) || GetUrl.Contains("NewsClassEdit.aspx".ToLower()) || GetUrl.Contains("About.aspx".ToLower()) || GetUrl.Contains("News.aspx".ToLower())) 
        {
            strName = "导航栏目";
        }
        if (GetUrl.Contains("ProControl.aspx".ToLower()))
        {
            strName = "产品中心 - 样式设置";
        }
        if (GetUrl.Contains("ProClass.aspx".ToLower()) || GetUrl.Contains("ProClassNameEdit.aspx".ToLower()))
        {
            strName = "产品中心 - 分类设置";
        }
        if (GetUrl.Contains("Product.aspx".ToLower()) || GetUrl.Contains("ProAddset.aspx".ToLower()) || GetUrl.Contains("ProAdd.aspx".ToLower()))
        {
            strName = "产品中心 - 产品管理";
        }
        if (GetUrl.Contains("Message.aspx".ToLower()))
        {
            strName = "客户留言 - 留言中心";
        }
        if (GetUrl.Contains("SubmitList.aspx".ToLower()))
        {
            strName = "客户留言 - 在线表单";
        }
        if (GetUrl.Contains("PageStateControl.aspx".ToLower()))
        {
            strName = "生成静态";
        }
        if (GetUrl.Contains("Links.aspx".ToLower()))
        {
            strName = "友情链接";
        }
        if (GetUrl.Contains("SetupCode.aspx".ToLower()))
        {
            strName = "嵌入代码";
        }

        if (GetUrl.Contains("TimeLimit.aspx".ToLower()))
        {
            strName = "超级设置 - 使用日期";
        }
        if (GetUrl.Contains("AdminManage.aspx".ToLower()))
        {
            strName = "超级设置 - 账户管理";
        }
        if (GetUrl.Contains("Support.aspx".ToLower()))
        {
            strName = "超级设置 - 技术支持";
        }
        if (GetUrl.Contains("Mianban.aspx".ToLower()))
        {
            strName = "超级设置 - 网站备份";
        }
        if (GetUrl.Contains("LogManage.aspx".ToLower()))
        {
            strName = "超级设置 - 操作日志";
        }
        if (GetUrl.Contains("SitemapControl.aspx".ToLower()))
        {
            strName = "网站配置 - 网站地图";
        }
        if (GetUrl.Contains("UpdatePassword.aspx".ToLower()))
        {
            strName = "修改密码";
        }
        if (GetUrl.Contains("Query.aspx".ToLower()))
        {
            strName = "证书查询";
        }
        return strName;
    }
}

