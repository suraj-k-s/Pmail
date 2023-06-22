<%-- 
    Document   : Login
    Created on : 12 Dec, 2022, 5:09:01 PM
    Author     : _Its_Me_Sarath
--%>
<jsp:useBean class="Pmail.DBConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
        <link rel="stylesheet" href="Assets/Template/Login/style.css">
        <script src="Assets/Template/Login/script.js"></script>
    </head>
    <body>
        <%
            if (request.getParameter("btn_login") != null) {

                String email = request.getParameter("txt_email");
                String password = request.getParameter("txt_password");

                String selQry = "select * from tbl_login where login_email='" + email + "' and login_password='" + password + "'";
                ResultSet rs = con.selectCommand(selQry);

                if (rs.next()) {
                    if (rs.getString("login_type").equals("Admin")) {
                        session.setAttribute("aid", rs.getString("login_id"));
                        response.sendRedirect("Admin/HomePage.jsp");
                    }
                    else if (rs.getString("login_type").equals("HigherOfficer")) {
                        session.setAttribute("hid", rs.getString("login_id"));
                        response.sendRedirect("HigherOfficer/HomePage.jsp");
                    }
                    else if (rs.getString("login_type").equals("SubOfficer")) {
                        session.setAttribute("sid", rs.getString("login_id"));
                        response.sendRedirect("SubOfficer/HomePage.jsp");
                    }
                } else {
        %>
        <script>
            alert("Invalid Credentials");
            window.location = "";
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
               
                <form method="POST" autocomplete="off">
                    <div class="input-container">
                        <input type="text" required="required" name="txt_email" autocomplete="off"/>
                        <label for="">Email</label>
                        <div class="bar"></div>
                    </div>
                    <div class="input-container">
                        <input type="password" autocomplete="off" required="required" name="txt_password"/>
                        <label for="">Password</label>
                        <div class="bar"></div>
                    </div>
                    <div class="button-container">
                        <button type="submit" name="btn_login"><span>Login</span></button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
