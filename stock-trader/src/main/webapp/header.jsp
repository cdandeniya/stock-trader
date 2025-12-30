<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.stocktrader.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${heading} - Stock Trading System</title>
    <link href="webjars/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link href="static/css/main.css" rel="stylesheet" />
    <script src="webjars/jquery/3.3.1-1/jquery.min.js"></script>
    <script src="webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="static/js/main.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark mb-3">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-chart-line mr-2"></i> Stock Trading System
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <%
                    String email = (String)session.getAttribute("email");
                    String role = (String)session.getAttribute("role");
                    if(email != null) {
                %>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
                        <i class="fas fa-user-circle mr-1"></i> <%= email %>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <span class="dropdown-item-text">
                            <small><i class="fas fa-user-tag mr-1"></i> <%= role != null ? role.substring(0,1).toUpperCase() + role.substring(1) : "User" %></small>
                        </span>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="<%= role != null && role.equals("manager") ? "managerHome.jsp" : role != null && role.equals("customerRepresentative") ? "customerRepresentativeHome.jsp" : "home.jsp" %>">
                            <i class="fas fa-home mr-2"></i> Dashboard
                        </a>
                        <a class="dropdown-item" href="logout">
                            <i class="fas fa-sign-out-alt mr-2"></i> Logout
                        </a>
                    </div>
                </li>
                <%
                    } else {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">
                        <i class="fas fa-sign-in-alt mr-1"></i> Login
                    </a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>