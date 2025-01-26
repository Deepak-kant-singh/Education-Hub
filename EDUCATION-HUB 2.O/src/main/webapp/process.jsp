<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    // Step 1: Get form data
    String name = request.getParameter("name");
    String userId = request.getParameter("id");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");
    String branch = request.getParameter("branch");
    
    // Handle multiple skills (checkboxes)
    String[] skills = request.getParameterValues("skills");
    String skillsString = skills != null ? String.join(",", skills) : "";

    // Step 2: Set up database connection
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Load the database driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection (replace with your DB details)
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration2", "root", "12345");

        // Step 3: Prepare the SQL query
        String query = "INSERT INTO users (name, user_id, password, email, age, gender, address, branch, skills) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(query);

        // Step 4: Set parameters
        stmt.setString(1, name);
        stmt.setString(2, userId);
        stmt.setString(3, password);
        stmt.setString(4, email);
        stmt.setInt(5, Integer.parseInt(age));
        stmt.setString(6, gender);
        stmt.setString(7, address);
        stmt.setString(8, branch);
        stmt.setString(9, skillsString);

        // Step 5: Execute the query
        int result = stmt.executeUpdate();

        // Step 6: Check if insertion was successful
        if (result > 0) {
            out.println("<h3>Registration successful!</h3>");
        } else {
            out.println("<h3>Error in registration. Please try again.</h3>");
        }

    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
    } finally {
        // Close the connection and statement
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
%>
