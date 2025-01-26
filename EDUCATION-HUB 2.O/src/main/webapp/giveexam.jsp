<%@ page import="java.sql.*, javax.servlet.*" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("LOGIN.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Give Exam</title>
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
            background: linear-gradient(120deg, #ff7eb3, #ff758c);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        /* Container Styling */
        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        .container h1 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-size: 14px;
            color: #444;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        select:focus {
            border-color: #ff758c;
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            background: #ff7eb3;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background: #ff5470;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Choose Subject to Give Exam</h1>
        <form action="startexam.jsp" method="GET">
            <label for="subject">Choose Subject:</label>
            <select name="subject" id="subject" required>
                <option value="Maths">Maths</option>
                <option value="Science">Science</option>
            </select>
            <button type="submit">Start Exam</button>
        </form>
    </div>
</body>
</html>
