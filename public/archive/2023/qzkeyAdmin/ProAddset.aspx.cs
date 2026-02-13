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
using System.IO;
using WebApp.Components;
using System.Text;

public partial class Manager_ProAdd : Basic.ManagerPage
{
    BasicPage bp = new BasicPage();
    Products products = new Products();
    public int rowCount;//用来记录总记录数
    string strAction;
    public int intID;
    public int intClassID;
    public string strClassID = null;
    public string strClassID2 = null;
    DataSet dst = new DataSet();
    string filename;
    string strPicPath = null;
    public string strList = null;
    string strUrl;//记录返回地址
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadList();//显示所有分类列表
        }
    }


    /// <summary>
    /// 加载整个分类表
    /// </summary>
    private void LoadList()
    {
        int MTcount = 0;//执行遍历的次数
        //开始迭代加载
        MakeTr("0", MTcount);
        StringBuilder strCss = new System.Text.StringBuilder();

        strList = strList + strCss.ToString();
    }
    /// <summary>
    /// 装配每一行
    /// </summary>
    /// <param name="id">上级ID</param>
    /// <param name="count">迭代次数</param>
    private void MakeTr(string id, int count)
    {
        DataSet ds = bp.SelectDataBase("ProClass", "select * from ProClass where parentid=" + id + " order by id asc");
        DataView dv = ds.Tables[0].DefaultView;
        foreach (DataRowView drv in dv)
        {
            if (id == "0")
            {
                strList = strList + "<div class=\"out_range_item\">";
            }
            //形成下拉列表
            strList = strList + "<label class=\"lyear-checkbox checkbox-inline checkbox-primary " + MakeFelgefu(count) + "\"><input date='" + id + "' class='ckbox' type='checkbox' style=\"cursor: pointer;\" name='box' id='box" + drv["id"].ToString() + "' value='" + drv["id"].ToString() + "'>" + Make(count) + "<span>" + drv["context"].ToString() + "</span></label>";
            //再次遍历
            MakeTr(drv["id"].ToString(), count + 1);
            if (id == "0")
            {
                strList = strList + "</div>";
            }
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
            Returnwords = "Pro";
        }
        else
        {
            Returnwords = "pro-ej";
        }
        return Returnwords;
    }
    /// <summary>
    /// Make分隔符
    /// </summary>
    /// <param name="count"></param>
    /// <returns></returns>
    private string Make(int count)
    {
        string Returnwords = string.Empty;
        if (count == 0)
        {
            Returnwords = "";
        }
        else
        {
            Returnwords = "├".PadLeft(count, '　');
        }
        return Returnwords;
    }
    public string chkIstop(string state)
    {
        string strstate = null;
        if (state == "0") { strstate = "普通"; }
        else if (state == "1") { strstate = "<font color='red'>置顶</font>"; }
        return strstate;
    }
}

