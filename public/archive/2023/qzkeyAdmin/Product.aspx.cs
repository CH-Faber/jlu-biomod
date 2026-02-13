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

public partial class Manager_Product : Basic.ManagerPage
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
    public string keyci = "";
    public string keyciurl = "";
    public int page = 0;
    public string strpage = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        SystemTools systemtools = new SystemTools();
        btnSave.Attributes.Add("onclick", "return checkNull()");
        keyci = Request["keyci"];
        if (Request["ClassID"] != null && systemtools.IsNumberic(Request["ClassID"]) && Request["ClassID"]!="0")
        {
            intClassID = Convert.ToInt16(Request["ClassID"]);
            strClassID = "," + intClassID + ",";
            strUrl = "Product.aspx?ClassId=" + intClassID + "";
            if(!string.IsNullOrEmpty(keyci))
            {
                keyciurl = "&keyci=" + keyci;
                strUrl += keyciurl;
            }
        }
        else
        {
            strUrl = "Product.aspx";
            if (!string.IsNullOrEmpty(keyci))
            {
                keyciurl = "&keyci=" + keyci;
                strUrl += "?keyci=" + keyci;
            }
        }
        if (Request["Action"] != null)
        {
            strAction = Request["Action"];
        }
        if (Request["page"] != null && systemtools.IsNumberic(Request["page"]))
        {
            page = Int32.Parse(Request["page"]);
        }
        if (strUrl.Contains("?"))
        {
            strpage = "&page=" + page;
        }
        else
        {
            strpage = "?page=" + page;
        }
        if (strAction == "Add")
        {
            if (!IsPostBack)
            {
                LoadList();//显示所有分类列表
            }
            pnlList.Visible = false;
            pnlEdit.Visible = true;
            if (Request["ID"] != null && systemtools.IsNumberic(Request["ID"]))
            {
                intID = Convert.ToInt16(Request["ID"]);
                if (intID > 0)
                {
                    if (!IsPostBack)
                    {
                        showContent();
                    }
                }
            }
        }
        else
        {
            pnlList.Visible = true;
            pnlEdit.Visible = false;
            if (!IsPostBack)
            {
                this.gvList.PageIndex = page;
            }
            GridViewFill();
        }

    }

    private void GridViewFill()
    {
        string sql = " Proid>0 ";
        if (strClassID != null)
        {
            sql += " and ClassId like '%" +strClassID + "%'";
        }
        if(!string.IsNullOrEmpty(keyci))
        {
            keyci = keyci.Trim();
            sql += " and (ProName like '%" + keyci + "%' or ProBianhao like '%" + keyci + "%' or ProChandi like '%" + keyci + "%' or keywords like '%" + keyci + "%' or ProKeyDescription like '%" + keyci + "%')";
        }
        dst = new DataSet();
        dst = bp.SelectDataBase("Product", "select * from Product where "+ sql + " order by Paixu desc, ProId desc");
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
        int intRowCount = products.DeleteSingleProduct(Int32.Parse(gvList.DataKeys[e.RowIndex].Value.ToString()));
        if (intRowCount > 0)
        {
            Response.Redirect("Show_Success.aspx?message=删除成功！&url=" + Server.UrlEncode(strUrl + strpage) + "");
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
        page = this.gvList.PageIndex;
        if (strUrl.Contains("?"))
        {
            strpage = "&page=" + page;
        }
        else
        {
            strpage = "?page=" + page;
        }
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
    public string strqzlimg = "";
    protected void showContent()
    {
        SqlDataReader reader = products.GetSingleProduct(intID);
        if (reader.Read())
        {
            strClassID2 = reader["ClassId"].ToString();//分类列表
            txtPaixu.Text = reader["Paixu"].ToString();
            txtProName.Text = reader["ProName"].ToString();
            radlState.SelectedValue = reader["State"].ToString();
            txtProBianhao.Text = reader["ProBianhao"].ToString();
            txtProChandi.Text = reader["ProChandi"].ToString();
            txtProPrice.Text = reader["ProPrice"].ToString();
            txtKeywords.Text = reader["Keywords"].ToString();
            pic.Value = reader["ProPath"].ToString();
            strqzlimg = reader["ProPath"].ToString();
            fckProDescription.Value = reader["ProDescription"].ToString();
            fckProKeyDescription.Text = reader["ProKeyDescription"].ToString();
            Textarea1.Value = reader["Content1"].ToString();
            Textarea2.Value = reader["Content2"].ToString();
            hidfujian.Value = reader["Paths"].ToString();
        }
        reader.Close();
    }
    protected void btnSaveClick(object s, EventArgs e)
    {
        strPicPath = pic.Value;
        string strResult = upload();
        if (strResult == "success" || strResult == "no file")
        {
            string strClassIdList = null;
            strClassIdList = fenlei.Value;
            int intPaixu = Int32.Parse(txtPaixu.Text);
            string strProName = txtProName.Text;
            string strProBianhao = txtProBianhao.Text;
            string strProChandi = txtProChandi.Text;
            string strProPrice = txtProPrice.Text;
            string strKeywords = txtKeywords.Text;
            string strProKeyDescription = fckProKeyDescription.Text;
            string strProDescription = fckProDescription.Value;
            string strPutdate = DateTime.Now.ToString();

            int intState = Int32.Parse(radlState.SelectedValue); ;
            

            if (intID == 0)
            {
                int intIdentity = products.AddSingleProduct(strClassIdList, intPaixu, strProName, strProBianhao, strProChandi, strProPrice, strPicPath, strProKeyDescription, strProDescription, strKeywords, strPutdate, intState);
                if (intIdentity > 0)
                {
                    bp.doExecute("update Product set Paths='" + hidfujian.Value + "',Content1='" + Textarea1.Value + "',Content2='" + Textarea2.Value + "' where Proid=" + intIdentity);
                    Response.Redirect("Show_Success.aspx?message=添加成功！&url=" + Server.UrlEncode(strUrl + strpage) + "");
                }
            }
            else
            {
                int intRowCount = products.UpdateSingleProduct(intID, strClassIdList, intPaixu, strProName, strProBianhao, strProChandi, strProPrice, strPicPath, strProKeyDescription, strProDescription, strKeywords, intState);
                if (intRowCount > 0)
                {
                    bp.doExecute("update Product set Paths='" + hidfujian.Value + "',Content1='" + Textarea1.Value + "',Content2='" + Textarea2.Value + "' where Proid=" + intID);
                    Response.Redirect("Show_Success.aspx?message=修改成功！&url=" + Server.UrlEncode(strUrl + strpage) + "");
                }
            }
        }
        else
        {
            Response.Redirect("Show_Error.aspx?message=" + strResult + "&url=" + Server.UrlEncode(strUrl + strpage) + "");
        }
    }
    protected string upload()
    {
        string strResult = null;
        if (fileup.PostedFile.ContentLength != 0)
        {
            if (fileup.PostedFile.ContentLength <= WebSet.ProductFileLength * 1024)
            {
                Boolean fileok = false;
                filename = DateTime.Now.ToString("yyyyMMddHHmmss");
                String fileextension = System.IO.Path.GetExtension(fileup.PostedFile.FileName).ToLower();
                String[] allowedextensions = { ".jpg", ".png", ".gif" };
                for (int i = 0; i < allowedextensions.Length; i++)
                {
                    if (fileextension == allowedextensions[i])
                    {
                        fileok = true;
                        break;
                    }
                }
                if (fileok == true)
                {
                    String filepath = Path.Combine(Server.MapPath("../upload"), Path.GetFileName(filename + fileextension));

                    fileup.PostedFile.SaveAs(filepath);
                    strPicPath = "upload/" + filename + fileextension;
                    strResult = "success";
                }
                else
                {
                    strResult = "文件类型错误！正确格式为：jpg或png或gif";
                }
            }
            else
            {
                strResult = "文件大小不能超过" + WebSet.ProductFileLength + "KB！";
            }
        }
        else
        {
            strResult = "no file";
        }
        return strResult;
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
            strList = strList + "<label class=\"lyear-checkbox checkbox-inline checkbox-primary "+ MakeFelgefu(count) + "\"><input date='"+ id + "' class='ckbox' type='checkbox' style=\"cursor: pointer;\" name='box' id='box" + drv["id"].ToString() + "' value='" + drv["id"].ToString() + "'>"+ Make(count) + "<span>" + drv["context"].ToString() + "</span></label>";
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
        if (state == "0") { strstate = "否"; }
        else if (state == "1") { strstate = "<font color='red'>是</font>"; }
        return strstate;
    }

    public string chkPic(string path)
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
}

