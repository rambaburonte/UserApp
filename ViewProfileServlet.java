package pack1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/viewprofile")
public class ViewProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        HttpSession session = request.getSession();
        Integer accountId = (Integer) session.getAttribute("username");

        if (accountId == null) {
           
            response.sendRedirect("index.html");
            return;
        }

       
        ViewProfileDAO viewProfileDAO = new ViewProfileDAO();
        
        
        userBean userProfile = viewProfileDAO.getUserProfile(accountId);

        if (userProfile != null) {
        	HttpSession session2 = request.getSession();
        	session2.setAttribute("userProfile", userProfile);
            request.setAttribute("userProfile", userProfile);
          
            request.getRequestDispatcher("viewProfile.jsp").forward(request, response);
        } else {
         
            request.setAttribute("errorMessage","User  profile not found.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
