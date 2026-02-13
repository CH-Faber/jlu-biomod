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

public partial class Manager_GetApi : System.Web.UI.Page
{
    basic.BasicPage bp = new basic.BasicPage();
    string strAction = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        strAction = Request["Action"];
        string content = getapi();
            Response.Write(content);
            Response.End();
    }
    public string getapi()
    {
        int flag = 1;
        string liulantongji = "";
        SqlDataReader myread = bp.getRead("select * from tbGrab where title='流量统计'");
        if (myread.Read())
        {
            liulantongji = myread["Url"].ToString();
            flag = 0;
        }
        myread.Close();
        if (flag == 1|| strAction=="action")
        {
            try
            {
                string _url = "https://v6-open.51.la/open/trend/day";
                string accessKey = "hdBhflxyESRzMSwnphuA6bQ082OvixbD";
                string nonce = Getsuiji();
                string timestamp = GetTimeStamp();
                string strsign = "accessKey=" + accessKey + "&nonce=" + nonce + "&secretKey=KKeT8EkwxhVqUL2KWo5WAMFLWWvb2UC5&timestamp=" + timestamp;
                string sign = sha256Hex(strsign);
                string maskId = "JnfiwmfU1WcfKgrF";
                string startDay = DateTime.Now.AddDays(-10).ToString("yyyy-MM-dd");
                string endDay = DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd");
                //json参数
                string jsonParam = "{\"maskId\": \"" + maskId + "\",\"startDay\": \"" + startDay + "\",\"endDay\": \"" + endDay + "\",\"accessKey\": \"" + accessKey + "\",\"nonce\": \"" + nonce + "\",\"timestamp\": \"" + timestamp + "\",\"sign\": \"" + sign + "\"}";
                var request = (HttpWebRequest)WebRequest.Create(_url);
                request.Method = "POST";
                request.ContentType = "application/json;charset=UTF-8";
                byte[] byteData = Encoding.UTF8.GetBytes(jsonParam);
                int length = byteData.Length;
                request.ContentLength = length;
                Stream writer = request.GetRequestStream();
                writer.Write(byteData, 0, length);
                writer.Close();
                var response = (HttpWebResponse)request.GetResponse();
                var responseString = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding("utf-8")).ReadToEnd();
                Add(responseString.ToString());
                return responseString.ToString();
            }
            catch (Exception ex)
            {
                Add("{\"message\":\"失败\"}");
                return "{\"message\":\"失败\"}";
            }
        }
        else
        {
            return liulantongji;
        }

    }
    char[] constant ={
    '0','1','2','3','4','5','6','7','8','9',
    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
    };
    public string Getsuiji()
    {
        string suijistring = "";
        for (int i = 0; i < 4; i++)
        {
            Random rd = new Random();
            int shuzi = rd.Next(0, 62);
            suijistring += constant[shuzi];
        }
        return suijistring;
    }
    public static string GetTimeStamp()
    {
        TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
        string ret = string.Empty;
        ret = Convert.ToInt64(ts.TotalMilliseconds).ToString();
        return ret;
    }

    private static string sha256Hex(string strsign)
    {
        string signText = strsign;
        var bytes = Encoding.UTF8.GetBytes(signText);
        var hash = SHA256.Create().ComputeHash(bytes);
        var hex = BitConverter.ToString(hash).Replace("-", string.Empty);
        return hex.ToUpper();
    }
    public void Add(string content) {
        SqlDataReader myread = bp.getRead("select * from tbGrab where title='流量统计'");
        if (myread.Read())
        {
            int num = 0;
            if (bp.IsNumberic(myread["ClassID"].ToString()))
            {
                num = Int32.Parse(myread["ClassID"].ToString());
            }
            if (content.Contains("\"message\":\"成功\""))
            {
                num = num + 1;
            }
            bp.doExecute("update tbGrab set Url='" + content + "',Putdate='" + DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") + "',ClassID='" + num + "' where title='流量统计'");
        }
        else
        {
            bp.doExecute("insert into tbGrab(title,Url,ClassID,Putdate) values('流量统计','" + content + "','1','" + DateTime.Now.ToString() + "')");
        }
        myread.Close();
    }
}

