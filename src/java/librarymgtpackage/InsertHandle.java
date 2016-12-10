/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package librarymgtpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Samintha
 */
@WebServlet(name = "InsertHandle", urlPatterns = {"/InsertHandle"})
public class InsertHandle extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Book bookinsert = new Book();

        String booktitle = request.getParameter("booktitle_ins");
        String bookauthor = request.getParameter("bookauthor_ins");
        String bookpublisher = request.getParameter("bookpublisher_ins");
        String bookcategory = request.getParameter("bookcategory_ins");
        String bookisbn = request.getParameter("bookisbn_ins");
        String bookedition = request.getParameter("bookedition_ins");
        int bookcopies = Integer.parseInt(request.getParameter("bookcopies_ins"));
        
        bookinsert.setTitle(booktitle);
        bookinsert.setAuthor(bookauthor);
        bookinsert.setPublisher(bookpublisher);
        bookinsert.setCategory(bookcategory);
        bookinsert.setIsbn(bookisbn);
        bookinsert.setEdition(bookedition);
        bookinsert.setAvailable_copies(bookcopies);
        
        bookinsert.InsertBook();
        
        request.setAttribute("Status", bookinsert.getStatus());
        request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);
    }
}
