package Pmail;
import java.sql.*;

public class DBConnectionClass {
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    public DBConnectionClass() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_pmail", "root","root");

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }



    public boolean executeCommand(String str) {
        boolean bol = false;
        try {

            st = con.createStatement();
            st.executeUpdate(str);
            bol = true;

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return bol;
    }


    public ResultSet selectCommand(String selQry) {
        try {
            st = con.createStatement();
            rs = st.executeQuery(selQry);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rs;
    }
}



