package pack1;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/updateProfile")
@MultipartConfig
public class EditProfileServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userId = (String) session.getAttribute("userId"); // Get user ID from session

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        Part profilePicPart = request.getPart("profilePic"); // Get the uploaded file

        String profilePicPath = null;

        // Handle file upload
        if (profilePicPart != null && profilePicPart.getSize() > 0) {
            String fileName = profilePicPart.getSubmittedFileName();
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir(); // Create the directory if it doesn't exist
            }
            profilePicPath = uploadPath + File.separator + fileName;
            profilePicPart.write(profilePicPath); // Save the file
        }

        // Update user profile in the database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "UPDATE users SET name = ?, email = ?, profile_pic = ? WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, profilePicPath != null ? UPLOAD_DIR + "/" + profilePicPart.getSubmittedFileName() : null);
                stmt.setString(4, userId);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating profile: " + e.getMessage());
            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            return;
        }

        // Redirect to a success page or back to the profile page
        response.sendRedirect("profile.jsp"); // Change this to your profile page
    }
}