<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="heading" value="Home"/>
<%@ include file="/header.jsp" %>

<div class="container">
    <h2><i class="fas fa-user"></i> Customer Dashboard</h2>
    <p class="text-muted mb-4">Manage your orders and track your stock portfolio</p>
    <%
        // email and role are already declared in header.jsp
        email = (String)session.getAttribute("email");
        role = (String)session.getAttribute("role");

        //redirect to appropriate home page if already logged in
        if(email != null) {
            if(role != null && role.equals("manager")) {
                request.getRequestDispatcher("/WEB-INF/views/admin/managerHome.jsp").forward(request, response);
                return;
            }
            else if(role != null && role.equals("customerRepresentative")) {
                request.getRequestDispatcher("/WEB-INF/views/representative/customerRepresentativeHome.jsp").forward(request, response);
                return;
            }
        }
        else {
            // redirect to log in if not already logged in
            response.sendRedirect("/stock-trader/index.jsp");
            return;
        }
    %>
    <div class="row">
    <div class="col">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title"><i class="fas fa-shopping-cart"></i> Orders</h5>
            <div>
                <form action="viewAddOrder">
                    <button type="submit" class="btn btn-success"><i class="fas fa-plus-circle"></i> Place Order</button>
                </form>
                <form action="getOrdersByCustomer">
                    <button type="submit" class="btn btn-success"><i class="fas fa-history"></i> Order History</button>
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
                <form action="getStocksByCustomer">
                    <button type="submit" class="btn btn-success"><i class="fas fa-briefcase"></i> Current Holdings</button>
                </form>
                <form action="viewGetStockPriceHistory">
                    <button type="submit" class="btn btn-success"><i class="fas fa-chart-area"></i> Price History</button>
                </form>
                <form action="viewSearchStocks">
                    <button type="submit" class="btn btn-success"><i class="fas fa-search"></i> Search Stocks</button>
                </form>
                <form action="getCustomerBestsellers">
                    <button type="submit" class="btn btn-success"><i class="fas fa-fire"></i> Bestseller Stocks</button>
                </form>
                <form action="getStockSuggestions">
                    <button type="submit" class="btn btn-success"><i class="fas fa-lightbulb"></i> Stock Suggestions</button>
                </form>
            </div>
          </div>
        </div>
    </div>
</div>
</div>
<%@ include file="/footer.jsp" %>