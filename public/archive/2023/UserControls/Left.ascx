<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Left.ascx.cs" Inherits="Left" %>
<%if (intColumnList == 0)
  {
%>
<h2>
    <strong>产品分类</strong></h2>
<div class="clear">
</div>
<ul>
    <%   
        //显示产品分类
        for (int i = 0; i < intCount; i++)
        {
            string Context = dst.Tables[0].Rows[i]["Context"].ToString();
            string Id = dst.Tables[0].Rows[i]["Id"].ToString();
    %>
    <li class="hmain_list">
        <a href="Product.aspx?TypeID=<%=Id %>" title="<%=Context%>">
            <%=Context%></a>
    </li>
    <%
        }%>
</ul>
<%
    }
  else //显示二级分类
  { 
%>
<h2>
    <strong>
        <%=strColumnName%></strong></h2>
<div class="clear">
</div>
<ul>
    <%for (int i = 0; i < intColumnList; i++)
      {
          string ColumnUrlClient = dsSubmenu.Tables[0].Rows[i]["ColumnUrlClient"].ToString();
          string ColumnName = dsSubmenu.Tables[0].Rows[i]["ColumnName"].ToString();
    %>
    <li class="hmain_list">
        <a href="<%=ColumnUrlClient%>" title="<%=ColumnName%>">
            <%=ColumnName%></a>
    </li>
    <%}%>
</ul>
<%
    }
%>
