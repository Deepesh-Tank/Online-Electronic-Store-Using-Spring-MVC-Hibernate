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

<title>All transporters</title>
</head>
<body>

<h1><span class="yellow">ALL TRANSPORTERS</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
			<table class="containerx">
				<tr>
					<th>Buyer UserName</th>
					<th>Name</th>
					<th>Company Name(permit)</th>
					<th>Address</th>
					<th>State operating</th>
					<th>Contact Details</th>
					<th>Email</th>
					<th>price per weight</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${m}">						
					<tr>
						<td> ${tempCustomer.userName} </td>
						<td> ${tempCustomer.name} </td>
						<td> ${tempCustomer.company}(${tempCustomer.permit}) </td>
						<td> ${tempCustomer.address}</td>
						<td> ${tempCustomer.state } </td>
						<td> ${tempCustomer.contacts} </td>		
						<td> ${tempCustomer.email} </td>
						<td>${tempCustomer.pw} Rs</td>	
					</tr>
				
				</c:forEach>
						
			</table>
				
		 
	<a href="${pageContext.request.contextPath}/all">Back to home</a>
</body>
</html>