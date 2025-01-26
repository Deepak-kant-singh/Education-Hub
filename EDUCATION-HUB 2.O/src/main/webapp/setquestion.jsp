<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Set Questions</title>
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
            background: url('https://www.w3schools.com/w3images/mountains.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            padding: 20px;
            flex-direction: column;
            overflow-y: auto; /* Allows scrolling */
        }

        /* Container Styling */
        .container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 100%;
            max-width: 600px;
            margin: 0 20px;
        }

        h1 {
            color: #5a5ac7;
            margin-bottom: 40px;
        }

        /* Form Styling */
        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
            text-align: left;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #5a5ac7;
        }

        select, input[type="text"], textarea, input[type="number"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        select:focus, input[type="text"]:focus, textarea:focus, input[type="number"]:focus {
            border-color: #5a5ac7;
            box-shadow: 0px 0px 5px rgba(90, 90, 199, 0.5);
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        button {
            background-color: #5a5ac7;
            color: #fff;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
            width: 100%;
        }

        button:hover {
            background-color: #4949a6;
            transform: translateY(-4px);
        }

        .success, .error {
            margin-top: 20px;
            font-size: 1.1em;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
        }

        .success {
            background-color: #e7f7e7;
            color: #4caf50;
        }

        .error {
            background-color: #f8d7da;
            color: #d9534f;
        }

        /* Responsive Design */
        @media screen and (max-width: 600px) {
            .container {
                width: 90%;
                padding: 30px;
            }

            button {
                font-size: 14px;
                padding: 10px 15px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Set Questions</h1>

        <%
            // Check if the form has been submitted
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String subject = request.getParameter("subject"); // "Maths" or "Science"
                String question = request.getParameter("question");
                String option1 = request.getParameter("option1");
                String option2 = request.getParameter("option2");
                String option3 = request.getParameter("option3");
                String option4 = request.getParameter("option4");
                int correctOption = Integer.parseInt(request.getParameter("correctOption"));

                String tableName = subject.equals("Maths") ? "maths_questions" : "science_questions";

                try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration2", "root", "12345")) {
                    String sql = "INSERT INTO " + tableName + " (question, option1, option2, option3, option4, correctOption) VALUES (?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                        pstmt.setString(1, question);
                        pstmt.setString(2, option1);
                        pstmt.setString(3, option2);
                        pstmt.setString(4, option3);
                        pstmt.setString(5, option4);
                        pstmt.setInt(6, correctOption);
                        pstmt.executeUpdate();
                        out.println("<div class='success'>Question added successfully to the " + subject + " table.</div>");
                    }
                } catch (SQLException e) {
                    out.println("<div class='error'>Error adding question: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                }
            }
        %>

        <form action="setquestion.jsp" method="POST">
            <label for="subject">Select Subject:</label>
            <select id="subject" name="subject" required>
                <option value="Maths">Maths</option>
                <option value="Science">Science</option>
            </select>

            <label for="question">Question:</label>
            <textarea id="question" name="question" required></textarea>

            <label for="option1">Option 1:</label>
            <input type="text" id="option1" name="option1" required>

            <label for="option2">Option 2:</label>
            <input type="text" id="option2" name="option2" required>

            <label for="option3">Option 3:</label>
            <input type="text" id="option3" name="option3" required>

            <label for="option4">Option 4:</label>
            <input type="text" id="option4" name="option4" required>

            <label for="correctOption">Correct Option (1-4):</label>
            <input type="number" id="correctOption" name="correctOption" min="1" max="4" required>

            <button type="submit">Submit Question</button>
        </form>
    </div>

</body>
</html>
