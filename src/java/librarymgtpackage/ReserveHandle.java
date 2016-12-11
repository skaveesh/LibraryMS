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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Samintha
 */
@WebServlet(name = "ReserveHandle", urlPatterns = {"/ReserveHandle"})
public class ReserveHandle extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookID = Integer.parseInt(request.getParameter("bookid_rsrv"));
        HttpSession session = request.getSession(true);
        String sessionusername = session.getAttribute("username").toString();
        
        Member member = new Member();
        member.setUsername(sessionusername);
        member.getUserIDFromDB();
        member.setBookID(bookID);
        member.setReservationForUser();
        
        request.setAttribute("Status", member.getStatus());
        request.getRequestDispatcher("/UserDashboard.jsp").forward(request, response);
    }

}
