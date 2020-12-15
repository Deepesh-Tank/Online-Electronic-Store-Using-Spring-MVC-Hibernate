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

<title>Reviews</title>
</head>
<body>

	<h1><span class="yellow">WRITE REVIEWS OF DILEVERED ORDERS</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
	
 
			<table class="containerx">
				<tr>
					<th>Product Name</th>
					<th>Order ID <br>
					(In which product was 1<sup>st</sup> purchased)</th>
					<th>Write Review</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${reviewmodel}" varStatus="status">
				
					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/buyer/proceedreview">
						<c:param name="productId" value="${tempCustomer.productId}" />
						<c:param name="productname" value="${list2[status.index] }" />
					</c:url>					
					<tr>
						<td> ${list2[status.index] }</td>
					<!--  
						<td> ${tempCustomer.productId} </td>
					-->	
						<td> ${tempCustomer.orderid} </td>
						
						<td>
							<a href="${updateLink}">Write Review</a>		 
						</td>
						
					</tr>
				
				</c:forEach>
						
			</table>
				
		 
	<a href="${pageContext.request.contextPath}/buyer/backfromcart">back to home page</a>
</body>
</html>