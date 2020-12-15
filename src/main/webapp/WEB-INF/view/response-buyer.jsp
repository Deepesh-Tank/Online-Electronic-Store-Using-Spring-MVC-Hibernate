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

<title>Buyer Message</title>
</head>
<body>

	 <h1><span class="yellow">SUPPORT BUYER</span></h1>
							<h2>AUTO POWER ELECTRONICS</h2>
 
			<table class="containerx">
				<tr>
					<th>Buyer Name</th>
					<th>Date</th>
					<th>Message/Query</th>
					<th>Respond</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${x}">
				
				 
					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/administration/writebuyer">
						<c:param name="productIdd" value="${tempCustomer.messageId}" />
					</c:url>					
					
					<tr>
						<td style="width:15%"> ${tempCustomer.buser} </td>
						<td style="width:15%"> ${fn:substring(tempCustomer.date, 0, 10) }</td>
						<td style="width:40%"> ${tempCustomer.messageInfo} </td>
						<td style="width:20%">
							<a href="${deleteLink}"> Reply</a>
						</td>
						
					</tr>
				
				</c:forEach>
						
			</table>
				
		 
	<a href="${pageContext.request.contextPath}/all">Home</a>
	<br><br>
</body>
</html>