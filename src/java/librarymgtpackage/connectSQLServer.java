package librarymgtpackage;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.lang.Exception;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Samintha
 */
public class connectSQLServer implements java.io.Serializable{

    // Declare the JDBC objects.
    Connection con = null;
    Statement stmt = null;

    public void createConnection() {

        // Create a variable for the connection string.
        String connectionUrl = "jdbc:sqlserver://ASUS-X455LD\\MSSQL2014;databaseName=LibraryManagementSystem;";

        try {
            // Establish the connection.
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(connectionUrl, "LibraryUser", "1234");

            stmt = con.createStatement();

        } // Handle any errors that may have occurred.
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void closeConnection() {
        try {
            stmt.close();
            con.close();
        } catch (Exception e) {
        }

    }

    public boolean loginUser(String enteredUsername, String enteredPassword) {
        String usernameFromDB = null;
        String userpassFromDB = null;
        try {
            String SQL = "SELECT username,password FROM dbo.Users WHERE username = '"+enteredUsername+"'";
            ResultSet rs = null;
            rs = stmt.executeQuery(SQL);

            // Iterate through the data in the result set and display it.
            while (rs.next()) {
                usernameFromDB = rs.getString(1);
                userpassFromDB = rs.getString(2);
            }
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(connectSQLServer.class.getName()).log(Level.SEVERE, null, ex);
        }catch(Exception ex){
            ex.printStackTrace();
        }
        if (usernameFromDB.equals(enteredUsername) && userpassFromDB.equals(enteredPassword)) {
            return true;
        } else {
            return false;
        }
    }
}
