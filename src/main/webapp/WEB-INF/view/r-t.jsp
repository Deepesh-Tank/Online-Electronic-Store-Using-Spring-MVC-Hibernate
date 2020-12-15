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


<title>Insert title here</title>
</head>
<body>

<h1><span class="yellow">RESPONSE FROM ADMINS</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
			<table class="containerx">
				<tr>
					<th>Your Message</th>
					<th>Date</th>
					<th>Admin Reply</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${x}">
				
					<tr>
						<td> ${tempCustomer.messageInfo} </td>
						<td> ${fn:substring(tempCustomer.date, 0, 10) } </td>
						<td> ${tempCustomer.responseInfo} </td>
						 
						 
						
					</tr>
				
				</c:forEach>
						
			</table>
	 
		<a href="${pageContext.request.contextPath}/all">Back to home</a>
</body>
</html>