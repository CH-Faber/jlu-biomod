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
using System.Collections.Generic;

public partial class Manager_AdminManage : Basic.ManagerPage
{
    Admin admin = new Admin();
    int rowCount = 0;//用来记录总记录数
    string strAction = null;
    int intID;
    DataSet dst = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSave.Attributes.Add("onclick", "return checkNull()");
        strAction = Request.QueryString["Action"];
        if (strAction == null)
        {
            if (!IsPostBack)
            {
                pnlList.Visible = true;
                pnlEdit.Visible = false;
                //绑定数据
                GridViewFill();
            }
        }
        else if (strAction == "View")
        {
            if (!IsPostBack)
            {
                SystemTools SystemTools = new SystemTools();
                txtAdminPassword.Text = Getpas();
                txtAdminPassword2.Text = txtAdminPassword.Text;
            }
            pnlList.Visible = false;
            pnlEdit.Visible = true;
            if (Request["ID"] != null)
            {
                intID = Convert.ToInt16(Request["ID"]);
                if (!IsPostBack)
                {
                    if (intID > 0)
                    {
                        txtAdminName.Enabled = false;
                        showContent();
                    }
                }
            }
        }

    }
    private void GridViewFill()
    {
        SqlDataReader dr = admin.GetAdmin();
        DataTable dt = SystemTools.ConvertDataReaderToDataTable(dr);
        dst.Tables.Add(dt);
        rowCount = dst.Tables[0].Rows.Count;
        if (rowCount > 0)
        {
            this.gvList.DataSource = dst.Tables[0].DefaultView;
            this.gvList.DataBind();
        }
        else
        {
            pnlList.Visible = false;
            pnlShow.Visible = true;
        }
    }
    protected void gvList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int intRowCount = admin.DeleteSingleAdmin(Int32.Parse(gvList.DataKeys[e.RowIndex].Value.ToString()));
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?Message=删除成功！&Url=AdminManage.aspx");
        }
    }
    protected void NavigateToPage(object sender, CommandEventArgs e)
    {
        //控制转页
        switch (e.CommandArgument.ToString())
        {
            case "First":
                this.gvList.PageIndex = 0;
                break;
            case "Prev":
                if (this.gvList.PageIndex > 0)
                    this.gvList.PageIndex -= 1;
                break;
            case "Next":
                if (this.gvList.PageIndex < (this.gvList.PageCount - 1))
                    this.gvList.PageIndex += 1;
                break;
            case "Last":
                this.gvList.PageIndex = this.gvList.PageCount - 1;
                break;
            case "Go":
                try
                {
                    TextBox lblNewPageIndex = (TextBox)gvList.BottomPagerRow.Cells[0].FindControl("txtNewPageIndex");
                    this.gvList.PageIndex = Int32.Parse(lblNewPageIndex.Text) - 1;
                }
                catch
                {
                    this.gvList.PageIndex = 0;
                }
                break;
        }
        GridViewFill();
    }
    protected void GridView_DataBind(object sender, EventArgs e)
    {
        if (dst.Tables[0].Rows.Count > 0)
        {
            GridViewRow pagerRow = gvList.BottomPagerRow;
            //获取Label实例，显示页次信息
            Label lblCurrent = (Label)pagerRow.Cells[0].FindControl("lblPageCurrent");
            Label lblCount = (Label)pagerRow.Cells[0].FindControl("lblPageCount");
            Label lblRow = (Label)pagerRow.Cells[0].FindControl("lblPageRow");
            //获取按钮实例，为了控制其是否可用
            LinkButton btnFirstTem = (LinkButton)pagerRow.Cells[0].FindControl("btnFirst");
            LinkButton btnPrevTem = (LinkButton)pagerRow.Cells[0].FindControl("btnPrev");
            LinkButton btnNextTem = (LinkButton)pagerRow.Cells[0].FindControl("btnNext");
            LinkButton btnLastTem = (LinkButton)pagerRow.Cells[0].FindControl("btnLast");

            if (lblCurrent != null)
                lblCurrent.Text = (this.gvList.PageIndex + 1).ToString();
            if (lblCount != null)
                lblCount.Text = this.gvList.PageCount.ToString();
            if (lblRow != null)
                lblRow.Text = rowCount.ToString();

            if (this.gvList.PageIndex == 0)
            {
                btnFirstTem.Enabled = false;
                btnPrevTem.Enabled = false;
                //只有一页，所有分页按钮不可用
                if (this.gvList.PageCount == 1)
                {
                    btnNextTem.Enabled = false;
                    btnLastTem.Enabled = false;
                }
            }
            else if (this.gvList.PageIndex == (this.gvList.PageCount - 1))
            {
                btnNextTem.Enabled = false;
                btnLastTem.Enabled = false;
            }
        }
    }
    protected void showContent()
    {
        SqlDataReader reader = admin.GetSingleAdmin(intID);
        if (reader.Read())
        {
            txtAdminName.Text = reader["AdminName"].ToString();
            txtAdminPassword.Text = reader["AdminPassword"].ToString();
            txtAdminPassword2.Text = reader["AdminPassword"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        string strAdminName = txtAdminName.Text.Trim();
        string strAdminPassword = txtAdminPassword.Text.Trim();
        if (intID == 0)
        {
            int intIdentity = admin.AddSingleAdmin(strAdminName, strAdminPassword);
            if (intIdentity > 0)
            {
                Response.Redirect("Show_Success.aspx?message=添加成功！&url=AdminManage.aspx");
            }
            else
            {
                Response.Redirect("Show_Error.aspx?message=有相同的帐号已存在，添加失败！&url=AdminManage.aspx");
            }
        }
        else
        {
            int intRowCount = admin.UpdateSingleAdmin(intID, strAdminPassword);
            if (intRowCount > 0)
            {
                Response.Redirect("Show_Success.aspx?message=密码修改成功！&url=AdminManage.aspx");
            }
        }
    }
    public string ChangeRole(string Role)
    {
        string strRole = null;
        if (Role == "0") { strRole = "管理员"; }
        else if (Role == "1") { strRole = "超级管理员"; }
        return strRole;
    }
    public string Getpas()
    {
        string content = "";
        string[] a1 = { "a", "b", "c", "d", "e", "c", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" };
        string[] a2 = { "A", "B", "C", "D", "E", "C", "G", "H", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
        string[] a3 = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
        List<string> suijishu = new List<string>();
        for (int z = 0; z < 4; z++)
        {
            Random rd = new Random(Guid.NewGuid().GetHashCode());
            int i = rd.Next(0, 25);
            suijishu.Add(a1[i]);
        }
        for (int z = 0; z < 4; z++)
        {
            Random rdz = new Random(Guid.NewGuid().GetHashCode());
            int iz = rdz.Next(0, 24);
            suijishu.Add(a2[iz]);
        }
        for (int z = 0; z < 4; z++)
        {
            Random rdzz = new Random(Guid.NewGuid().GetHashCode());
            int izz = rdzz.Next(0, 8);
            suijishu.Add(a3[izz]);
        }
        Random ran = new Random(Guid.NewGuid().GetHashCode());
        int index = 0;
        string temp = "";
        for (int j = 0; j < suijishu.Count; j++)
        {
            index = ran.Next(0, suijishu.Count - 1);
            if(index!=j)
            {
                temp = suijishu[j];
                suijishu[j] = suijishu[index];
                suijishu[index] = temp;
            }
        }
        for (int j = 0; j < suijishu.Count; j++)
        {
            content += suijishu[j];
        }
        return content;
    }
}

