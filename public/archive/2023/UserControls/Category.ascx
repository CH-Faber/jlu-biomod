<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Category.ascx.cs" Inherits="Category" %>
<div class="left_01">
    <h2>
        <span>产品列表</span></h2>
    <%for (int i = 0; i < intCount; i++)
      {
          string Context = dst.Tables[0].Rows[i]["Context"].ToString();
          string Id = dst.Tables[0].Rows[i]["Id"].ToString();
    %>
    <dl>
        <dt>
            <a href="Product.aspx?TypeID=<%=Id %>" title="<%=Context%>">
                <%=Context%></a>
        </dt>
    </dl>
    <% 
        }
    %>
</div>
