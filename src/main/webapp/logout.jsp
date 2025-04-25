<%
    session.invalidate();
    response.sendRedirect(request.getContextPath()+"/users.jsp");
%>
