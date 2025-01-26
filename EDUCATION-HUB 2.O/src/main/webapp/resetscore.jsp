<%
    session.removeAttribute("correctScore");
    session.removeAttribute("wrongScore");
    response.sendRedirect("dashboard.jsp");
%>
