<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BannerControl.ascx.cs"
    Inherits="BannerControl" %>
<%--ul版本--%>
    <ul>
        <% for (int i = 0; i < intPicListRowCount; i++)
           {
               string Url = dstPicList.Tables[0].Rows[i]["Url"].ToString();
               string Beizhu = dstPicList.Tables[0].Rows[i]["Beizhu"].ToString();
               string Path = dstPicList.Tables[0].Rows[i]["Path"].ToString();
        %>
        <li>
            <a href="<%=Url %>" target="_blank">
                <img alt="<%=Beizhu %>" src="/<%=Path %>" /></a></li>
        <%
            }
        %>
    </ul>




<%--div版本--%>
<% for (int i = 0; i < intPicListRowCount; i++)
           {
               string Url = dstPicList.Tables[0].Rows[i]["Url"].ToString();
               string Beizhu = dstPicList.Tables[0].Rows[i]["Beizhu"].ToString();
               string Path = dstPicList.Tables[0].Rows[i]["Path"].ToString();
        %>
<div><a href="<%=Url %>" target="_blank"><img alt="<%=Beizhu %>" src="/<%=Path %>" /></a></div>
<%
            }
        %>  