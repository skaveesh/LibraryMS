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
import org.json.JSONObject;

/**
 *
 * @author Samintha
 */
public class Book implements Serializable {

    Statement stmt;
    String error;
    List<Object> allData = new ArrayList<Object>();

    String title, author, publisher, category, isbn, edition;
    int id,available_copies,i=0;
    Object obj = new Object();

    public Book(){
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
    
    public void setObj(Object obj) {
        this.obj = obj;
    }

    public String getError() {
        return error;
    }

    public int getID() {
        this.id = ((DataFields)obj).id;
        return this.id;
    }
    
    public String getTitle() {
        this.title = ((DataFields)obj).title;
        return this.title;
    }

    public String getAuthor() {
        this.author = ((DataFields)obj).author;
        return this.author;
    }

    public String getPublisher() {
        this.publisher = ((DataFields)obj).publisher;
        return this.publisher;
    }

    public String getCategory() {
        this.category = ((DataFields)obj).category;
        return this.category;
    }

    public String getIsbn() {
        this.isbn = ((DataFields)obj).isbn;
        return this.isbn;
    }

    public String getEdition() {
        this.edition = ((DataFields)obj).edition;
        return this.edition;
    }

    public int getAvailable_copies() {
        this.available_copies = ((DataFields)obj).available_copies;
        return this.available_copies;
    }

    public List getDB_Data() {
        try {
            String query = "SELECT * FROM dbo.Books";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                DataFields dataFieldsObject = new DataFields(rs.getInt(1),
                        rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
                allData.add(i, dataFieldsObject);
                i++;
            }
        } catch (SQLException ex) {
            error = "<b>Contact Administrator :</b><br/>" + ex;
            System.out.println("Query is not working" + ex);

        } catch (Exception ex) {
            error = "<b>Contact Administrator :</b><br/>" + ex;
            System.out.println("Query is not working" + ex);
        }
        return allData;
    }
    
    public String getSingleRowDB_Data(int bookID){
        JSONObject json = new JSONObject();
        try {
            String query = "SELECT * FROM dbo.Books WHERE bookID='"+bookID+"'";
            ResultSet rs = stmt.executeQuery(query);
            
            while (rs.next()) {
                allData.add(rs.getInt(1));
                allData.add(rs.getString(2));
                allData.add(rs.getString(3));
                allData.add(rs.getString(4));
                allData.add(rs.getString(5));
                allData.add(rs.getString(6));
                allData.add(rs.getString(7));
                allData.add(rs.getInt(8));
                json.put("id", rs.getInt(1));
                json.put("title", rs.getString(2));
                json.put("author", rs.getString(3));
                json.put("publisher", rs.getString(4));
                json.put("category", rs.getString(5));
                json.put("isbn", rs.getString(6));
                json.put("edition", rs.getString(7));
                json.put("available_copies", rs.getInt(8));
                
            }
        } catch (SQLException ex) {
            error = "<b>Contact Administrator :</b><br/>" + ex;
            System.out.println("Query is not working" + ex);

        } catch (Exception ex) {
            error = "<b>Contact Administrator :</b><br/>" + ex;
            System.out.println("Query is not working" + ex);
        }
        return (json.toString());
    }

    public class DataFields {

        public String title, author, publisher, category, isbn, edition;
        public int id,available_copies;

        public DataFields(int id,String title, String author, String publisher, String category, String isbn, String edition, int available_copies) {
            this.id = id;
            this.title = title;
            this.author = author;
            this.publisher = publisher;
            this.category = category;
            this.isbn = isbn;
            this.edition = edition;
            this.available_copies = available_copies;
            System.out.println(id+" "+title + " " + author + " " + publisher + " " + category + " " + isbn + " " + edition+" "+available_copies);
        }
    }

}
