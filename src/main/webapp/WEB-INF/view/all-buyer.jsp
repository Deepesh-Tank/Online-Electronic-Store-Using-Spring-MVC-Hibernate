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

<title>All buyers</title>
</head>
<body>

<h1><span class="yellow">ALL BUYERS</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
			<table class="containerx">
				<tr>
					<th>Buyer UserName</th>
					<th>Name</th>
					<th>Shop Name(License)</th>
					<th>Address</th>
					<th>Contact Details</th>
					<th>Email</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${m}">						
					<tr>
						<td> ${tempCustomer.id} </td>
						<td> ${tempCustomer.firstName}   ${tempCustomer.lastName} </td>
						<td> ${tempCustomer.shopName}(${tempCustomer.shopLicense}) </td>
						<td> ${tempCustomer.address} ${tempCustomer.city} ${tempCustomer.state } </td>
						<td> ${tempCustomer.contacts} </td>		
						<td> ${tempCustomer.email} </td>	
					</tr>
				
				</c:forEach>
						
			</table>
				
		 
	<a href="${pageContext.request.contextPath}/all">Back to home</a>
</body>
</html>