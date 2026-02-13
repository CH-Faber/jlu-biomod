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
using System.IO;
using WebApp.Components;
using basic;

public partial class Manager_NewsClass : Basic.ManagerPage
{
    protected Basic.Model.ManagerInfo admin_info;

    BasicPage bp = new BasicPage();
    public string strFormState = null;
    public string strRole = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            admin_info = GetAdminInfo();
            strRole = admin_info.Role;
            LoadList();
        }
    }
    /// <summary>
    /// 加载整个分类表
    /// </summary>
    private void LoadList()
    {
        ListItem li = new ListItem("顶级分类", "0");
        litlist.Text = "";

        int MTcount = 0;//执行遍历的次数
        //开始迭代加载
        MakeTr("0", MTcount);
    }
    /// <summary>
    /// 装配每一行
    /// </summary>
    /// <param name="id">上级ID</param>
    /// <param name="count">迭代次数</param>
    private void MakeTr(string id, int count)
    {
        string strLink = null;
        DataSet ds = bp.SelectDataBase("ColumnList", "select ColumnType,id,Role,IndexStatus,path,ColumnNo,ColumnUrlClient,ColumnName from ColumnList where parentid=" + id + " order by ColumnNo desc,id asc");
        DataView dv = ds.Tables[0].DefaultView;
        foreach (DataRowView drv in dv)
        {
            if (drv["ColumnType"].ToString() == "最终页面")
            {
                strLink = "<a href='About.aspx?Classid=" + drv["id"].ToString() + "'>点击发布内容</a>";
            }
            else if (drv["ColumnType"].ToString() == "联系方式")
            {
                strLink = "<a href='WebSiteSet.aspx'>点击发布内容</a>";
            }
            else if (drv["ColumnType"].ToString() == "新闻列表" || drv["ColumnType"].ToString() == "图片列表" || drv["ColumnType"].ToString() == "图片相册" || drv["ColumnType"].ToString() == "下载中心")
            {
                strLink = "<a href='News.aspx?Classid=" + drv["id"].ToString() + "&ColumnType=" + drv["ColumnType"].ToString() + "'>点击进入管理</a>";
            }
            else if (drv["ColumnType"].ToString() == "产品列表")
            {
                strLink = "<a href='ProClass.aspx'>点击进入管理</a>";
            }
            else if (drv["ColumnType"].ToString() == "在线留言")
            {
                strLink = "<a href='Message.aspx'>点击查看留言</a>";
            }
            else if (drv["ColumnType"].ToString() == "在线表单")
            {
                strLink = "<a href='SubmitList.aspx'>点击查看信息</a>";
            }
            else if (drv["ColumnType"].ToString() == "在线支付")
            {
                strLink = "<a href='PayMentInterface.aspx'>设置支付接口</a>";
            }
            else
            {
                strLink = "";
            }
            //形成表格
            litlist.Text += "<tr>";
            litlist.Text += "<td><label class=\"lyear-checkbox checkbox-primary\"><input type='checkbox' id='chk_" + drv["id"].ToString() + "' name='chk_" + drv["id"].ToString() + "' value='" + drv["id"].ToString() + "' /><span></span></label></td>";
            litlist.Text += "<td>" + drv["id"].ToString() + "</td>";
            litlist.Text += "<td>" + MakeFelgefu(count) + "<input type='text' id='txt_" + drv["id"].ToString() + "' name='txt_" + drv["id"].ToString() + "' value='" + drv["ColumnName"].ToString() + "'/>" + "</td>";
            litlist.Text += "<td>" + ChangeRole(Int32.Parse(drv["Role"].ToString())) + "</td>";
            litlist.Text += "<td>" + ChangeIndexStatus(Int32.Parse(drv["IndexStatus"].ToString())) + "</td>";
            litlist.Text += "<td>" + ChangePic(drv["path"].ToString()) + "</td>";
            litlist.Text += "<td><input type='text' name='paixu_" + drv["id"].ToString() + "' value='" + drv["ColumnNo"].ToString() + "' id='paixu_" + drv["id"].ToString() + "' style='width:30px;'/></td>";
            litlist.Text += "<td id='qzltype_" + drv["id"].ToString() + "'>" + drv["ColumnType"].ToString() + "</td>";
            litlist.Text += "<td><input type='text' id='txturl_" + drv["id"].ToString() + "' name='txturl_" + drv["id"].ToString() + "' value='" + drv["ColumnUrlClient"].ToString() + "' style='width:220px;' /></td>";
            litlist.Text += "<td>" + strLink + "</td>";
            litlist.Text += "<td><div class=\"btn-group\"><a class=\"btn btn-xs btn-default\" href=\"NewsClassEdit.aspx?id=" + drv["id"].ToString() + "\" title=\"编辑\" data-toggle=\"tooltip\"><i class=\"mdi mdi-pencil\"></i></a><a class=\"btn btn-xs btn-default\" target=\"_blank\" href=\"/" + drv["ColumnUrlClient"].ToString() + "\" title=\"查看\" data-toggle=\"tooltip\"><i class=\"mdi mdi-eye\"></i></a><a class=\"btn btn-xs btn-default\" href=\"NewsClassNameDel.aspx?id=" + drv["id"].ToString() + "\" title=\"删除\" data-toggle=\"tooltip\" onclick=\"javascript:return winconfirm();\"><i class=\"mdi mdi-window-close\"></i></a></div></td>";
                    
            litlist.Text += "</tr>";

            //形成下拉列表
            ListItem li = new ListItem(MakeFelgefu(count) + drv["ColumnName"].ToString(), drv["id"].ToString());

            //再次遍历
            MakeTr(drv["id"].ToString(), count + 2);
        }
    }
    /// <summary>
    /// Make分隔符
    /// </summary>
    /// <param name="count"></param>
    /// <returns></returns>
    private string MakeFelgefu(int count)
    {
        string Returnwords = string.Empty;
        if (count == 0)
        {
            Returnwords = "";
        }
        else
        {
            Returnwords = ("├ ").PadLeft(count, '　');
        }
        return Returnwords;
    }
    protected string ChangeRole(int Role)
    {
        string strResult = null;
        if (Role == 0) { strResult = "管理员级"; }
        else if (Role == 1) { strResult = "<font color='red'>系统默认</font>"; }
        return strResult;
    }
    protected string ChangePic(string path)
    {
        string strPath = null;

        if (string.IsNullOrEmpty(path))
        {
            strPath = "<a href='../upload/default.jpg' target='_blank'><img src='../upload/default.jpg' alt='无缩略图' style='height:30px;width:33px;'  /></a>";
        }
        else
        {
            if (!File.Exists(Server.MapPath("../" + path)))
            {
                strPath = "<a href='../" + path + "' target='_blank'><img src='../upload/zanwu.jpg' alt='无缩略图' style='height:30px;width:33px;'  /></a>";

            }
            else
            {
                if (path.ToLower().Contains(".jpg") || path.ToLower().Contains(".png") || path.ToLower().Contains(".gif"))
                {
                    strPath = "<a href='../" + path + "' target='_blank'><img src='../" + path + "' alt='有缩略图' style='height:28px;width:31px;border:1px solid #dadada;'  /></a>";
                }
                else
                {
                    strPath = "<a href='../" + path + "' target='_blank'><img src='../upload/fujian.jpg' alt='无缩略图' style='height:30px;width:33px;'  /></a>";
                }
            }
        }
        return strPath;
    }
    protected string ChangeIndexStatus(int IndexStatus)
    {
        string strResult = null;
        if (IndexStatus == 0) { strResult = "<font color='red'>是</font>"; }
        else if (IndexStatus == 1) { strResult = "否"; }
        return strResult;
    }
}

