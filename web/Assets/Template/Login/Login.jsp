<%-- 
    Document   : Login
    Created on : 12 Dec, 2022, 5:09:01 PM
    Author     : _Its_Me_Sarath
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
    </head>
    <body>
        <%
            if(request.getParameter("btnsave")!=null) 
            {
                String sela="select * from tbl_admin where admin_email='"+request.getParameter("txt_uname")+"' and admin_password='"+request.getParameter("txt_p")+"'";
                ResultSet admin=con.selectCommand(sela);
                
                String selh="select * from tbl_hofficer where hofficer_email='"+request.getParameter("txt_uname")+"' and hofficer_password='"+request.getParameter("txt_p")+"'";
                ResultSet hof=con.selectCommand(selh);
                
                
                if(admin.next())
                {
                    session.setAttribute("aid", admin.getString("admin_id"));
                    session.setAttribute("aname", admin.getString("admin_name"));
                    response.sendRedirect("../../Admin/HomePage.jsp");
                }
                else if(hof.next())
                {
                     session.setAttribute("hid", hof.getString("hofficer_id"));
                    session.setAttribute("hname", hof.getString("hofficer_name"));
                    response.sendRedirect("../../HighOfficer/Home.jsp");
                }
                else
                {
                    %>
                    <script>
                        alert("Invalid Credentials");
                        </script>
                    <%
                }
            }
        %>
        <div class="container">
      <div></div>
      <br><br><br><br>
      <div class="card">
        <h1 class="title">Login</h1>
        <form method="POST">
          <div class="input-container">
              <input type="email" required="required" name="txt_uname" autocomplete="off"/>
            <label for="">Email</label>
            <div class="bar"></div>
          </div>
          <div class="input-container">
              <input type="password" autocomplete="off" required="required" name="txt_p"/>
            <label for="">Password</label>
            <div class="bar"></div>
          </div>
          <div class="button-container">
              <button type="submit" name="btnsave"><span>Go</span></button>
          </div>
        </form>
      </div>
    </div>
    </body>
</html>
