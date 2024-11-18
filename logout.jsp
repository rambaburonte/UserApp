<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Invalidate the current session to log the user out
    HttpSession sessio = request.getSession(false);
    if (session != null) {
        session.invalidate(); // Invalidate the session
    }

    // Redirect to the login page or home page after logout
     // Change this to your login page
%>
<!DOCTYPE html>
<html>
<head>
    <title>Logging Out</title>
    <style type="text/css">@charset "UTF-8";
/* General Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Full viewport height */
}

/* Logout Container */
.logout-container {
    text-align: center;
    background-color: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.logout-container h1 {
    color: #333;
}

.logout-container p {
    color: #555;
}</style>
      
</head>
<body>

    <div class="logout-container">
        <h1>Logging Out...</h1>
        <p>You have been logged out successfully....</p>
    </div> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <jsp:include page="index.html"></jsp:include>
  
</body>
</html>