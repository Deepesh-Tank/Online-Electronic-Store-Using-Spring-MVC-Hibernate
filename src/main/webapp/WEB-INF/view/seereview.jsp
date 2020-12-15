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

<title>Review</title>
</head>
<body>

	<h1><span class="yellow">REVIEWS</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
		 <table class="containerx">
		 <tr>
					<th>User Name</th>
					<th>Review</th>
					<th>Date of Review</th>
					 
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${thelist}"> 								
					<tr>
						<td> ${tempCustomer.user} </td>
						<td> ${tempCustomer.review} </td>
						<td>${fn:substring(tempCustomer.date, 0, 10) }</td>
					</tr>
				
				</c:forEach>
		 </table>
				
						
			 
		 
	 <a href="${pageContext.request.contextPath}/buyer/seeProducts">back to cart</a>
</body>
</html>