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
@WebServlet(name = "RequestAccountHandle", urlPatterns = {"/RequestAccountHandle"})
public class RequestAccountHandle extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MD5Converter md5 = new MD5Converter();
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = md5.md5(request.getParameter("password"));
        
        Member createMember = new Member();
        createMember.setFirstname(fname);
        createMember.setLastname(lname);
        createMember.setAddress(address);
        createMember.setContact(contact);
        createMember.setEmail(email);
        createMember.setUsername(username);
        createMember.setPassword(password);
        
        createMember.insertUser();
        
        request.setAttribute("passedMessage", createMember.getStatus());
        request.getRequestDispatcher("TemplateSite.jsp").forward(request, response);
    }
}
