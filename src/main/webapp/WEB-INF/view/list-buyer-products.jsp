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

<title>Buy Products</title>
</head>
<body>

	 
		<h1><span class="yellow">ITEM CATALOG</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
 
		
			<table class="containerx">
				<tr>
					<th>Product Name</th>
					<th>Price </th>
					<th>Weight </th>
					<th>Description</th>
					<th>Perform Action</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${pro}">
				
					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/buyer/addtocart">
						<c:param name="productIdd" value="${tempCustomer.productId}" />
					</c:url>					

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/buyer/seereview">
						<c:param name="productIdd" value="${tempCustomer.productId}" />
					</c:url>					
					
					<tr>
						<td style="width: 18%">${tempCustomer.productName}</td>
						<td>${tempCustomer.price} Rs</td>
						<td>${tempCustomer.weight} Kg</td>
						<td style="width: 36%">${tempCustomer.productDescription} </td>
						<td>
							<!-- display   <a href="${deleteLink}"
							   onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>   the update link -->
							<a href="${updateLink}" onclick="if (!(confirm(' ${tempCustomer.productName} will be added to cart ?'))) return false">Add to Cart</a>
						 
							<a href="${deleteLink}">  reviews </a>
						</td>
						
					</tr>
				
				</c:forEach>
						
			</table>
				
	 <a href="${pageContext.request.contextPath}/buyer/backfromcart">back to home page</a>
	 <br>
	 <br>
	<a href="${pageContext.request.contextPath}/buyer/viewCart">proceed to next step</a>
</body>
</html>