<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String name = request.getParameter("username");  // Changed to 'name'
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    try {
        // Establish MySQL connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration2", "root", "12345");

        // Query to check user credentials, changed 'username' to 'name'
        String query = "SELECT * FROM users WHERE name = ? AND password = ?";
        pst = conn.prepareStatement(query);
        pst.setString(1, name);  // Using 'name' instead of 'username'
        pst.setString(2, password);

        rs = pst.executeQuery();

        if (rs.next()) {
            // If login is successful, redirect to the new page
            session.setAttribute("username", name);  // Save 'name' in session (no need to redeclare session)
            response.sendRedirect("dashboard.jsp");
        } else {
            // If login fails, show error
            out.println("Invalid name or password.");
            response.sendRedirect("login.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred, please try again later.");
    } finally {
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
