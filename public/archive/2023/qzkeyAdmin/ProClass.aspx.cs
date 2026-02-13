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

public partial class Manager_ProClass : Basic.ManagerPage
{
    BasicPage bp = new BasicPage();
    ProClass proclass = new ProClass();
    string strAction;
    public int intCount = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        SystemTools tools = new SystemTools();
        strAction = Request["Action"];
        if (!IsPostBack)
        {
            DataSet ds = bp.SelectDataBase("ProClass", "select top 1 id from ProClass");
            intCount = ds.Tables[0].Rows.Count;
            LoadList();
            if (strAction == "Add")
            {
                pnlAdd.Visible = true;
                pnlList.Visible = false;
                btnSave.Attributes.Add("onclick", "return checkNull()");
            }
            else
            {
                pnlAdd.Visible = false;
                pnlList.Visible = true;
            }
        }
    }
    /// <summary>
    /// 加载整个分类表
    /// </summary>
    private void LoadList()
    {
        ListItem li = new ListItem("顶级分类", "0");
        dropParentId.Items.Add(li);
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
        string strUrl = null;
        DataSet ds = bp.SelectDataBase("ProClass", "select * from ProClass where parentid=" + id + " order by paixu desc, id asc");
        DataView dv = ds.Tables[0].DefaultView;
        foreach (DataRowView drv in dv)
        {
            strUrl = "Product.aspx?Classid=" + drv["id"].ToString();
            //形成表格
            string pid = drv["id"].ToString();
            litlist.Text += "<tr><td><label class=\"lyear-checkbox checkbox-primary\"><input type=\"checkbox\" id=\"chk_" + pid + "\" name=\"chk_" + pid + "\" value=\"" + pid + "\"><span></span></label></td><td>" + drv["id"].ToString() + "</td><td>" + MakeFelgefu(count) + drv["context"].ToString() + "</td><td>" + drv["paixu"].ToString() + "</td><td>"+ chkIstop(drv["state"].ToString()) + "</td><td>" + chkpath(drv["path"].ToString()) + "</td><td><a href='Product.aspx?Classid=" + drv["id"].ToString() + "'>浏览该分类商品</a></td>" + "<td><a class=\"btn btn-xs btn-default\" href=\"ProClassNameEdit.aspx?id=" + drv["id"].ToString() + "\" title=\"编辑\" data-toggle=\"tooltip\"><i class=\"mdi mdi-pencil\"></i></a><a class=\"btn btn-xs btn-default\" href=\"ProClassNameDel.aspx?id=" + drv["id"].ToString() + "\" title=\"删除\" data-toggle=\"tooltip\" onclick='javascript:return winconfirm();'><i class=\"mdi mdi-window-close\"></i></a></td></tr>";

            //形成下拉列表
            ListItem li = new ListItem(MakeFelgefu(count) + drv["context"].ToString(), drv["id"].ToString());
            dropParentId.Items.Add(li);

            //再次遍历
            MakeTr(drv["id"].ToString(), count + 1);
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
            Returnwords = ("├").PadLeft(count, '　');
        }
        return Returnwords;
    }

    protected void btnSaveClick(object sender, EventArgs e)
    {
        int intIdentity = proclass.AddSingleProClass(Int32.Parse(txtPaixu.Text), Int32.Parse(dropParentId.SelectedValue), txtContext.Text);

        if (intIdentity > 0)
        {
            Response.Redirect("Show_Success.aspx?message=添加成功！&url=ProClass.aspx");
        }
    }
    public string chkIstop(string state)
    {
        string strstate = null;
        if (state == "0") { strstate = "显示"; }
        else if (state == "1") { strstate = "隐藏"; }
        return strstate;
    }
    public string chkpath(string path)
    {
        string strstate = null;
        if (!string.IsNullOrEmpty(path))//判断是否有图片
        {
            strstate = "有";
        }
        else
        {
            strstate = "无";
        }
        return strstate;
    }
}

