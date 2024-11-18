<%@page import="pack1.userBean"%>
<%@page import="pack1.ViewProfileDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<%
    // Assuming you have a method to get user details from the database
    HttpSession sessio = request.getSession(false);
Integer userId = (Integer) session.getAttribute("username"); // Get user ID from session
	
   HttpSession session2 = request.getSession(false);
   userBean ub=(userBean) session.getAttribute("userProfile");
    Integer userName = ub.getAccountId() ;
    String userEmail =  ub.getEmail();
    String userProfilePic = ub.getProfilePicture(); // URL or path to the profile picture

    // Database connection and fetching user details (pseudo-code)
    // Connection conn = DriverManager.getConnection(...);
    // PreparedStatement stmt = conn.prepareStatement("SELECT name, email, profile_pic FROM users WHERE id = ?");
    // stmt.setString(1, userId);
    // ResultSet rs = stmt.executeQuery();
    // if (rs.next()) {
    //     userName = rs.getString("name");
    //     userEmail = rs.getString("email");
    //     userProfilePic = rs.getString("profile_pic");
    // }
    // Close connections (pseudo-code)

%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <style type="text/css">
    
    	/* General Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
}

/* Edit Profile Container */
.edit-profile-container {
    max-width: 600px;
    margin: auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.edit-profile-container h2 {
    color: #333;
    text-align: center;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    color: #555;
}

.form-group input[type="text"],
.form-group input[type="email"],
.form-group input[type="file"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.profile-pic-preview {
    margin-top: 10px;
    max-width: 100px; /* Adjust as needed */
    border-radius: 5px;
}

.submit-btn {
    background-color: #007bff;
    color: #fff;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
}

.submit-btn:hover {
    background-color: #0056b3;
}
    
    
    </style>
</head>
<body>
    <div class="edit-profile-container">
        <h2>Edit Profile</h2>
        <form action="updateProfile.jsp" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= userName %>" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= userEmail %>" required>
            </div>
            <div class="form-group">
                <label for="profilePic">Profile Picture:</label>
                <input type="file" id="profilePic" name="profilePic">
                <img src="<%= userProfilePic %>" alt="Profile Picture" class="profile-pic-preview">
            </div>
            <div class="form-group">
                <button type="submit" class="submit-btn">Update Profile</button>
            </div>
        </form>
    </div>
</body>
</html>