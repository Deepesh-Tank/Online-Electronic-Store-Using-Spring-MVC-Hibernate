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

<title>States</title>
</head>
<body>

<h1><span class="yellow">ALL STATES</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
			<table class="containerx">
				<tr>
					<th>State Name</th>
				 
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${ord}">						
					<tr>
						<td style="width:8%"> ${tempCustomer.state} </td>
				
					</tr>
				
				</c:forEach>
						
			</table>
				
		 
	<a href="${pageContext.request.contextPath}/all">Back to home</a><br><br><br>
</body>
</html>