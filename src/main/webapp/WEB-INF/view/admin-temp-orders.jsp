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

<title>Order in transportation</title>
</head>
<body>

<h1><span class="yellow">ALL DONE ORDERS</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
			<table class="containerx">
				<tr>
					<th>Order ID</th>
					<th>Buyer UserName</th>
					<th>Transporter UserName</th>
					<th>Order Description</th>
					<th>Order amount</th>
					<th>Shipping amount</th>
					<th>Date</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${ord}">						
					<tr>
						<td style="width:8%"> ${tempCustomer.orderId} </td>
						<td style="width:12%"> ${tempCustomer.buser} </td>
						<td style="width:12%"> ${tempCustomer.tuser} </td>
						<td style="width:30%"> ${tempCustomer.orderDescription} </td>
						<td style="width:10%"> ${tempCustomer.amount} Rs </td>
						<td style="width:10%"> ${tempCustomer.samount} Rs</td>		
						<td style="width:12%">${fn:substring(tempCustomer.date, 0, 10)}</td>
					</tr>
				
				</c:forEach>
						
			</table>
				
		 
	<a href="${pageContext.request.contextPath}/all">Back to home</a><br><br><br>
</body>
</html>