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
<title>ALL PRODUCTS</title>
</head>
<body>

	 
			<h1><span class="yellow">ALL REGISTERED PRODUCTS</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
	 
		<br>
		<br>
			<!-- put new button: Add Customer -->
			<!-- 
			
			 -->
			 
					
			 
		 <br>
		 <br>
		
			<!--  add our html table here -->
		
			<table class="containerx">
				<tr>
					<th>Product Name</th>
					<th>Price</th>
					<th>Weight</th>
					<th>Description</th>
					<th>Action Taken</th>
					 
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${pro}">
				
					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/administration/updateProductForm">
						<c:param name="productIdd" value="${tempCustomer.productId}" />
					</c:url>					

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/administration/deleteProduct">
						<c:param name="productIdd" value="${tempCustomer.productId}" />
					</c:url>					
					<c:url var="reviewLink" value="/administration/seereview">
						<c:param name="productIdd" value="${tempCustomer.productId}" />
					</c:url>
					<tr>
						<td style="width: 20%"> ${tempCustomer.productName} </td>
						<td style="width: 7%"> ${tempCustomer.price} Rs </td>
						<td style="width: 7%"> ${tempCustomer.weight} Kg</td>
						<td style="width: 36%"> ${tempCustomer.productDescription} </td>
						<td style="width: 30%">
							<!-- display the update link -->
							<a href="${reviewLink}">See Review</a>
							 
							
							 
							
							  
						 
						 <a href="${updateLink}">Update</a> 
						 <a href="${deleteLink}"
							   onclick="if (!(confirm('Are you sure you want to delete this product?'))) return false">Delete</a></td>
						
					</tr>
				
				</c:forEach>
						
			</table>
		<a href="${pageContext.request.contextPath}/administration/addNewProduct">Add A New Product</a>  
		<a href="${pageContext.request.contextPath}/all">Back to home</a>
		<br>
		<br>
</body>
</html>