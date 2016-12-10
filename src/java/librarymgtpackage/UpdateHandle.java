/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package librarymgtpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Samintha
 */
@WebServlet(name = "UpdateHandle", urlPatterns = {"/UpdateHandle"})
public class UpdateHandle extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Book bookupdate = new Book();

        String booktitle = request.getParameter("booktitle");
        String bookauthor = request.getParameter("bookauthor");
        String bookpublisher = request.getParameter("bookpublisher");
        String bookcategory = request.getParameter("bookcategory");
        String bookisbn = request.getParameter("bookisbn");
        String bookedition = request.getParameter("bookedition");
        int bookcopies = Integer.parseInt(request.getParameter("bookcopies"));

        bookupdate.setTitle(booktitle);
        bookupdate.setAuthor(bookauthor);
        bookupdate.setPublisher(bookpublisher);
        bookupdate.setCategory(bookcategory);
        bookupdate.setIsbn(bookisbn);
        bookupdate.setEdition(bookedition);
        bookupdate.setAvailable_copies(bookcopies);

        bookupdate.UpdateBook();
        
        request.setAttribute("Status", bookupdate.getStatus());
        request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);
    }

}
