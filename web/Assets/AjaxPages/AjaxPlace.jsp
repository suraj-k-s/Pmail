<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="Pmail.DBConnectionClass" id="con"></jsp:useBean>
    <option value="" >Select</option>
<%                                                            
    String disQry = "select * from tbl_place where district_id='"+request.getParameter("id")+"'";
    ResultSet rs1 = con.selectCommand(disQry);
    while (rs1.next()) {
%>
<option value="<%=rs1.getString("place_id")%>">
    <%=rs1.getString("place_name")%>
</option>
<%
    }

%>