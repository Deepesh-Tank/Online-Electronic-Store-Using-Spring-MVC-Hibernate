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

<title>Cart</title>
</head>
<body>



			
	<h1><span class="yellow">CART ITEMS</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
			<table class="containerx">
				<tr>
					<th>Product Name</th>
					<th>Price</th>
					<th>Weight</th>
					<th>Quantity</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${pro}" varStatus="status">
				
					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/buyer/addtocart">
						<c:param name="productIdd" value="${tempCustomer.cartId}" />
					</c:url>					

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/administration/deleteProduct">
						<c:param name="productIdd" value="${tempCustomer.cartId}" />
					</c:url>					
					
					<c:url var="p1" value="/buyer/proceed">
						<c:param name="tpp" value="${tp}" />
						<c:param name="tww" value="${tw}" />
					</c:url>	
					<tr>
					
						<td> ${list2[status.index] } </td>
						<td> ${tempCustomer.cartPrice} Rs </td>
						<td> ${tempCustomer.weight} Kg</td>
						<td> ${tempCustomer.quantity} </td>
						
					</tr>
				
				</c:forEach>
						
			</table>
				
	 
	<a href="${p1}">Proceed to pay</a>
	<br>
	<br>
	<br>
	total amount = ${tp} Rs<br>
	total weight = ${tw} Kg<br>
	shipping charges depend upon weight and address and to be paid at time of delivery.<br>
	
	
	<br>
	<br>
	<a href="${pageContext.request.contextPath}/buyer/backfromcart">back to home page</a>
</body>
</html>