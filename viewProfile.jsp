<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="pack1.*" %>
<html>
<head>
    <title>User Profile</title>
  
    <style>/* General Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
}

/* Profile Container */
.profile-container {
    max-width: 800px;
    margin: auto;
    padding: 20px;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* Profile Header */
.profile-header {
    text-align: center;
    margin-bottom: 20px;
}

.profile-header h2 {
    color: #333;
}

.profile-picture {
    border-radius: 50%;
    width: 150px; /* Adjust size as needed */
    height: 150px; /* Adjust size as needed */
}

/* Profile Information */
.profile-info {
    margin: 20px 0;
}

.profile-info p {
    margin: 5px 0;
    color: #555;
}

/* Cover Picture */
.cover-picture {
    max-width: 100%; /* Responsive */
    height: auto; /* Maintain aspect ratio */
    border-radius: 5px;
}

/* Profile Actions */
.profile-actions {
    text-align: center;
    margin-top: 20px;
}

.edit-profile-btn, .logout-btn {
    display: inline-block;
    margin: 5px;
    padding: 10px 15px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.edit-profile-btn:hover, .logout-btn:hover {
    background-color: #0056b3;
}</style>
</head>
<body>
    <div class="profile-container">
        <h1>User Profile</h1>
        <%
            userBean userProfile = (userBean) request.getAttribute("userProfile");
            if (userProfile != null) {
        %>
            <div class="profile-header">
                <img src="<%= userProfile.getProfilePicture() %>" alt="Profile Picture" class="profile-picture" />
                <h2><%= userProfile.getUserFirstName() %> <%= userProfile.getUserLastName() %></h2>
            </div>
            <div class="profile-info">
                <p><strong>Email:</strong> <%= userProfile.getEmail() %></p>
                <p><strong>Cover Picture:</strong> <img src="<%= userProfile.getCoverPicture() %>" alt="Cover Picture" class="cover-picture" /></p>
                <p><strong>Bio:</strong> <%= userProfile.getBioData() %></p>
            </div>
        <%
            } else {
        %>
            <p>No profile information available.</p>
        <%
            }
        %>
        <div class="profile-actions">
            <a href="editProfile.jsp" class="edit-profile-btn">Edit Profile</a>
            <a href="logout.jsp" class="logout-btn">Logout</a>
        </div>
    </div>
</body>
</html>