package com.stocktrader.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stocktrader.repository.CustomerDao;
import com.stocktrader.repository.EmployeeDao;
import com.stocktrader.repository.LoginDao;
import com.stocktrader.model.Login;
/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * This method is called by the login button
		 * It receives the username and password values and sends them to LoginDao's login method for processing
		 */
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String role = request.getParameter("role");
			
			System.out.println("=== LOGIN CONTROLLER START ===");
			System.out.println("LoginController: Received login request");
			System.out.println("  username='" + username + "'");
			System.out.println("  password='" + (password != null ? "***" : "NULL") + "'");
			System.out.println("  role='" + role + "'");
			System.out.println("=== CALLING LoginDao ===");
			
			// Input validation
			if (username == null || username.trim().isEmpty() || 
			    password == null || password.trim().isEmpty() || 
			    role == null || role.trim().isEmpty()) {
				System.err.println("LoginController: Invalid input parameters");
				response.sendRedirect("index.jsp?status=invalid");
				return;
			}

			LoginDao loginDao = new LoginDao();
			Login login = loginDao.login(username.trim(), password, role);
			
			if(login != null) {
				System.out.println("LoginController: ✓ Login successful, redirecting...");
				request.getSession(true).setAttribute("email", username.trim());
				request.getSession(true).setAttribute("role", login.getRole()); // Use role from login object
				
				String actualRole = login.getRole();
				
				// Try to get IDs, but don't fail if they're not found (for bypass users)
				if("manager".equals(actualRole) || "customerRepresentative".equals(actualRole)) {
					try {
						EmployeeDao employeeDao = new EmployeeDao();
						String employeeID = employeeDao.getEmployeeID(username.trim());
						if(employeeID != null) {
							request.getSession(true).setAttribute("employeeID", employeeID);
						}
					} catch (Exception e) {
						System.err.println("LoginController: Could not get employee ID (non-critical): " + e.getMessage());
						// Continue anyway - ID lookup is optional for bypass users
					}
				} else {
					try {
						CustomerDao customerDao = new CustomerDao();
						String customerID = customerDao.getCustomerID(username.trim());
						if(customerID != null) {
							request.getSession(true).setAttribute("customerID", customerID);
						}
					} catch (Exception e) {
						System.err.println("LoginController: Could not get customer ID (non-critical): " + e.getMessage());
						// Continue anyway - ID lookup is optional for bypass users
					}
				}
				
				// Forward to the correct JSP pages in WEB-INF/views
				// Use try-catch to handle any JSP compilation issues gracefully
				try {
					if("manager".equals(actualRole)) {
						System.out.println("LoginController: Forwarding manager to managerHome.jsp");
						request.getRequestDispatcher("/WEB-INF/views/admin/managerHome.jsp").forward(request, response);
					}
					else if("customerRepresentative".equals(actualRole)) {
						System.out.println("LoginController: Forwarding rep to customerRepresentativeHome.jsp");
						request.getRequestDispatcher("/WEB-INF/views/representative/customerRepresentativeHome.jsp").forward(request, response);
					}
					else {
						System.out.println("LoginController: Forwarding customer to home.jsp");
						request.getRequestDispatcher("/WEB-INF/views/customer/home.jsp").forward(request, response);
					}
					return; // Important: return after forward
				} catch (Exception e) {
					System.err.println("LoginController: Error forwarding to JSP: " + e.getMessage());
					e.printStackTrace();
					// Fallback: redirect to index with success message
					// The session is already set, so index.jsp will redirect appropriately
					response.sendRedirect("index.jsp");
					return;
				}
			}
			else {
				System.err.println("LoginController: ✗ Login failed");
				response.sendRedirect("index.jsp?status=false");
			}
		} catch (Exception e) {
			System.err.println("LoginController: ✗ Exception: " + e.getMessage());
			e.printStackTrace();
			response.sendRedirect("index.jsp?status=error");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
