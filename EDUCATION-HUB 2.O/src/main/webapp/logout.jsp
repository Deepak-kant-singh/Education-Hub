<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    // Invalidate the session
    session.invalidate();
    
    // Redirect to the login page
    response.sendRedirect("LOGIN.html");
%>
