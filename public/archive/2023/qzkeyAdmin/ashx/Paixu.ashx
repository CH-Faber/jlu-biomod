<%@ WebHandler Language="C#" Class="Paixu" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Data;
using System.Data.SqlClient;

public class Paixu : IHttpHandler, IRequiresSessionState
{
    WebApp.Components.SystemTools systemtools = new WebApp.Components.SystemTools();
    basic.BasicPage bp = new basic.BasicPage();
    protected Basic.Model.ManagerInfo admin_info;
    public void ProcessRequest(HttpContext context)
    {
        string strResult = null;
        string strxuhao = null;
        string strpaixu = null;
        string strColumnValue = null;
        string strColumnUrl = null;
        string strColumnType = null;
        string[] xuhao = null;
        string[] paixu = null;
        string[] ColumnValue = null;
        string[] ColumnUrl = null;
        string[] ColumnType = null;

        bool returnValue = false;
        returnValue = systemtools.StartProcessRequest();

        admin_info = new Basic.ManagerPage().GetAdminInfo();
        if (admin_info != null)
        {
            if (returnValue == true)
            {
                strxuhao = context.Request["xuhao"];
                strpaixu = context.Request["paixu"];
                strColumnValue = context.Request["columnValue"];
                strColumnType = context.Request["ColumnType"];
                strColumnUrl = context.Request["ColumnUrl"];
                xuhao = strxuhao.Substring(1, strxuhao.Length - 1).Split(',');
                paixu = strpaixu.Substring(1, strpaixu.Length - 1).Split(',');
                ColumnValue = strColumnValue.Substring(1, strColumnValue.Length - 1).Split(',');
                ColumnType = strColumnType.Substring(1, strColumnType.Length - 1).Split(',');
                ColumnUrl = strColumnUrl.Substring(1, strColumnUrl.Length - 1).Split(',');
                for (int i = 0; i < xuhao.Length; i++)
                {
                    string ColumnTypeNew = ColumnType[i].ToString();
                    int Columnid = Int32.Parse(xuhao[i].ToString());
                    SqlDataReader myread = bp.getRead("select ColumnType from ColumnList where id=" + Columnid);
                    if (myread.Read())
                    {
                        string strurl = ColumnUrl[i].ToString();
                        if (string.IsNullOrEmpty(strurl))
                        {
                            strurl = showUrl(ColumnTypeNew, Columnid);
                        }
                        bp.doExecute("update ColumnList set ColumnType='" + ColumnTypeNew + "',ColumnName='" + ColumnValue[i].ToString() + "',ColumnNo=" + Int32.Parse(paixu[i].ToString()) + ",ColumnUrlClient='" + strurl + "' where ID=" + Columnid);
                    }
                    myread.Close();
                }
                strResult = "success";
            }
            else
            {
                strResult = "failure";
            }
        }
        else
        {
            strResult = "Disconnect";
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write(strResult);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    protected string showUrl(string strColumnType, int intID)
    {
        string strColumnUrlClient = null;
        if (strColumnType == "最终页面")
        {
            strColumnUrlClient = "About.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "联系方式")
        {
            strColumnUrlClient = "Contact.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "新闻列表")
        {
            strColumnUrlClient = "News.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "下载中心")
        {
            strColumnUrlClient = "Download.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "二级分类")
        {
            strColumnUrlClient = "NewsClass.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "图片相册")
        {
            strColumnUrlClient = "Photo.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "图片列表")
        {
            strColumnUrlClient = "PicList.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "产品列表")
        {
            strColumnUrlClient = "Product.aspx";
        }
        else if (strColumnType == "在线留言")
        {
            strColumnUrlClient = "Message.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "在线表单")
        {
            strColumnUrlClient = "SubmitForm.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "在线支付")
        {
            strColumnUrlClient = "Pay.aspx?ClassID=" + intID;
        }
        else if (strColumnType == "一级分类")
        {
            strColumnUrlClient = "#";
        }
        else if (strColumnType == "网站首页")
        {
            strColumnUrlClient = "Default.aspx";
        }
        return strColumnUrlClient;
    }
}
