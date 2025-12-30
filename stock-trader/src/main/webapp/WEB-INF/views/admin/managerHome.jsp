<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="heading" value="Home"/>
<%@ include file="/header.jsp" %>
<div class="container">
    <h2><i class="fas fa-user-shield"></i> Manager Dashboard</h2>
    <p class="text-muted mb-4">Manage employees, view reports, and control stock prices</p>
    <%
        // email and role are already declared in header.jsp
        email = (String) session.getAttribute("email");
        role = (String) session.getAttribute("role");

        //redirect to appropriate home page if already logged in
        if (email != null) {
            if (role != null && role.equals("customerRepresentative")) {
                request.getRequestDispatcher("/WEB-INF/views/representative/customerRepresentativeHome.jsp").forward(request, response);
                return;
            } else if (role != null && !role.equals("manager")) {
                request.getRequestDispatcher("/WEB-INF/views/customer/home.jsp").forward(request, response);
                return;
            }
        } else {
            // redirect to log in if not already logged in
            response.sendRedirect("/stock-trader/index.jsp");
            return;
        }

    %>

    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-users"></i> Manage Employee</h5>
                    <div>
                        <form action="viewAddEmployee">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-user-plus"></i> Add Employee</button>
                        </form>
                        <form action="getEmployees">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-edit"></i> View / Edit / Delete Employee</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-chart-bar"></i> Sales and Orders</h5>
                    <div>
                        <form action="viewSalesReport">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-file-alt"></i> View Sales Report</button>
                        </form>
                        <form action="viewSummaryListing">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-dollar-sign"></i> View Revenue Summary</button>
                        </form>
                        <form action="getHighestRevenueEmployee">
                            <button type="submit" class="btn btn-success"><i class="fas fa-trophy"></i> Top Revenue Employee</button>
                        </form>
                        <form action="getHighestRevenueCustomer">
                            <button type="submit" class="btn btn-success"><i class="fas fa-star"></i> Top Revenue Customer</button>
                        </form>
                        <form action="viewSearchOrders">
                            <button type="submit" class="btn btn-success"><i class="fas fa-search"></i> Search Orders</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-chart-line"></i> Stocks</h5>
                    <div>
                        <form action="viewSetStockPrice">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-dollar-sign"></i> Set Stock Price</button>
                        </form>
                        <form action="getStocks">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-list"></i> View All Stocks</button>
                        </form>
                        <form action="getBestsellers">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-fire"></i> View Bestsellers</button>
                        </form>
                        <form action="getActivelyTradedStocks">
                            <button type="submit" class="btn btn-success"><i class="fas fa-exchange-alt"></i> Actively Traded Stocks</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>


</div>
<%@ include file="/footer.jsp" %>