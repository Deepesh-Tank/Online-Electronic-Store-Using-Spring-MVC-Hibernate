<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<title>Unverified Orders</title>
</head>
<body>
<h1><span class="yellow">ALL UNVERIFIED ORDERS</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
		
			<table class="containerx">
				<tr>
					<th style="width:8%">Order ID</th>
					<th style="width:12%">Buyer UserName</th>
					<th style="width:12%">Transporter UserName</th>
					<th style="width:30%">Order Description</th>
					<th style="width:10%">Order amount</th>
					<th style="width:10%">Shipping amount</th>
					<th style="width:20%">verify</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${ord}">
				
					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/administration/verifyit">
						<c:param name="productIdd" value="${tempCustomer.orderId}" />
					</c:url>				
					
					<tr>
						<td> ${tempCustomer.orderId} </td>
						<td> ${tempCustomer.buser} </td>
						<td> ${tempCustomer.tuser} </td>
						<td> ${tempCustomer.orderDescription} </td>
						<td> ${tempCustomer.amount} </td>
						<td> ${tempCustomer.samount} </td>
						<td>
							<!-- display the update link -->
							<a href="${updateLink}">verify</a>
						</td>
						
					</tr>
				
				</c:forEach>
						
			</table>
				
	 
	<a href="${pageContext.request.contextPath}/all">Back to home</a>
</body>
</html>