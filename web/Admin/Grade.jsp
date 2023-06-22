<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="Pmail.DBConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grade</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>

    <%        if (request.getParameter("btn_save") != null) {
            String insQry = "insert into tbl_grade(grade_name,grade_type)values('" + request.getParameter("txt_grade") + "','" + request.getParameter("txt_type") + "')";
            con.executeCommand(insQry);
            response.sendRedirect("Grade.jsp");
        }
        if (request.getParameter("del") != null) {
            String delQry = "delete from tbl_grade where grade_id='" + request.getParameter("del") + "'";
            con.executeCommand(delQry);
            response.sendRedirect("Grade.jsp");
        }
    %>
    <body>
        <section class="main_content dashboard_part">

            <!--/ menu  -->
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="QA_section">
                                <!--Form-->
                                <div class="white_box_tittle list_header">
                                    <div class="col-lg-12">
                                        <div class="white_box mb_30">
                                            <div class="box_header ">
                                                <div class="main-title">
                                                    <h3 class="mb-0" >Table Grade</h3>
                                                </div>
                                            </div>
                                            <form>
                                                <div class="form-group">
                                                    <label for="txt_grade">Grade Name</label>
                                                    <input required="" type="text" class="form-control" id="txt_grade" name="txt_grade">
                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_type">Grade Type</label>
                                                    <input required="" type="text" class="form-control" id="txt_type" name="txt_type" >
                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" style="width:100px; border-radius: 10px 5px " name="btn_save" value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="QA_table mb_30">
                                    <!-- table-responsive -->
                                    <table class="table lms_table_active">
                                        <thead>
                                            <tr style="background-color: #74CBF9">
                                                <td align="center" scope="col">Sl.No</td>
                                                <td align="center" scope="col">Grade</td>
                                                <td align="center" scope="col">Type</td>
                                                <td align="center" scope="col">Action</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i = 0;
                                                String selQry = "select * from tbl_grade";
                                                ResultSet rs = con.selectCommand(selQry);
                                                while (rs.next()) {

                                                    i++;

                                            %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td align="center"><%=rs.getString("grade_name")%></td>
                                                <td align="center"><%=rs.getString("grade_type")%></td>
                                                <td align="center"><a href="Grade.jsp?del=<%=rs.getString("grade_id")%>" class="status_btn">Delete</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                            </tr>
                                            <%                      }


                                            %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </body>
    <%@include file="Footer.jsp" %>
</html>
