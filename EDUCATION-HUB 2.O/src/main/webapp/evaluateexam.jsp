<%@ page import="java.sql.*, javax.servlet.*" %>
<%
    String subject = request.getParameter("subject"); // Get the subject parameter
    if (subject == null || subject.isEmpty()) {
        out.println("<p>Error: Subject parameter is missing. Please go back and select a subject.</p>");
        return; // Stop further processing if subject is missing
    }

    String tableName = subject.equalsIgnoreCase("Maths") ? "maths_questions" : "science_questions"; // Map subject to table
    int correct = 0;
    int wrong = 0;

    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration2", "root", "12345")) {
        // Retrieve all questions from the table
        String sql = "SELECT id, correctOption FROM " + tableName;
        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int questionId = rs.getInt("id");
                int correctAnswer = rs.getInt("correctOption"); // Correct option from the database

                // Get the user's answer for this question
                String userAnswer = request.getParameter("q" + questionId);

                if (userAnswer != null && Integer.parseInt(userAnswer) == correctAnswer) {
                    correct++; // Increment correct count if the user's answer matches
                } else {
                    wrong++; // Increment wrong count otherwise
                }
            }
        }
    } catch (SQLException e) {
        out.println("<p>Error evaluating the exam: " + e.getMessage() + "</p>");
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exam Result - <%= subject %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            text-align: center;
            padding: 20px;
        }

        h1 {
            color: #5a5ac7;
        }

        .result {
            margin-top: 20px;
            font-size: 1.2em;
        }

        a {
            color: #5a5ac7;
            text-decoration: none;
            font-weight: bold;
        }

        button {
            background-color: #5a5ac7;
            color: #fff;
            border: none;
            padding: 10px 20px;
            margin-top: 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #4949a6;
        }
    </style>
</head>
<body>
    <h1>Exam Result - <%= subject %></h1>
    <div class="result">
        <p>Correct Answers: <%= correct %></p>
        <p>Wrong Answers: <%= wrong %></p>
        <p>Total Questions: <%= correct + wrong %></p>
    </div>
    <a href="startexam.jsp">Take Another Exam</a>

    <!-- Add a hidden form for re-evaluating the same exam -->
    <form action="evaluateexam.jsp" method="POST">
        <input type="hidden" name="subject" value="<%= subject %>">
        <button type="submit">Submit Exam Again</button>
    </form>
</body>
</html>
