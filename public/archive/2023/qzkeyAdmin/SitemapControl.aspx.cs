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
using System.Net;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Xml;

public partial class Manager_SitemapControl : Basic.ManagerPage
{

    //读取不到端口，本地测试要换真是网址
    string strUrl = "http://" + HttpContext.Current.Request.Url.Host + "/";
    //读取链接
    string strMapPath = HttpContext.Current.Server.MapPath("/Upload/config/sitehref.txt");
    //生成网站地图文件
    string strReaded = HttpContext.Current.Server.MapPath("/sitemap.xml");

    BasicPage bp = new BasicPage();
    NewsClass NewsClass = new NewsClass();
    News News = new News();
    Products Products = new Products();
    protected void Page_Load(object sender, EventArgs e)
    {
        btnStaticPage.Attributes.Add("onclick", "return checkNull()");
        if (!IsPostBack)
        {

        }
    }
    //开始执行按钮
    protected void btnSaveStaticPage(object sender, EventArgs e)
    {
        try
        {
            //清空链接
            System.IO.File.WriteAllText(strMapPath, string.Empty);
            System.IO.File.WriteAllText(strReaded, string.Empty);

            #region 获取常用固定链接

            //新闻
            DataTable dtList = bp.SelectDataBase("News", "select id from  News where Classid in(select id from ColumnList where columntype='新闻列表')").Tables[0];
            int intList = dtList.Rows.Count;
            for (int i = 0; i < intList; i++)
            {
                string id = dtList.Rows[i]["id"].ToString();
                WriteLinks("newsdetail.aspx?id=" + id);
            }
            //产品
            DataTable dtListPro = bp.SelectDataBase("Product", "select ProId from  Product").Tables[0];
            int intListPro = dtListPro.Rows.Count;
            for (int i = 0; i < intListPro; i++)
            {
                string id = dtListPro.Rows[i]["ProId"].ToString();
                WriteLinks("prodetail.aspx?proid=" + id);
            }
            //图片列表
            DataTable dtListPic = bp.SelectDataBase("News", "select id from  News where Classid in(select id from ColumnList where columntype='图片列表')").Tables[0];
            int intListPic = dtListPic.Rows.Count;
            for (int i = 0; i < intListPic; i++)
            {
                string id = dtListPic.Rows[i]["id"].ToString();
                WriteLinks("picdetail.aspx?id=" + id);
            }
            //资料下载
            DataTable dtListDown = bp.SelectDataBase("News", "select id from  News where Classid in(select id from ColumnList where columntype='资料下载')").Tables[0];
            int intListDown = dtListDown.Rows.Count;
            for (int i = 0; i < intListDown; i++)
            {
                string id = dtListDown.Rows[i]["id"].ToString();
                WriteLinks("downloaddetail.aspx?id=" + id);
            }
            #endregion

            //获取首页链接
            WriteReadLinks("<?xml version=\"1.0\" encoding=\"UTF-8\"?><urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">");
            GetHref(strUrl);

            //获取二级页面链接
            GetLinks(strMapPath);

            //获取三级页面链接
            GetLinks(strMapPath);

            //获取4级页面链接
            GetLinks(strMapPath);

            //删除重复链接
            DelRepeat(strReaded);

            Response.Redirect("Show_Success.aspx?message=设置成功！&url=SitemapControl.aspx");
        }
        catch (Exception ex)
        {
            WriteReadLinks("</urlset>");
        }
        Response.Redirect("Show_Error.aspx?message=设置失败q！&url=SitemapControl.aspx");
    }

    #region 获取网页上超链接

    /// <summary>
    /// 获取超链接
    /// </summary>
    /// <param name="_url"></param>
    public void GetHref(string _url)
    {
        bool Checkread = true;
        try
        {

            String[] fileLines = System.IO.File.ReadAllLines(strReaded);
            int len = fileLines.Length;
            for (int i = 0; i < len; i++)
            {
                string con = fileLines[i].ToString();
                if (_url == con)
                {
                    Checkread = false;
                    break;
                }
            }
            if (Checkread)
            {
                WriteReadLinks("<url><loc>" + _url.Replace("&", "&amp;") + "</loc></url>");
                string _Href = @"href=['""]([\S]+?)['""]";
                System.Net.HttpWebRequest request = (HttpWebRequest)WebRequest.Create(_url);
                request.Method = "GET";
                request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
                request.UserAgent = "   Mozilla/5.0 (Windows NT 6.1; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0";
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                //这个在Post的时候，一定要加上，如果服务器返回错误，他还会继续再去请求，不会使用之前的错误数据，做返回数据
                request.ServicePoint.Expect100Continue = false;
                Stream stream = response.GetResponseStream();
                StreamReader sr = new StreamReader(stream, Encoding.GetEncoding("UTF-8"));//UTF-8
                string htmlContent = sr.ReadToEnd();
                //获取被采集的主要内容
                Regex regBody = new Regex(_Href, RegexOptions.IgnoreCase | RegexOptions.Singleline | RegexOptions.IgnorePatternWhitespace);
                MatchCollection mList = regBody.Matches(htmlContent);

                int Count = mList.Count;
                for (int i = 0; i < Count; i++)
                {
                    string Content = mList[i].ToString();
                    Content = Content.Replace("href=", "").Replace("\"", "").Replace("/", "").Replace("'", "").Trim().ToLower();

                    bool cResult = true;
                    string NoCon = "target,http,target,title=,upload,javascript,.css,mailto,tencent:message,qzkeyadmin,#,callto,tel:,sms:,sitemap";
                    string[] sArray = NoCon.Split(',');
                    foreach (string k in sArray)
                    {
                        if (Content.Contains(k.ToString()))
                        {
                            cResult = false;
                            break;
                        }
                    }
                    if (cResult)
                    {
                        WriteLinks(Content);
                    }
                }
            }

        }
        catch (Exception ex)
        {
            string exa = ex.ToString();
        }


    }
    #endregion

    #region 写入已经读取过的txt日志

    /// <summary>
    /// 写入已经读取过的xml日志
    /// </summary>
    /// <param name="readme"></param>
    public void WriteReadLinks(string readme)
    {
        StreamWriter dout = new StreamWriter(strReaded, true);
        dout.Write(readme);
        dout.Write(System.Environment.NewLine); //换行 
        dout.Close();
    }
    #endregion

    #region 写入txt日志

    /// <summary>
    /// 写入txt日志
    /// </summary>
    /// <param name="readme"></param>
    public void WriteLinks(string readme)
    {

        DelRepeat(strMapPath);

        StreamWriter dout = new StreamWriter(strMapPath, true);
        dout.Write(readme);
        dout.Write(System.Environment.NewLine); //换行 
        dout.Close();
    }
    #endregion

    #region 读取txt每行超链接，并获取改链接上所有的链接

    //读取每行链接
    private void GetLinks(string filePath)
    {
        String[] fileLines = System.IO.File.ReadAllLines(filePath);
        int len = fileLines.Length;
        for (int i = 0; i < len; i++)
        {
            string con = fileLines[i].ToString();
            GetHref(strUrl + con);
        }
    }
    #endregion

    #region 去除重复链接

    /// <summary>
    /// 去除重复链接
    /// </summary>
    /// <param name="filePath"></param>
    private static void DelRepeat(string filePath)
    {
        if (File.Exists(filePath))
        {
            List<string> list = new List<string>();
            // 打开文件时 一定要注意编码 也许你的那个文件并不是GBK编码的
            using (StreamReader sr = new StreamReader(filePath, Encoding.GetEncoding("UTF-8")))
            {
                while (!sr.EndOfStream) //读到结尾退出
                {
                    string temp = sr.ReadLine();

                    if (!list.Contains(temp))  //去除重复的行
                    {
                        list.Add(temp);
                    }

                }
                sr.Close();
            }
            //写回去,第二个参数 Append = false ，就是说覆盖原来的 
            using (StreamWriter sw = new StreamWriter(filePath, false, Encoding.GetEncoding("UTF-8")))
            {
                foreach (string line in list)
                {
                    sw.WriteLine(line);
                }
                sw.Close();
            }

        }

    }

    #endregion

}

