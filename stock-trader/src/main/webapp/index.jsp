<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="heading" value="Home"/>
<%@ include file="header.jsp" %>

<div class="container" style="padding-bottom: 60px; margin-bottom: 40px;">
			<h2>Login to Stock Trading System</h2>
			<%
				// email and role are already declared in header.jsp
				email = (String)session.getAttribute("email");
				role = (String)session.getAttribute("role");
				
				if(email != null) {
					// Forward to the appropriate home page based on role
					if(role != null && role.equals("manager")) {
						request.getRequestDispatcher("/WEB-INF/views/admin/managerHome.jsp").forward(request, response);
						return;
					}
					else if(role != null && role.equals("customerRepresentative")) {
						request.getRequestDispatcher("/WEB-INF/views/representative/customerRepresentativeHome.jsp").forward(request, response);
						return;
					}
					else {
						request.getRequestDispatcher("/WEB-INF/views/customer/home.jsp").forward(request, response);
						return;
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
				<div class="form-group" style="margin-bottom: 1.5rem; z-index: 1000; position: relative;">
					<label for="role">Role</label>
					<select class="form-control" id="role" name="role" required style="position: relative; z-index: 1001;">
                        <option value="customer">Customer</option>
                        <option value="manager">Manager</option>
                        <option value="customerRepresentative">Customer Representative</option>
					</select>
				</div>
				<button type="submit" class="btn btn-success btn-block" style="margin-top: 1rem;">Login</button>
			</form>
			<div class="mt-4 mb-3 text-center">
				<small class="text-muted">Demo Credentials:<br/>
				Manager: dwarren@cs.sunysb.edu / admin789<br/>
				Customer Rep: dsmith@cs.sunysb.edu / rep456<br/>
				Customer: lewis.p@cs.sunysb.edu / password123</small>
			</div>
		</div>
<%@ include file="footer.jsp" %>