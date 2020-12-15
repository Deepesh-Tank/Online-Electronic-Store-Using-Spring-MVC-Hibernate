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

<title>All pins</title>
</head>
<body>
<h1><span class="yellow">PINS FOR ORDERS</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
		
			<table class="containerx">
				<tr>
					<th>OrderID</th>
					<th>Pin</th>
				 
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${pinlist}">
				
				 
					<tr>
						<td> ${tempCustomer.orderId} </td>
						<td> ${tempCustomer.pin} </td>
					</tr>
				
				</c:forEach>
						
			</table>
				
	 
	<a href="${pageContext.request.contextPath}/all">back to home page</a>
</body>
</html>