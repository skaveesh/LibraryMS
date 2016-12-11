/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package librarymgtpackage;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Samintha
 */
public class Member implements Serializable {

    Statement stmt;
    int id, bookID, reservation_bookID, i = 0;
    String error, Status, firstname, lastname, address, contact, username, password, email;
    List<Object> allData = new ArrayList<Object>();

    Object obj = new Object();

    public Member() {
        try {
            // Create a variable for the connection string.
            String connectionUrl = "jdbc:sqlserver://ASUS-X455LD\\MSSQL2014;databaseName=LibraryManagementSystem;";

            // Establish the connection.
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(connectionUrl, "LibraryUser", "1234");

            stmt = con.createStatement();
        } catch (SQLException ex) {
            error = "<b>Contact Administrator :</b><br/>" + ex;
            System.out.println("Connection is not working" + ex);

        } catch (Exception ex) {
            error = "<b>Contact Administrator :</b><br/>" + ex;
            System.out.println("Connection is not working" + ex);
        }
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public int getId() {
        this.id = ((DataFields) obj).id;
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getFirstname() {
        this.firstname = ((DataFields) obj).firstname;
        return this.firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        this.lastname = ((DataFields) obj).lastname;
        return this.lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getAddress() {
        this.address = ((DataFields) obj).address;
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        this.contact = ((DataFields) obj).contact;
        return this.contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getUsername() {
        this.username = ((DataFields) obj).username;
        return this.username;
    }

    public String getStatus() {
        return Status;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        this.email = ((DataFields) obj).email;
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getReservation_bookID() {
        this.reservation_bookID = ((DataFields) obj).reservation_book;
        return this.reservation_bookID;
    }

    public void setReservation_bookID(int reservation_bookID) {
        this.reservation_bookID = reservation_bookID;
    }

    public void insertUser() {
        try {
            String query = "INSERT INTO dbo.Users(FirstName,LastName,Address,Contact,username,password,email) values('" + firstname + "','" + lastname + "','" + address + "','" + contact + "','" + username + "','" + password + "','" + email + "')";

            int i = stmt.executeUpdate(query);
            System.out.println("iiii " + i);
            Status = "Account Created Successfully";
        } catch (SQLException ex) {
            Status = "Contact Administrator : Account creating error";
            System.out.println("Query is not working" + ex);
        } catch (Exception ex) {
            Status = "Contact Administrator : Account creating error";
            System.out.println("Query is not working" + ex);
        }
    }

    public void getUserIDFromDB() {
        try {
            String query = "SELECT TOP 1 ID FROM dbo.Users WHERE username='" + username + "'";

            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Status = "Contact Administrator : Account creating error";
            System.out.println("Query is not working" + ex);
        } catch (Exception ex) {
            Status = "Contact Administrator : Account creating error";
            System.out.println("Query is not working" + ex);
        }
    }

    public void setReservationForUser() {
        try {
            String query = "UPDATE dbo.Users SET reservation_book = '" + bookID + "' WHERE ID='" + id + "'";

            int i = stmt.executeUpdate(query);
            Status = "Book Reserved Successfully";
        } catch (SQLException ex) {
            Status = "Contact Administrator : Reservation error";
            System.out.println("Query is not working" + ex);
        } catch (Exception ex) {
            Status = "Contact Administrator : Reservation error";
            System.out.println("Query is not working" + ex);
        }
    }

    public List getDB_Data() {
        try {
            String query = "SELECT * FROM dbo.Users";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                if (!rs.getString(6).equals("admin")) { //admin record not added to members view
                    DataFields dataFieldsObject = new DataFields(rs.getInt(1),
                            rs.getString(2), rs.getString(3), rs.getString(4),
                            rs.getString(5), rs.getString(6), rs.getString(8), rs.getInt(9));
                    allData.add(i, dataFieldsObject);
                    i++;
                }
            }
            //System.out.println(id + firstname + lastname + address + contact + username + email + reservation_bookID);
        
        } catch (SQLException ex) {
            error = "<b>Contact Administrator :</b><br/>" + ex;
            System.out.println("Query is not working" + ex);

        } catch (Exception ex) {
            error = "<b>Contact Administrator :</b><br/>" + ex;
            System.out.println("Query is not working" + ex);
        }
        return allData;
    }

    //DataFields class
    public class DataFields {

        public String firstname, lastname, address, contact, username, email;
        public int id, reservation_book;

        public DataFields(int id, String firstname, String lastname, String address, String contact, String username, String email, int reservation_book) {
            this.id = id;
            this.firstname = firstname;
            this.lastname = lastname;
            this.address = address;
            this.contact = contact;
            this.username = username;
            this.email = email;
            this.reservation_book = reservation_book;
            }
        
    }
}
