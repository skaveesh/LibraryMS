/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package librarymgtpackage;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Samintha
 */
public class Member implements Serializable{
    
    Statement stmt;
    String error, Status, id, firstname, lastname, address, contact, username, password, email;
    public Member(){
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getUsername() {
        return username;
    }

    public String getStatus() {
        return Status;
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
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public void insertUser(){
        try {
            String query = "INSERT INTO dbo.Users(FirstName,LastName,Address,Contact,username,password,email) values('"+firstname+"','"+lastname+"','"+address+"','"+contact+"','"+username+"','"+password+"','"+email+"')";
            System.out.println("quwery "+query);
            int i = stmt.executeUpdate(query);
            System.out.println("iiii "+i);
            Status = "Account Created Successfully";
        } catch (SQLException ex) {
            Status = "Contact Administrator : Account creating error";
            System.out.println("Query is not working" + ex);
        } catch (Exception ex) {
            Status = "Contact Administrator : Account creating error";
            System.out.println("Query is not working" + ex);
        }
    }
}
