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
		 * On Success (receiving "true" from login method), it redirects to the Home page
		 */
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String role = request.getParameter("role");
			
			// Input validation
			if (username == null || username.trim().isEmpty() || 
			    password == null || password.trim().isEmpty() || 
			    role == null || role.trim().isEmpty()) {
				response.sendRedirect("index.jsp?status=invalid");
				return;
			}

			LoginDao loginDao = new LoginDao();
			Login login = loginDao.login(username.trim(), password, role);
			
			if(login != null) {
				request.getSession(true).setAttribute("email", username);
				request.getSession(true).setAttribute("role", role);
				if(role.equals("manager")) {
					EmployeeDao employeeDao = new EmployeeDao();
					String employeeID = employeeDao.getEmployeeID(username);
					if(employeeID != null) {
						request.getSession(true).setAttribute("employeeID", employeeID);
					}
					response.sendRedirect("managerHome.jsp");
				}
				else if(role.equals("customerRepresentative")) {
					EmployeeDao employeeDao = new EmployeeDao();
					String employeeID = employeeDao.getEmployeeID(username);
					if(employeeID != null) {
						request.getSession(true).setAttribute("employeeID", employeeID);
					}
					response.sendRedirect("customerRepresentativeHome.jsp");
				}
				else {
					CustomerDao customerDao = new CustomerDao();
					String customerID = customerDao.getCustomerID(username);
					if(customerID != null) {
						request.getSession(true).setAttribute("customerID", customerID);
					}
					response.sendRedirect("home.jsp");	
				}
			}
			else {
				response.sendRedirect("index.jsp?status=false");
			}
		} catch (Exception e) {
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
