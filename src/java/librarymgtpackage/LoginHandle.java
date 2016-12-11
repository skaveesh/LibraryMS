/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package librarymgtpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Samintha
 */
@WebServlet(name = "LoginHandle", urlPatterns = {"/LoginHandle"})
public class LoginHandle extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        HttpSession session = request.getSession();
        session.removeAttribute("username");
        response.sendRedirect("login.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        MD5Converter md5 = new MD5Converter();

        connectSQLServer dbcon = new connectSQLServer();

        //creating a session
        HttpSession session = request.getSession();

        dbcon.createConnection();

        if (dbcon.loginUser(request.getParameter("username"), md5.md5(request.getParameter("password")))) {

            String uname = request.getParameter("username");
            if (uname.equals("admin")) {
                session.setAttribute("username", uname);
                response.sendRedirect("AdminDashboard.jsp");
            } else {
                session.setAttribute("username", uname);
                response.sendRedirect("UserDashboard.jsp");
            }
        } else {
            String s = "Login Failed Please Try Again!\n Invalid Username or Password. <a href=\"login.jsp\" >Go Back</a>";
            request.setAttribute("passedMessage", s);
            RequestDispatcher rd = request.getRequestDispatcher("/TemplateSite.jsp");
            rd.forward(request, response);
        }

        dbcon.closeConnection();
    }
}
