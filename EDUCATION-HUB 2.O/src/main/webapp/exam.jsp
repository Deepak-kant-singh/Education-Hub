<%@ page import="java.sql.*, javax.servlet.*" %>
<%
    String subject = request.getParameter("subject"); // Get the subject parameter
    if (subject == null || subject.isEmpty()) {
        out.println("<p>Error: Subject parameter is missing. Please go back and select a subject.</p>");
        return; // Stop further processing if subject is missing
    }

    String tableName = subject.equalsIgnoreCase("Maths") ? "maths_questions" : "science_questions"; // Map subject to table
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam - <%= subject %></title>
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
            background: url('https://images.unsplash.com/photo-1496715976403-7e36dc43f17b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGJhY2tncm91bmQlMjBpbWFnZSUyMGxvZ2luJTIwcGFnZXxlbnwwfHwwfHx8MA%3D%3D') no-repeat center center fixed;
            background-size: cover; /* Ensure the image covers the entire background */
            //color: #ffffff; /* Light text color for contrast on dark backgrounds */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        /* Header Styling */
        h1 {
            color: #ffffff;
            font-size: 3rem;
            margin-bottom: 40px;
            text-align: center;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5); /* Adding shadow for better visibility */
        }

        /* Form Styling */
        form {
            background: rgba(255, 255, 255, 0.85); /* Semi-transparent white background */
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Soft shadow */
            padding: 40px;
            width: 100%;
            max-width: 600px; /* Responsive width */
            text-align: center;
        }

        label {
            font-size: 1.2rem;
            color: #495057;
            margin-bottom: 10px;
            display: block;
        }

        .question {
            margin-bottom: 20px;
        }

        .question p {
            font-size: 1.3rem;
            margin-bottom: 10px;
            line-height: 1.6;
        }

        input[type="radio"] {
            margin-right: 10px;
        }

        button {
            background-color: #28a745;
            color: #fff;
            font-size: 1.3rem;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s, transform 0.2s;
            margin-top: 20px;
        }

        button:hover {
            background-color: #218838; /* Darker green when hovering */
            transform: translateY(-2px); /* Slight lift effect */
        }

        button:active {
            transform: translateY(0);
        }

        /* Responsive Design */
        @media screen and (max-width: 600px) {
            h1 {
                font-size: 2.2rem;
            }

            form {
                padding: 30px;
                width: 90%;
            }

            button {
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>

    <h1>Exam - <%= subject %></h1>

    <form action="evaluateexam.jsp" method="POST">
        <input type="hidden" name="subject" value="<%= subject %>"> <!-- Pass subject to evaluateexam.jsp -->
        <%
            // Fetch and display questions from the table based on subject
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration2", "root", "12345")) {
                String sql = "SELECT * FROM " + tableName; // Use tableName based on subject
                try (Statement stmt = conn.createStatement()) {
                    ResultSet rs = stmt.executeQuery(sql);
                    while (rs.next()) {
        %>
                        <div class="question">
                            <p><%= rs.getString("question") %></p>
                            <label>
                                <input type="radio" name="q<%= rs.getInt("id") %>" value="1" required>
                                <%= rs.getString("option1") %>
                            </label><br>
                            <label>
                                <input type="radio" name="q<%= rs.getInt("id") %>" value="2">
                                <%= rs.getString("option2") %>
                            </label><br>
                            <label>
                                <input type="radio" name="q<%= rs.getInt("id") %>" value="3">
                                <%= rs.getString("option3") %>
                            </label><br>
                            <label>
                                <input type="radio" name="q<%= rs.getInt("id") %>" value="4">
                                <%= rs.getString("option4") %>
                            </label>
                        </div>
                        <hr>
        <%
                    }
                }
            } catch (Exception e) {
                out.println("<p>Error loading questions: " + e.getMessage() + "</p>");
                e.printStackTrace();
            }
        %>
        <button type="submit">Submit Exam</button>
    </form>

</body>
</html>
