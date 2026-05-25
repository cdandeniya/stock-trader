<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    String email = (String) session.getAttribute("email");
    String role = (String) session.getAttribute("role");
    if (email == null || role == null || !role.equals("manager")) {
        response.sendRedirect("index.jsp");
        return;
    }
    request.getRequestDispatcher("/WEB-INF/views/representative/viewAddEmployee.jsp").forward(request, response);
%>
