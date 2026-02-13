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

public partial class Manager_ProClassNameEdit : Basic.ManagerPage
{
    BasicPage bp = new BasicPage();
    int intID;
    string strPicPath = "";
    string filename;
    ProClass proclass = new ProClass();
    public string strContext = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        SystemTools system = new SystemTools();
        btnSave.Attributes.Add("onclick", "return checkNull()");
        intID = Int32.Parse(Request["ID"]);
        if (!IsPostBack)
        {
            LoadList();
            showNewsClassName();
        }
    }
    public string strImg = "";
    private void showNewsClassName()
    {
        SqlDataReader reader = proclass.GetSingleProClass(intID);
        if (reader.Read())
        {
            strContext = reader["ConText"].ToString();
            dropParentId.SelectedValue = reader["ParentId"].ToString();
            txtConText.Text = reader["ConText"].ToString();
            txtpaixu.Text = reader["paixu"].ToString();

            string neiron = reader["content"].ToString();

            //seo
            int len = neiron.Split('^').Length;
            if (len > 1)
            {
                content.Value = neiron.Split('^')[0];
                txtTitle.Text = neiron.Split('^')[1];
                txtDescription.Text = neiron.Split('^')[2];
                txtKeyWords.Text = neiron.Split('^')[3];
            }
            else
            {
                content.Value = reader["content"].ToString();
            }

            rblstate.SelectedValue = reader["state"].ToString();
            pic.Value = reader["path"].ToString();
            strImg = reader["path"].ToString();
            if (reader["path"].ToString() != "")//判断是否有图片
            {
                rblpic.Items[1].Selected = true;
            }
            else
            {
                rblpic.Items[0].Selected = true;
            }
        }
        reader.Close();
    }
    protected void btnSaveClick(object sender, EventArgs e)
    {
        if (Int32.Parse(dropParentId.SelectedValue) == intID)
        {
            Response.Redirect("Show_Error.aspx?message=操作失败，父级分类不能是当前分类！&url=ProClass.aspx");
        }
        else
        {
            bool sign = false;
            SqlDataReader dr = proclass.GetProClassSub(intID);
            DataTable dt = SystemTools.ConvertDataReaderToDataTable(dr);
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            int rowCount = ds.Tables[0].Rows.Count;

            for (int i = 0; i < rowCount; i++)
            {
                if (dropParentId.SelectedValue == ds.Tables[0].Rows[i]["id"].ToString())
                {
                    sign = true;
                    break;
                }
            }
            if (sign == true)
            {
                Response.Redirect("Show_Error.aspx?message=操作失败，父级分类不能是当前分类的子级分类!！&url=ProClass.aspx");
            }
            else
            {
                if (rblpic.Items[1].Selected == true)//如果需要上传索引图
                {
                    strPicPath = pic.Value;
                    upload();//图片上传到服务器
                }
                int intRowCount = proclass.UpdateSingleProClass(intID, Int32.Parse(txtpaixu.Text), Int32.Parse(dropParentId.SelectedValue), txtConText.Text, content.Value, strPicPath, Int32.Parse(rblstate.SelectedValue));
                string neirong = content.Value.Replace("^", "") + "^" + txtTitle.Text.Replace("^", "") + "^" + txtDescription.Text.Replace("^", "") + "^" + txtKeyWords.Text.Replace("^", "");
                bp.doExecute("update ProClass set content='" + neirong.Replace("'", "''") + "' where id=" + intID);

                if (intRowCount > 0)
                {
                    Response.Redirect("Show_Success.aspx?message=修改成功！&url=ProClass.aspx");
                }
            }
        }
    }
    public void upload()
    {
        if (fileup.PostedFile.ContentLength != 0)
        {

            if (fileup.PostedFile.ContentLength <= WebSet.ProClassFileLength * 1024)
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
                    String filepath = Path.Combine(Server.MapPath("../upload/img"), Path.GetFileName(filename + fileextension));
                    try
                    {
                        fileup.PostedFile.SaveAs(filepath);
                        strPicPath = "upload/img/" + filename + fileextension;
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>");
                        Response.Write("alert('" + ex.Message + "');");
                        Response.Write("</");
                        Response.Write("script>");
                    }
                }
                else
                {
                    Response.Write("<script>");
                    Response.Write("alert('文件类型错误');");
                    Response.Write("</");
                    Response.Write("script>");
                }
            }
            else
            {
                Response.Write("<script>");
                Response.Write("alert('文件大小不能超过" + WebSet.ProClassFileLength + "KB');");
                Response.Write("</");
                Response.Write("script>");
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
        DataSet ds = bp.SelectDataBase("ProClass", "select * from ProClass where parentid=" + id + " order by id asc");
        DataView dv = ds.Tables[0].DefaultView;
        foreach (DataRowView drv in dv)
        {

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
}

