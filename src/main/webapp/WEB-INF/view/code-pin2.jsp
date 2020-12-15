<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">

<head>
	
	<title>Registration Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Reference Bootstrap files -->
	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/form.css" />
		  <link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style_link.css" />
		  <style>
		  body {
    		background-image: url('${pageContext.request.contextPath}/resources/images/backgroung.jpg');
  			background-repeat: no-repeat;
  			background-attachment: fixed;  
  			background-position: center;
  			background-color:#1F2739;
		}
		</style>

</head>

<body>

	  
	 
	 <div class="containery">
	 <form:form  id="contact" action="${pageContext.request.contextPath}/transportation/checkpin" modelAttribute="x" method="POST">  
	  		
	  		<form:hidden path="orderId"></form:hidden>
	  		<h3>Order ID : ${x.orderId }</h3>
	  		<fieldset>
	  		<form:input path="pin" />
			<form:errors path="pin"/>
			</fieldset>
	  		<fieldset>
					 	<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
						</fieldset>
	  		
	</form:form>  
	</div>
	  <a href="${pageContext.request.contextPath}/all">back to home page</a>
</body>
</html>