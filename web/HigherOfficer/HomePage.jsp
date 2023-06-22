<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="Pmail.DBConnectionClass" id="con"></jsp:useBean>
<jsp:useBean class="Pmail.DataSecurityClass" id="obj"></jsp:useBean>
    <html lang="en">
        <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <!-- Google Font Icons -->
            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
            <link rel="stylesheet" href="../Assets/Template/Main/styles.css" />
            <title>Pmail</title>
        </head>
    <%
        if (request.getParameter("btn_send") != null) {

            String from = session.getAttribute("hid").toString();
            String to = request.getParameter("to");
            String sub = request.getParameter("subject");
            String msg = request.getParameter("message");

            if (to.equals("")) {
                String getDistrict = "select * from tbl_higher_officer ho where login_id='" + from + "'";
                ResultSet rsDis = con.selectCommand(getDistrict);
                rsDis.next();
                String district = rsDis.getString("district_id");
                String selQrySO = "select * from tbl_sub_officer so inner join tbl_login l on l.login_id=so.login_id inner join tbl_place p on p.place_id=so.place_id where district_id='" + district + "'";
                ResultSet rsSO = con.selectCommand(selQrySO);
                while (rsSO.next()) {
                    String key = "", iv = "";
                    to = rsSO.getString("login_id");
                    key = rsSO.getString("keystring");
                    iv = rsSO.getString("iv");
                    msg = obj.encodeData(msg, key, iv);

                    String val = "INSERT INTO `tbl_mail`( `mail_from`, `mail_to`, `mail_time`, `mail_subject`, `mail_body`) "
                            + "VALUES ('" + from + "','" + to + "',curtime(),'" + sub + "','" + msg + "')";
                    if (con.executeCommand(val)) {

                    }
                }
            } else {
                String key = "", iv = "";

                String selQry = "select * from tbl_login where login_email='" + to + "'";
                ResultSet rs = con.selectCommand(selQry);
                if (rs.next()) {
                    to = rs.getString("login_id");
                    key = rs.getString("keystring");
                    iv = rs.getString("iv");
                }

                msg = obj.encodeData(msg, key, iv);

                String val = "INSERT INTO `tbl_mail`( `mail_from`, `mail_to`, `mail_time`, `mail_subject`, `mail_body`) "
                        + "VALUES ('" + from + "','" + to + "',curtime(),'" + sub + "','" + msg + "')";
                if (con.executeCommand(val)) {

                }
            }

        }
    %>
    <body onload="toggleDetect()">
        <!-- Header Starts -->
        <div class="header">
            <div class="header__left">
                <span class="material-icons"> menu </span>
                <img
                    src="../Assets/Template/OIP (1).jpeg"
                    alt=""
                    />
            </div>

            <div class="header__middle">
                <span class="material-icons"> search </span>
                <input type="text" placeholder="Search mail" />
                <span class="material-icons"> arrow_drop_down </span>
            </div>

            <div class="header__right">
                <span class="material-icons"> apps </span>
                <span class="material-icons"> notifications </span>
                <span class="material-icons"> account_circle </span>
            </div>
        </div>
        <!-- Header Ends -->

        <!-- Main Body Starts -->
        <div class="main__body">
            <!-- Sidebar Starts -->
            <div class="sidebar">
                <button class="sidebar__compose" id="compose-button"><span class="material-icons"> add </span>Compose</button>
                <a href="HomePage.jsp">
                    <div class="sidebarOption sidebarOption__active">
                        <span class="material-icons"> inbox </span>
                        <h3>Inbox</h3>
                    </div>
                </a>
                <a href="SentedMail.jsp">
                    <div class="sidebarOption">
                        <span class="material-icons"> near_me </span>
                        <h3>Sent</h3>
                    </div>
                </a>
                <a href="HigherOfficer.jsp">
                    <div class="sidebarOption">
                        <span class="material-icons"> note </span>
                        <h3>Higher Officer List</h3>
                    </div>
                </a>
                <a href="Officer.jsp">
                    <div class="sidebarOption">
                        <span class="material-icons"> note </span>
                        <h3>Officer List</h3>
                    </div>
                </a>
                <a href="Complaint.jsp">
                    <div class="sidebarOption">
                        <span class="material-icons"> note </span>
                        <h3>Complaint</h3>
                    </div>
                </a>
                <a href="Feedback.jsp">
                    <div class="sidebarOption">
                        <span class="material-icons"> note </span>
                        <h3>Feedback</h3>
                    </div>
                </a>

            </div>

            <!-- Email List Starts -->
            <div class="emailList">
                <!-- Settings Starts -->
                <div class="emailList__settings">
                    <div class="emailList__settingsLeft">
                        <input type="checkbox" />
                        <span class="material-icons"> arrow_drop_down </span>
                        <span class="material-icons"> redo </span>
                        <span class="material-icons"> more_vert </span>
                    </div>
                    <div class="emailList__settingsRight">
                        <span class="material-icons"> chevron_left </span>
                        <span class="material-icons"> chevron_right </span>
                        <span class="material-icons"> keyboard_hide </span>
                        <span class="material-icons"> settings </span>
                    </div>
                </div>
                <!-- Settings Ends -->

                <!-- Section Starts -->
                <div class="emailList__sections">
                    <div class="section section__selected">
                        <span class="material-icons"> inbox </span>
                        <h4>Primary</h4>
                    </div>

                    <div class="section">
                        <span class="material-icons"> people </span>
                        <h4>Social</h4>
                    </div>

                    <div class="section">
                        <span class="material-icons"> local_offer </span>
                        <h4>Promotions</h4>
                    </div>
                </div>
                <!-- Section Ends -->

                <!-- Email List rows starts -->
                <div class="emailList__list">
                    <!-- Email Row Starts -->


                    <%
                        String sel = "select * from tbl_mail where mail_to='" + session.getAttribute("hid") + "'";
                        System.out.println(session.getAttribute("hid"));
                        ResultSet res = con.selectCommand(sel);
                        while (res.next()) {
                            String selq = "select * from tbl_login  where login_id='" + res.getString("mail_from") + "'";
                            ResultSet r = con.selectCommand(selq);
                            if (r.next()) {
                    %>
                    <a href="MailOpen.jsp?id=<%=res.getString("mail_id")%>" style="color: black;text-decoration: none" >
                        <div class="emailRow">
                            <div class="emailRow__options">
                                <input type="checkbox" />
                                <span class="material-icons"> star_border </span>
                                <span class="material-icons"> label_important </span>
                            </div>
                            <h3 class="emailRow__title"><%=r.getString("login_email")%></h3>
                            <div class="emailRow__message">
                                <h4>
                                    <%=res.getString("mail_subject")%>
                                    <span class="emailRow__description"> - <%=res.getString("mail_body")%> </span>
                                </h4>
                            </div>
                            <p class="emailRow__time"><%=res.getString("mail_time")%></p>
                        </div>
                    </a>
                    <%
                            }

                        }


                    %>



                    <!-- Email Row Ends -->
                </div>
                <!-- Email List rows Ends -->
            </div>
            <!-- Email List Ends -->
        </div>
        <div id="compose-modal" class="modal">
            <div class="modal-content">
                <section id="model-59"> 
                    <div class="card">
                        <div class="toggle">
                            <input type="checkbox" id="check-59" onchange="toggleDetect()"/>
                            <label for="check-59"></label>
                        </div>
                    </div>
                </section>
                <span class="modal-close" id="modalClose">&times;</span>
                <form method="post">
                    <div id="hiddenTo">
                        <label for="to">To:</label>
                        <input type="text" id="to" name="to">
                    </div>
                    <label for="subject">Subject:</label>
                    <input type="text" id="subject" name="subject" required>
                    <textarea id="message" name="message" required></textarea>
                    <button type="submit" name="btn_send">Send</button>
                </form>
            </div>
        </div>


        <!-- Main Body Ends -->
    </body>'
    <scri src="../Assets/JQ/jQuery.js"></scri>

    <script>
        function toggleDetect() {
            var checkbox = document.getElementById("check-59");
            var detectProperty = document.getElementById("hiddenTo"); // Replace "some-element" with the ID of the element you want to toggle
            var textBOx = document.getElementById("to");
            if (checkbox.checked) {
                // Checked state
                textBOx.value = "";
                detectProperty.style.visibility = "hidden"; // Show the element
            } else {
                // Unchecked state
                detectProperty.style.visibility = ""; // Hide the element
            }
        }
    </script>
    <script>






        var modal = document.getElementById("compose-modal");
        var btn = document.getElementById("compose-button");
        var span = document.getElementById("modalClose");

        btn.onclick = function() {
            modal.style.display = "block";
        }

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }



    </script>
</html>
