<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<style>
    /* General body styling */
    body {
        margin: 0;
        font-family: 'Arial', sans-serif;
        background: linear-gradient(to right, #6a11cb, #2575fc);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #333;
    }

    /* Login card container */
    .login-card {
        background-color: #fff;
        padding: 40px 35px;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        width: 100%;
        max-width: 400px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    /* Card header */
    .login-card h2 {
        margin-bottom: 25px;
        color: #2575fc;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    /* Error message styling */
    .error-msg {
        color: #721c24;
        background-color: #f8d7da;
        border: 1px solid #f5c6cb;
        padding: 12px 15px;
        border-radius: 8px;
        margin-bottom: 20px;
        width: 100%;
        text-align: center;
        font-style: italic;
    }

    /* Input field styling */
    .login-card input[type="text"],
    .login-card input[type="password"] {
        width: 100%;
        padding: 12px 15px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 10px;
        outline: none;
        font-size: 1em;
        transition: 0.3s;
    }

    .login-card input[type="text"]:focus,
    .login-card input[type="password"]:focus {
        border-color: #2575fc;
        box-shadow: 0 0 8px rgba(37,117,252,0.5);
    }

    /* Buttons styling */
    .login-card .btn {
        width: 48%;
        padding: 12px 0;
        margin: 5px 1%;
        border: none;
        border-radius: 10px;
        background-color: #2575fc;
        color: white;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
        font-size: 1em;
    }

    .login-card .btn:hover {
        background-color: #6a11cb;
    }

    /* Flex container for buttons */
    .btn-container {
        display: flex;
        justify-content: space-between;
        width: 100%;
    }

    /* Signup link */
    .signup-link {
        margin-top: 20px;
        font-size: 0.95em;
    }

    .signup-link a {
        color: #2575fc;
        text-decoration: none;
        font-weight: bold;
    }

    .signup-link a:hover {
        text-decoration: underline;
    }

    /* Responsive adjustments */
    @media (max-width: 500px) {
        .login-card {
            padding: 30px 20px;
        }
        .btn-container {
            flex-direction: column;
        }
        .login-card .btn {
            width: 100%;
            margin: 5px 0;
        }
    }
</style>
</head>
<body>

<div class="login-card">
    <h2>Login</h2>

    <% Object error=request.getAttribute("loginError"); %>
    <% if(error != null) { %>
        <div class="error-msg"><%= error.toString() %></div>
    <% } %>

    <form method="post" action="./LoginServlet" style="width:100%;">
        <input type="text" name="email" placeholder="Email" required>
        <input type="password" name="pass" placeholder="Password" required>
        
        <div class="btn-container">
            <input type="submit" name="submit" value="Login" class="btn">
            <input type="reset" name="reset" value="Clear" class="btn">
        </div>
    </form>

    <p class="signup-link">New User? <a href="Register.html">Sign Up</a></p>
</div>

</body>
</html>
