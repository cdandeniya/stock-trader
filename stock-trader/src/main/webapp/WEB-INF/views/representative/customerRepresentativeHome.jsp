<%@ include file="../../header.jsp" %>
<!--
	This is the Home page for Customer Representative
	This page contains various buttons to navigate the online auction house
	This page contains customer representative specific accessible buttons
-->
<div class="container">
    <h2><i class="fas fa-headset"></i> Customer Representative Dashboard</h2>
    <p class="text-muted mb-4">Manage customers and process orders</p>
    <%
        // email and role are already declared in header.jsp
        email = (String)session.getAttribute("email");
        role = (String)session.getAttribute("role");

        //redirect to appropriate home page if already logged in
        if(email != null) {
            if(role.equals("manager")) {
                response.sendRedirect("managerHome.jsp");
            }
            else if(!role.equals("customerRepresentative")) {
                response.sendRedirect("home.jsp");
            }
        }
        else {
            // redirect to log in if not alreaddy logged in
            response.sendRedirect("index.jsp");
        }
    %>

    <div class="row">
        <div class="col">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title"><i class="fas fa-clipboard-list"></i> Record Order</h5>
                <div>
                    <form action="viewAddCustomerOrder">
                        <button type="submit" class="btn btn-success"><i class="fas fa-plus"></i> Record Order</button>
                    </form>
                </div>
              </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title"><i class="fas fa-users"></i> Manage Customer</h5>
                <div>
                    <form action="viewAddCustomer.jsp">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-user-plus"></i> Add Customer</button>
                    </form>
                    <form action="getCustomers">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-edit"></i> View / Edit / Delete Customer</button>
                    </form>
                </div>
              </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title"><i class="fas fa-tasks"></i> Other</h5>
                <div>
                    <form action="getCustomerMailingList">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-envelope"></i> Customer Mailing List</button>
                    </form>
                    <form action="viewCustomerStockSuggestions">
                        <button type="submit" class="btn btn-success"><i class="fas fa-lightbulb"></i> View Suggestions</button>
                    </form>
                </div>
              </div>
            </div>
        </div>
</div>
<%@ include file="footer.jsp" %>