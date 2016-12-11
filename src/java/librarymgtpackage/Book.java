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
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Samintha
 */
public class Book implements Serializable {

    Statement stmt;
    String error, searchCategory, searchKeyword, Status;
    List<Object> allData = new ArrayList<Object>();

    String title, author, publisher, category, isbn, edition;
    int id, available_copies, i = 0;
    Object obj = new Object();

    public Book() {
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
        this.id = ((DataFields) obj).id;
        return this.id;
    }

    public String getTitle() {
        this.title = ((DataFields) obj).title;
        return this.title;
    }

    public String getAuthor() {
        this.author = ((DataFields) obj).author;
        return this.author;
    }

    public String getPublisher() {
        this.publisher = ((DataFields) obj).publisher;
        return this.publisher;
    }

    public String getCategory() {
        this.category = ((DataFields) obj).category;
        return this.category;
    }

    public String getIsbn() {
        this.isbn = ((DataFields) obj).isbn;
        return this.isbn;
    }

    public String getEdition() {
        this.edition = ((DataFields) obj).edition;
        return this.edition;
    }

    public int getAvailable_copies() {
        this.available_copies = ((DataFields) obj).available_copies;
        return this.available_copies;
    }

    public String getStatus() {
        return Status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    public void setAvailable_copies(int available_copies) {
        this.available_copies = available_copies;
    }

    public void setSearchCategory(String searchCategory) {
        this.searchCategory = searchCategory;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
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

    public String getSingleRowDB_Data(int bookID) {
        JSONObject json = new JSONObject();
        try {
            String query = "SELECT * FROM dbo.Books WHERE bookID='" + bookID + "'";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
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

    public String getSingleReserveRowDB_Data(int bookID) {
        JSONObject json = new JSONObject();
        try {
            String query = "SELECT * FROM dbo.Books WHERE bookID='" + bookID + "' AND available_copies=0";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
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

    public void UpdateBook() {
        try {
            String query = "UPDATE dbo.Books "
                    + "SET title='" + title + "',author='" + author + "',publisher='" + publisher + "',category='" + category + "',edition='" + edition + "',available_copies='" + available_copies + "'"
                    + "WHERE isbn='" + isbn + "'";
            int s = stmt.executeUpdate(query);
            Status = s + " Record updated successfully";
        } catch (SQLException ex) {
            Status = "Contact Administrator : Record updating error";
            System.out.println("Query is not working" + ex);
        } catch (Exception ex) {
            Status = "Contact Administrator : Record updating error";
            System.out.println("Query is not working" + ex);
        }
    }

    public void InsertBook() {
        try {
            String query = "INSERT INTO dbo.Books(title,author,publisher,category,isbn,edition,available_copies) "
                    + "VALUES('" + title + "','" + author + "','" + publisher + "','" + category + "','" + isbn + "','" + edition + "','" + available_copies + "')";
            int s = stmt.executeUpdate(query);
            Status = s + " Record inserted successfully";
        } catch (SQLException ex) {
            Status = "Contact Administrator : Record inserting error";
            System.out.println("Query is not working" + ex);
        } catch (Exception ex) {
            Status = "Contact Administrator : Record inserting error";
            System.out.println("Query is not working" + ex);
        }
    }

    public void DeleteBook() {
        try {
            String query = "DELETE FROM dbo.Books WHERE bookID='" + id + "'";
            int s = stmt.executeUpdate(query);
            Status = s + " Record deleted successfully";
        } catch (SQLException ex) {
            Status = "Contact Administrator : Record deleting error";
            System.out.println("Query is not working" + ex);
        } catch (Exception ex) {
            Status = "Contact Administrator : Record deleting error";
            System.out.println("Query is not working" + ex);
        }
    }

    public String getSearch_Data() {
        JSONArray json_arr = new JSONArray();
        try {
            String query = "SELECT * FROM dbo.Books WHERE " + searchCategory + " LIKE '%" + searchKeyword + "%'";
            ResultSet rs = stmt.executeQuery(query);

            System.out.println("query " + query);
            while (rs.next()) {
                JSONObject sub_json = new JSONObject();
                sub_json.put("id", rs.getInt(1));
                sub_json.put("title", rs.getString(2));
                sub_json.put("author", rs.getString(3));
                sub_json.put("publisher", rs.getString(4));
                sub_json.put("category", rs.getString(5));
                sub_json.put("isbn", rs.getString(6));
                sub_json.put("edition", rs.getString(7));
                sub_json.put("available_copies", rs.getInt(8));
                json_arr.put(sub_json);
            }
        } catch (SQLException ex) {
            error = "<b>Contact Administrator :</b><br/>" + ex;
            System.out.println("Query is not working" + ex);

        } catch (Exception ex) {
            error = "<b>Contact Administrator :</b><br/>" + ex;
            System.out.println("Query is not working" + ex);
        }
        return (json_arr.toString());
    }

    //DataFields class
    public class DataFields {

        public String title, author, publisher, category, isbn, edition;
        public int id, available_copies;

        public DataFields(int id, String title, String author, String publisher, String category, String isbn, String edition, int available_copies) {
            this.id = id;
            this.title = title;
            this.author = author;
            this.publisher = publisher;
            this.category = category;
            this.isbn = isbn;
            this.edition = edition;
            this.available_copies = available_copies;
        }
    }

}
