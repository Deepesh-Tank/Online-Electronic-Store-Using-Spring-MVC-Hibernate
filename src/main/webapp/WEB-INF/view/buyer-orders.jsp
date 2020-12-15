<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/tables_formats.css" />
		  <link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style_link.css" />

<title>All orders</title>
</head>
<body>
<h1><span class="yellow">ALL ORDERS</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
			<table class="containerx">
				<tr>
					<th>Order ID</th>
					<th>Order Description</th>
					<th>Order Amount</th>
					<th>Shipping Amount</th>
					<th>Transporter</th>
					<th>status of Order</th>
					<th>Date<th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${alpha}">	
					<tr>
						<td style="width:8%"> ${tempCustomer.orderId} </td>
						<td style="width:30%"> ${tempCustomer.orderDescription} </td>
						<td style="width:8%"> ${tempCustomer.amount} Rs</td>
						<td style="width:8%"> ${tempCustomer.samount} Rs</td>
						<td style="width:15%"> ${tempCustomer.tuser} </td>
						<td style="width:20%">
							<c:if test = "${tempCustomer.status == 0 }">
         					In verification process
      						</c:if>
							<c:if test = "${tempCustomer.status == 1 }">
         					In delivery process
      						</c:if>
      						<c:if test = "${tempCustomer.status == 2 }">
         					Order Delivered
      						</c:if>
						</td>
						<td>${fn:substring(tempCustomer.date, 0, 10) }</td>
						
					</tr>
				
				</c:forEach>
						
			</table>	 
	<a href="${pageContext.request.contextPath}/all">back to home page</a>
</body>
</html>