<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Link.ascx.cs" Inherits="Link" %>
<%if (string.IsNullOrEmpty(Path))
  { 
%>
<div class="n_banner" style="background: url(/<%=mc.SelectPicByClassID(5) %>) center no-repeat; height: 280px;">
</div>
<%
    }
  else
  { 
%>
<div class="n_banner" style="background: url(/<%=Path %>) center no-repeat; height: 280px;">
</div>
<%
    } %>
