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

public partial class _Default : System.Web.UI.Page
{
    public BasicPage bp = new BasicPage();
    public MyClass mc = new MyClass();
    public string strCssPath = null;
    //个性化结束
    protected void Page_Load(object sender, EventArgs e)
    {
        //通用开始(无须修改)
        SystemTools systemtools = new SystemTools();
        systemtools.showTimeLimit();//判断网站是否到期
        Common common = new Common();
        ClientSEO clientseo = common.showSEO();
        this.Title = clientseo.WebTitle;
        description.Attributes["content"] = clientseo.WebDescription;
        keywords.Attributes["content"] = clientseo.WebKeywords;
        //通用结束

        showPro();
        showNews3();
    }



    public DataTable dtblNews = new DataTable();
    public int intNews;
    public void showNews(int classid, int top)
    {
        dtblNews = bp.SelectDataBase("news", "select top " + top + " * from news where classid=" + classid + " and StaticPage<>2 order by paixu desc,istop desc,convert(varchar(100),putdate,23) desc,id desc").Tables[0];
        intNews = dtblNews.Rows.Count;
    }


    //产品展示
    public DataTable dtPro = new DataTable();
    public int intPro;
    private void showPro()
    {
        dtPro = bp.SelectDataBase("product", "select top 13 * from product where  StaticPage<>2 order by paixu desc,proid desc").Tables[0];
        intPro = dtPro.Rows.Count;
    }
    //产品分类
    public DataTable dtblNew3 = new DataTable();
    public int intNews3;
    private void showNews3()
    {
        dtblNew3 = bp.SelectDataBase("ProClass", "select * from ProClass where ParentId=0 and State=0 order by Paixu desc,Id asc").Tables[0];
        intNews3 = dtblNew3.Rows.Count;
    }


    public DataSet dstMenu69 = new DataSet();
    public int intMenu69;
    public void showMenu69(int ParentId)
    {
        dstMenu69 = bp.SelectDataBase("News", "select Id,ParentId,ColumnType,ColumnName,ColumnNo,Remarks,Path,ColumnUrlClient,ColumnStaticPage,StaticPage from ColumnList where ParentId=" + ParentId + "  order by ColumnNo desc,Id asc");
        intMenu69 = dstMenu69.Tables[0].Rows.Count;
    }

}

