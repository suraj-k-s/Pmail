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
            System.out.println(val);
            if (con.executeCommand(val)) {

            }

        }
    %>
    <body>
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

                    <iframe style="border: none; border-radius: 15px; width: 100%; height: 653px ;" src = "OfficerList.jsp" ></iframe>


                    <!-- Email Row Ends -->
                </div>
                <!-- Email List rows Ends -->
            </div>
            <!-- Email List Ends -->
        </div>
        <div id="compose-modal" class="modal">
            <div class="modal-content">
                <span class="modal-close" id="modalClose">&times;</span>
                <form method="post">
                    <label for="to">To:</label>
                    <input type="text" id="to" name="to" required>
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
