package pack1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Integer username = Integer.parseInt(req.getParameter("username"));
		String password = req.getParameter("password");
		LoginDAO ud=new LoginDAO();
		
			if (ud.checkCredentials(username,password)) {
				 HttpSession session = req.getSession();
		          session.setAttribute("username", username);
			    resp.sendRedirect("welcome.jsp"); // Redirect to welcome page on success
			} else {
			    resp.sendRedirect("index.html? error=Invalid credentials"); // Redirect back to login with error
			}
	
			
	}
}
