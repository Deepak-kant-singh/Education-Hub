<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Start Exam</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Body Styling */
        body {
            background-color: #e9ecef; /* Formal light background */
            color: #333; /* Dark text for readability */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        /* Header Styling */
        h1 {
            color: #495057; /* Darker shade of gray for the header */
            font-size: 2.5rem;
            margin-bottom: 40px;
            text-align: center;
        }

        /* Form Styling */
        form {
            background: #ffffff; /* White background for the form */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Soft shadow */
            padding: 40px;
            width: 100%;
            max-width: 500px; /* Responsive width */
            text-align: center;
        }

        label {
            font-size: 1.1rem;
            color: #495057;
            margin-bottom: 10px;
            display: block;
        }

        select {
            width: 100%;
            padding: 12px;
            margin: 15px 0;
            border: 1px solid #ced4da;
            border-radius: 8px;
            font-size: 1rem;
            background-color: #f8f9fa;
            transition: border 0.3s ease;
        }

        select:focus {
            border-color: #007bff; /* Highlight the select field when focused */
            outline: none;
        }

        button {
            background-color: #007bff;
            color: #fff;
            font-size: 1.1rem;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s, transform 0.2s;
        }

        button:hover {
            background-color: #0056b3; /* Darker blue when hovering */
            transform: translateY(-2px); /* Slight lift effect */
        }

        button:active {
            transform: translateY(0);
        }

        /* Responsive Design */
        @media screen and (max-width: 600px) {
            h1 {
                font-size: 2rem;
            }

            form {
                padding: 30px;
                width: 90%;
            }

            button {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

    <h1>Choose a Subject to Start the Exam</h1>

    <form action="exam.jsp" method="POST">
        <label for="subject">Select Subject:</label>
        <select name="subject" id="subject" required>
            <option value="Maths">Maths</option>
            <option value="Science">Science</option>
        </select>
        <br>
        <button type="submit">Start Exam</button>
    </form>

</body>
</html>
