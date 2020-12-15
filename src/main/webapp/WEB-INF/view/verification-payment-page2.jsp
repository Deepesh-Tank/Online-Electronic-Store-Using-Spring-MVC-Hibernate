 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verification</title>
<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/tables_formats.css" />
		  <link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style_link.css" />
</head>
<body>
<div >
	The Payment info / Transaction number is ${pro.info }
	<br>
	<br>
	<br>
	<!-- construct an "update" link with customer id -->
	<c:url var="updateLink" value="/administration/successverified">
						<c:param name="OrderID" value="${xx}" />
					</c:url>					

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/administration/deniedverified">
						<c:param name="OrderID" value="${xx}" />
					</c:url>	
					
					
						<a href="${updateLink}">verified</a>
							<br>
							<br>
							<br>
							<a href="${deleteLink}">Denied</a>
							</div>
</body>
</html>