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
using System.Net;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;
using basic;
using System.Security.Cryptography;

public partial class Manager_Getannout : System.Web.UI.Page
{
    basic.BasicPage bp = new basic.BasicPage();
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Net.HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://bg.console.admin.ty3w.net/aofficebackstage/ashx/announcement.aspx");
        request.Method = "GET";
        request.Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
        request.UserAgent = "   Mozilla/5.0 (Windows NT 6.1; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0";
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        //这个在Post的时候，一定要加上，如果服务器返回错误，他还会继续再去请求，不会使用之前的错误数据，做返回数据
        request.ServicePoint.Expect100Continue = false;
        Stream stream = response.GetResponseStream();
        StreamReader sr = new StreamReader(stream, Encoding.UTF8);//UTF-8
        string htmlContent = sr.ReadToEnd();
        Response.Write(htmlContent);
        Response.End();
    }

}

