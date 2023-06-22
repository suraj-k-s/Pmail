<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="Pmail.DBConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Officer</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <section class="main_content dashboard_part">
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
                                                    <h3 class="mb-0" >Table New Sub Office</h3>
                                                </div>
                                            </div>
                                            <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/SubOfficer.jsp">
                                                <div class="form-group">
                                                    <label for="txt_name">Name</label>
                                                    <input required="" type="text" placeholder="Enter your name" class="form-control"  id="txt_name" name="txt_name">

                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_contact">Contact</label>
                                                    <input required="" type="tel" placeholder="Enter Your number" size="20" maxlength="10" pattern="[7-9]{1}[0-9]{9}" class="form-control"  id="txt_contact" name="txt_contact">

                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_address">Address</label>
                                                    <textarea class="form-control"  placeholder="Enter Your address"name="txt_address"></textarea>

                                                </div>
                                                <div class="form-group">
                                                    <label for="sel_district">Select District</label>
                                                    <select required="" class="form-control" name="sel_district" id="sel_district" onchange="getPlace(this.value)">
                                                        <option value="" >Select</option>
                                                        <%                                                            String disQry = "select * from tbl_district";
                                                            ResultSet rs1 = con.selectCommand(disQry);
                                                            while (rs1.next()) {
                                                        %>
                                                        <option value="<%=rs1.getString("district_id")%>">
                                                            <%=rs1.getString("district_name")%>
                                                        </option>
                                                        <%
                                                            }

                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sel_place">Select Place</label>
                                                    <select required="" class="form-control" name="sel_place" id="sel_place">
                                                        <option value="" >Select</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="sel_district">Select Grade</label>
                                                    <select required="" class="form-control" name="sel_district" id="sel_district">
                                                        <option value="" >Select</option>
                                                        <%                                                            String selQry = "select * from tbl_grade";
                                                            ResultSet rs2 = con.selectCommand(selQry);
                                                            while (rs2.next()) {
                                                        %>
                                                        <option value="<%=rs2.getString("grade_id")%>">
                                                            <%=rs2.getString("grade_name")%>
                                                        </option>
                                                        <%
                                                            }

                                                        %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="file_photo">Photo</label>
                                                    <input required="" type="file" class="form-control"  id="file_photo" name="file_photo">

                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_email">Email</label>
                                                    <input required="" type="email" placeholder="Enter your email" class="form-control"  id="txt_email" name="txt_email">

                                                </div>
                                                <div class="form-group">
                                                    <label for="txt_password">Password</label>
                                                    <input required=""  type="password" class="form-control"  id="txt_password" name="txt_password">
                                                 

                                                </div>
                                                <div class="form-group" align="center">
                                                    <input type="submit" class="btn-dark" name="btn_save" style="width:100px; border-radius: 10px 5px " value="Save">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </body>
    <script src="../Assets/JQ/jQuery.js"></script>
    <script>
        function getPlace(did)
        {

            $.ajax({url: "../Assets/AjaxPages/AjaxPlace.jsp?id=" + did,
                success: function(result) {

                    $("#sel_place").html(result);
                }});
        }

    </script>
    <%@include file="Footer.jsp" %>
</html>
