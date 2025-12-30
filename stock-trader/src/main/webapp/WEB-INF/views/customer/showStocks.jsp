<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<div class="container">
    <h2><i class="fas fa-chart-line"></i> ${heading}</h2>
    <div>
        <c:if test="${empty stocks}">
            <div class="empty-state">
                <i class="fas fa-inbox"></i>
                <h3>No stocks found!</h3>
                <p class="text-muted">There are no stocks to display at this time.</p>
            </div>
        </c:if>
        <c:if test="${not empty stocks}">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th><i class="fas fa-tag mr-2"></i>Symbol</th>
                        <th><i class="fas fa-building mr-2"></i>Name</th>
                        <th><i class="fas fa-layer-group mr-2"></i>Type</th>
                        <th><i class="fas fa-boxes mr-2"></i>Number of Shares</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${stocks}" var="cd">
                        <tr>
                            <td><strong>${cd.symbol}</strong></td>
                            <td>${cd.name}</td>
                            <td><span class="badge badge-info">${cd.type}</span></td>
                            <td>${cd.numShares}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </div>
<%@ include file="footer.jsp" %>