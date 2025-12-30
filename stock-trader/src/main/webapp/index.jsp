<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="heading" value="Home"/>
<%@ include file="header.jsp" %>

<div class="container">
			<h2>Login to Stock Trading System</h2>
			<%
				String email = (String)session.getAttribute("email");
				String role = (String)session.getAttribute("role");
				
				if(email != null) {
					if(role.equals("manager")) {
						response.sendRedirect("managerHome.jsp");
					}
					else if(role.equals("customerRepresentative")) {
						response.sendRedirect("customerRepresentativeHome.jsp");
					}
					else {
						response.sendRedirect("home.jsp");	
					}
				}
				
				String status = request.getParameter("status");
				if(status != null) {
					if(status.equals("false")) {
						out.print("<div class='alert alert-danger' role='alert'>");
						out.print("<strong>Login Failed!</strong> Incorrect username, password, or role. Please try again.");
						out.print("</div>");
					}
					else {
						out.print("<div class='alert alert-warning' role='alert'>");
						out.print("<strong>Error!</strong> An unexpected error occurred. Please try again.");
						out.print("</div>");
					}
				}
			%>
			<form action="login" method="post">
				<div class="form-group">
					<label for="username">Email Address</label>
					<input type="email" class="form-control" id="username" name="username" placeholder="Enter your email" required>
				</div>
				<div class="form-group">
					<label for="password">Password</label>
	            	<input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
	        	</div>
				<div class="form-group">
					<label for="role">Role</label>
					<select class="form-control" id="role" name="role" required>
                        <option value="customer">Customer</option>
                        <option value="manager">Manager</option>
                        <option value="customerRepresentative">Customer Representative</option>
					</select>
				</div>
				<button type="submit" class="btn btn-success btn-block">Login</button>
			</form>
			<div class="mt-3 text-center">
				<small class="text-muted">Demo Credentials:<br/>
				Manager: dwarren@cs.sunysb.edu / admin789<br/>
				Customer Rep: dsmith@cs.sunysb.edu / rep456<br/>
				Customer: lewis.p@cs.sunysb.edu / password123</small>
			</div>
		</div>
<%@ include file="footer.jsp" %>