<%@ WebHandler Language="C#" Class="FileHandler" %>

using System;
using System.Web;
using basic;
using WebApp.Components;

public class FileHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");


        context.Response.ContentType = "text/plain";
        string msg = string.Empty;
        string error = string.Empty;
        string result = string.Empty;
        string filePath = string.Empty;
        string fileNewName = string.Empty;
        string name = string.Empty;
        //这里只能用<input type="file" />才能有效果,因为服务器控件是HttpInputFile类型
        HttpFileCollection files = context.Request.Files;
        if (files.Count > 0)
        {
            for (int i = 0; i < files.Count; i++)
            {
                if (files[i].ContentLength <= WebSet.ProductFileLength * 1024)
                {
                    //设置文件名
                    fileNewName = "Upload/" + DateTime.Now.ToString("yyyyMMddHHmmssff") + "_" + new Random().Next(1000, 9999).ToString() + i.ToString() + System.IO.Path.GetExtension(files[i].FileName).ToLower();
                    //保存文件
                    files[i].SaveAs(context.Server.MapPath("~/" + fileNewName));
                    if (name == "" || name == null)
                    {
                        name = fileNewName;
                    }
                    else
                    {
                        name += "|" + fileNewName;
                    }
                }
                else
                {
                    if (name == "" || name == null)
                    {
                        name = "文件过大";
                    }
                    else
                    {
                        name += "|文件过大";
                    }
                }
            }
            msg = "文件上传成功！" + files.Count;
            result = "{msg:'" + msg + "',filenewname:'" + name + "'}";
        }
        else
        {
            error = "文件上传失败！"+files.Count;
            result = "{ error:'" + error + "'}";
        }
        context.Response.Write(result);
        context.Response.End();
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}