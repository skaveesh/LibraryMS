package librarymgtpackage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
@WebServlet(urlPatterns = {"/DeleteHandle"})
public class DeleteHandle extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Book bookdelete = new Book();
        bookdelete.setId(Integer.parseInt(request.getParameter("bookid_del")));
        bookdelete.DeleteBook();
        
        request.setAttribute("Status", bookdelete.getStatus());
        request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);
    }
}
