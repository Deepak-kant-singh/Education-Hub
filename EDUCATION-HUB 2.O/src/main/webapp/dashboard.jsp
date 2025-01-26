<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        /* Body Styling */
        body {
            background: url('https://www.w3schools.com/w3images/forestbridge.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        /* Container Styling */
        .container {
            background: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }

        .container h1 {
            margin-bottom: 30px;
            font-size: 28px;
            color: #333;
            font-weight: bold;
        }

        /* Button Styling */
        .btn {
            display: inline-block;
            padding: 14px 30px;
            margin: 12px;
            font-size: 18px;
            color: #fff;
            background: linear-gradient(45deg, #00b4d8, #0077b6);
            border: none;
            border-radius: 50px;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.3s, transform 0.2s ease;
        }

        .btn:hover {
            background: linear-gradient(45deg, #0077b6, #00b4d8);
            transform: translateY(-4px);
        }

        /* Button focus effect */
        .btn:focus {
            outline: none;
            box-shadow: 0px 0px 10px rgba(0, 184, 216, 0.7);
        }

        /* Logout Link Styling */
        .logout {
            display: block;
            margin-top: 25px;
            font-size: 16px;
            color: #333;
            text-decoration: none;
        }

        .logout:hover {
            color: #0077b6;
            text-decoration: underline;
        }

        /* Responsive Design */
        @media screen and (max-width: 600px) {
            .container {
                width: 90%;
                padding: 30px;
            }

            .btn {
                font-size: 16px;
                padding: 12px 25px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome, <%= username %>!</h1>
        <button class="btn" onclick="window.location.href='setquestion.jsp'">Set Question</button>
        <button class="btn" onclick="window.location.href='startexam.jsp'">Give Exam</button>
        <a href="logout.jsp" class="logout">Logout</a>
    </div>
</body>
</html>
