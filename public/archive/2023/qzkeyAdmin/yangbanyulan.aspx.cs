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
using System.Web.Services;

public partial class Manager_yangbanyulan : Basic.ManagerPage
{
    WebSite website = new WebSite();
    public string Column;
    public int num = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Column = Request["Column"];
        switch (Column)
        {
            case "News": num = 5; break;
            case "Pic": num = 3; break;
            case "DownLoad": num = 2; break;
            case "Contact": num = 3; break;
            case "Message": num = 3; break;
            case "Product": num = 4; break;
            case "Prodetail": num = 3; break;
        }
    }
    public string NumberToChinese(int number)
    {
        string res = string.Empty;
        string str = number.ToString();
        string schar = str.Substring(0, 1);
        switch (schar)
        {
            case "1":
                res = "一";
                break;
            case "2":
                res = "二";
                break;
            case "3":
                res = "三";
                break;
            case "4":
                res = "四";
                break;
            case "5":
                res = "五";
                break;
            case "6":
                res = "六";
                break;
            case "7":
                res = "七";
                break;
            case "8":
                res = "八";
                break;
            case "9":
                res = "九";
                break;
            default:
                res = "零";
                break;
        }
        if (str.Length > 1)
        {
            switch (str.Length)
            {
                case 2:
                case 6:
                    res += "十";
                    break;
                case 3:
                case 7:
                    res += "百";
                    break;
                case 4:
                    res += "千";
                    break;
                case 5:
                    res += "万";
                    break;
                default:
                    res += "";
                    break;
            }
            res += NumberToChinese(int.Parse(str.Substring(1, str.Length - 1)));
        }
        return res;
    }
}
