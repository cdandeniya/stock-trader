package com.stocktrader.controller;

import dao.StockDao;
import model.Stock;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class SearchItemsByTypeController
 */
public class GetStocksByCustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStocksByCustomerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String customerID = (String)request.getSession(false).getAttribute("customerID");
		
		StockDao stockDao = new StockDao();
		List<Stock> stocks = stockDao.getStocksByCustomer(customerID);
		
		request.setAttribute("stocks", stocks);
		request.setAttribute("heading", "Current stock holdings");

		RequestDispatcher rd = request.getRequestDispatcher("showStocks.jsp");
		rd.forward(request, response);
	}

}
