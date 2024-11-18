<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #5cb85c;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        a:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome!</h2>
        <%
            // Retrieve the session
            HttpSession sessio = request.getSession(false);
            if (sessio != null) {
            	Integer username = (Integer) sessio.getAttribute("username");
                if (username != null) {
                    out.println("<p>Hello, " + username + "! Thank you for logging in.</p>");
                } else {
                    out.println("<p>Session expired. Please log in again.</p>");
                }
            } else {
                out.println("<p>No active session found. Please log in.</p>");
            }
        %>
        <a href="viewprofile">View Profile</a>
        <a href="index.html">Logout</a>
    </div>
</body>
</html>