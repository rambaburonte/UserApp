package pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
    	userBean ub = new userBean();
        ub.setAccountId(Integer.parseInt(request.getParameter("accountId")));
        ub.setUserFirstName(request.getParameter("userFirstName"));
        ub.setUserLastName(  request.getParameter("userLastName"));
        ub.setPassword(    request.getParameter("password"));
        ub.setEmail(   request.getParameter("email"));
        ub.setProfilePicture(request.getParameter("profilePicture"));
        ub.setCoverPicture(request.getParameter("coverPicture"));
        ub.setBioData(request.getParameter("bioData"));

      UserRegistrationDAO ud=new UserRegistrationDAO();
        boolean isRegistered = ud.registerUser(ub);

        if (isRegistered) {
      
            response.sendRedirect("registrationSuccess.jsp");
        } else {
        
            response.sendRedirect("register.html?error=Registration failed");
        }
    }

 
   

}