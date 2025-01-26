<%@ page import="java.sql.*, javax.servlet.*" %>
<%
    String subject = request.getParameter("subject");
    String question = request.getParameter("question");
    String option1 = request.getParameter("option1");
    String option2 = request.getParameter("option2");
    String option3 = request.getParameter("option3");
    String option4 = request.getParameter("option4");
    String correctOption = request.getParameter("correctOption");

    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration2", "root", "12345")) {
        String sql = "INSERT INTO questions (subject, question, option1, option2, option3, option4, correctOption) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, subject);
            stmt.setString(2, question);
            stmt.setString(3, option1);
            stmt.setString(4, option2);
            stmt.setString(5, option3);
            stmt.setString(6, option4);
            stmt.setString(7, correctOption);
            stmt.executeUpdate();
            out.println("<h3>Question saved successfully!</h3>");
        }
    } catch (Exception e) {
        out.println("<h3>Error saving question: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    }
%>
<a href="dashboard.jsp">Go back to Dashboard</a>
