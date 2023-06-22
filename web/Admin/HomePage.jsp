<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="Pmail.DBConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="SessionValidator.jsp" %>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <section class="main_content dashboard_part">
            <div class="main_content_iner ">
                <div class="container-fluid p-0">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="single_element">
                                <div class="quick_activity">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="quick_activity_wrap">
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/Template/Admin/img/icon/professor.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter">
                                                                <%                                                                String tsel = "select count(*) as c from tbl_higher_officer";
                                                                    ResultSet tc = con.selectCommand(tsel);
                                                                    if (tc.next()) {
                                                                        out.println(tc.getString("c"));
                                                                    }
                                                                %>
                                                            </span> </h3>
                                                        <p>Higher Officer</p>
                                                    </div>
                                                </div>
                                                <div class="single_quick_activity d-flex">
                                                    <div class="icon">
                                                        <img src="../Assets/Template/Admin/img/icon/Student.png" alt="">
                                                    </div>
                                                    <div class="count_content">
                                                        <h3><span class="counter"> 
                                                                <%
                                                                    String ssel = "select count(*) as c from tbl_sub_officer";
                                                                    ResultSet sc = con.selectCommand(ssel);
                                                                    if (sc.next()) {
                                                                        out.println(sc.getString("c"));
                                                                    }
                                                                %>
                                                            </span> </h3>
                                                        <p>Sub Officer</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-12">
                            <div class="white_box card_height_100">
                                <div class="box_header border_bottom_1px  ">
                                    <div class="main-title">
                                        <h3 class="mb_25">Higher Officer</h3>
                                    </div>
                                </div>
                                <div class="staf_list_wrapper sraf_active owl-carousel">


                                    <%
                                        String hQry = "select * from tbl_higher_officer h inner join tbl_district d on d.district_id=h.district_id ORDER BY RAND()";
                                        ResultSet h = con.selectCommand(hQry);
                                        while (h.next()) {

                                    %>


                                    <!-- single carousel  -->
                                    <div class="single_staf">
                                        <div class="staf_thumb">
                                            <img src="../Assets/Files/<%=h.getString("higher_officer_photo")%>" alt="">
                                        </div>
                                        <h4><%=h.getString("higher_officer_name")%></h4>
                                        <p><%=h.getString("district_name")%></p>
                                    </div>



                                    <%

                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12">
                            <div class="white_box card_height_100">
                                <div class="box_header border_bottom_1px  ">
                                    <div class="main-title">
                                        <h3 class="mb_25">Sub Officer</h3>
                                    </div>
                                </div>
                                <div class="staf_list_wrapper sraf_active owl-carousel">


                                    <%
                                        String sQry = "select * from tbl_sub_officer s inner join tbl_place p on p.place_id=s.place_id ORDER BY RAND()";
                                        ResultSet s = con.selectCommand(sQry);
                                        while (s.next()) {

                                    %>


                                    <!-- single carousel  -->
                                    <div class="single_staf">
                                        <div class="staf_thumb">
                                            <img src="../Assets/Files/<%=s.getString("sub_officer_photo")%>" alt="">
                                        </div>
                                        <h4><%=s.getString("sub_officer_name")%></h4>
                                        <p><%=s.getString("place_name")%></p>
                                    </div>



                                    <%

                                        }
                                    %>
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
