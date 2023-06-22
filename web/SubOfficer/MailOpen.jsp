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
            <style>
                /* Style for the email conversation section */
                .email-conversation {
                    background-color: #F5F5F5;
                    padding: 20px;
                    border: 1px solid #D9D9D9;
                    border-radius: 5px;
                    font-size: 16px;
                    line-height: 1.5;
                    color: #333;
                }

                /* Style for the sender name */
                .email-conversation .sender-name {
                    font-weight: bold;
                    margin-bottom: 5px;
                }

                /* Style for the timestamp */
                .email-conversation .timestamp {
                    font-style: italic;
                    color: #999;
                    margin-bottom: 10px;
                }

                /* Style for the email body */
                .email-conversation .email-body {
                    margin-bottom: 10px;
                }
            </style>
        </head>

        <body>
            <!-- Header Starts -->
            <div class="header">
                <div class="header__left">
                    <span class="material-icons"> menu </span>
                    <img
                        src="https://i.pinimg.com/originals/ae/47/fa/ae47fa9a8fd263aa364018517020552d.png"
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
                <!-- Sidebar Ends -->

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
                        <div style="position: absolute;right: 0;">
                            <form method="post">
                                <input type="submit" name="btn_submit" value="Decrypt" id="btn_submit" style="border: none;
                                       padding: 10px;
                                       margin: 15px 20px 10px 20px;
                                       border-radius: 16px;
                                       color: white;
                                       background-color: black;">
                            </form>
                        </div>

                    </div>
                    <!-- Section Ends -->

                    <!-- Email List rows starts -->
                    <div class="emailList__list">
                        <!-- Email Row Starts -->
                    <%
                        String sel = "select * from tbl_mail where mail_id='" + request.getParameter("id") + "'";
                        ResultSet res = con.selectCommand(sel);
                        while (res.next()) {

                            String selQry = "select * from tbl_login where login_id='" + res.getString("mail_to") + "'";
                            ResultSet rs = con.selectCommand(selQry);
                            if (rs.next()) {


                    %>
                    <div class="email-conversation">
                        <div class="email">
                            <div class="sender-name"><%=rs.getString("login_email")%></div>
                            <div class="timestamp"><%=res.getString("mail_time")%></div>
                            <div class="email-body">
                                <%

                                    String keyString = rs.getString("keystring");
                                    String ivString = rs.getString("iv");
                                    String msg = res.getString("mail_body");

                                    if (request.getParameter("btn_submit") != null) {
                                %>
                                <script>
                                    var keyString = prompt("Enter Your Key String");
                                    var ivString = prompt("Enter Your IV STring");
                                    if (keyString != null && ivString != null) {
                                        var key = "<%=keyString%>";
                                        var iv = "<%=ivString%>";
                                        if (key === keyString)
                                        {
                                            if (iv === ivString)
                                            {
                                                document.writeln("<%=obj.decodeData(msg, keyString, ivString)%>");
                                            } else
                                            {
                                                alert('IV String Not Matched')
                                                document.writeln("<%=res.getString("mail_body")%>");
                                            }
                                        } else
                                        {
                                            alert('Key String Not Matched');
                                            document.writeln("<%=res.getString("mail_body")%>");
                                        }
                                    }
                                    else
                                    {
                                        alert('Keys Are not found');
                                        document.writeln("<%=res.getString("mail_body")%>");
                                    }


                                </script>
                                <%                        } else {
                                        out.println(res.getString("mail_body"));
                                    }

                                %>
                            </div>
                        </div>

                    </div>
                    <%      }
                        }%>


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