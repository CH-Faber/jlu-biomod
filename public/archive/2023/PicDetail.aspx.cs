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

public partial class PicDetail : System.Web.UI.Page
{
    public int intID;
    public int intClassID;
    public MyClass mc = new MyClass();
    public string strTitle = null;//标题
    public string strPath = null;
    public string strVideoUrl = null;

    public string strParentColumnName = null;
    public string strParentColumnSubName = null;
    public string strColumnName = null;
    public string strContent = null;
    public string strColumnSubName = null;

    public int intPrevious;
    public int intNext;
    public string strPrevious = "没有了";
    public string strNext = "没有了";
    protected void Page_Load(object sender, EventArgs e)
    {
        SystemTools systemtools = new SystemTools();
        if (systemtools.IsNumberic(Request["ID"]))
        {
            intID = Int32.Parse(Request["ID"]);
            //调用类
            Common common = new Common();

            //读取整站SEO的设置信息
            ClientSEO clientseo = common.showSEO();
            this.Title = clientseo.WebTitle;
            description.Attributes["content"] = clientseo.WebDescription;
            keywords.Attributes["content"] = clientseo.WebKeywords;
            //根据ID显示内容
            showContent();

        }
        else
        {
            Response.Write("您的请求带有不合法的参数，谢谢合作！");
            Response.End();
        }
    }
    protected void showContent()
    {
        News news = new News();
        SqlDataReader reader = news.GetSingleNews(intID);
        if (reader.Read())
        {
            strTitle = reader["Title"].ToString();
            this.Title = strTitle + "-" + mc.ShowWebsiteKeyById(1, "CompanyName");

            lblTitle.Text = reader["Title"].ToString();
            //lblPutdate.Text = reader["Putdate"].ToString();
            lblContent.Text = reader["Content"].ToString();
            strContent = reader["Content"].ToString();
            strPath = reader["path"].ToString();
            strVideoUrl = reader["Fujian"].ToString();
            intClassID = Int32.Parse(reader["ClassId"].ToString());
        }
        reader.Close();

        showPreviousAndNext(intID, intClassID);

        Common common = new Common();
        //显示栏目名称
        ClientColumnName clientcolumnname = new ClientColumnName();
        clientcolumnname = common.showColumnName(intClassID);
        strColumnName = clientcolumnname.ColumnName;
        strColumnSubName = clientcolumnname.ColumnSubName;
        //显示父级栏目名称
        ClientParentColumnName clientparentcolumnname = new ClientParentColumnName();
        clientparentcolumnname = common.showParentColumnName(intClassID);
        strParentColumnName = clientparentcolumnname.ParentColumnName;
        strParentColumnSubName = clientparentcolumnname.ParentColumnSubName;
    }
    public void showPreviousAndNext(int ID, int ClassID)
    {
        News news = new News();
        SqlDataReader reader = news.GetNews(ClassID);
        DataTable dtbl = SystemTools.ConvertDataReaderToDataTable(reader);
        DataSet dstNews = new DataSet();
        dstNews.Tables.Add(dtbl);

        intPrevious = ID;
        intNext = ID;
        for (int i = 0; i < dstNews.Tables[0].Rows.Count; i++)
        {
            if (intID == Int32.Parse(dstNews.Tables[0].Rows[i]["Id"].ToString()))
            {
                if (i >= 1)
                {
                    intNext = Int32.Parse(dstNews.Tables[0].Rows[i - 1]["Id"].ToString());
                    strNext = dstNews.Tables[0].Rows[i - 1]["Title"].ToString();
                }
                if (i < dstNews.Tables[0].Rows.Count - 1)
                {
                    intPrevious = Int32.Parse(dstNews.Tables[0].Rows[i + 1]["Id"].ToString());
                    strPrevious = dstNews.Tables[0].Rows[i + 1]["Title"].ToString();
                }
            }
        }
    }
}

