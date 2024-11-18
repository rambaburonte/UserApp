<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #721c24;
        }
        p {
            margin: 10px 0;
        }
        a {
            color: #0056b3;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
    <script>
    function goBack() {
        if (document.referrer) {
            window.history.back();
        } else {
            window.location.href = "index.html"; // Fallback to home page
        }
    }
</script>
</head>
<body>
    <div class="container">
        <h1>Error</h1>
        <p>
            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
            %>
                <strong><%= errorMessage %></strong>
            <% 
                } else {
            %>
                An unexpected error occurred. Please try again later.
            <% 
                }
            %>
        </p>
        <p>
            <a href="index.html">Go to Home Page</a>
        </p>
        <p>
            <a href="javascript:history.back()">Go Back</a>
        </p>
    </div>
</body>
</html>