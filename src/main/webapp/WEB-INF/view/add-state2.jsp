<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">

<head>
	
	<title>Registration Page</title>
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
	 <form:form id="contact" action="${pageContext.request.contextPath}/administration/proceedaddstate" modelAttribute="ord" method="POST">
	  
						<h3>ADD A NEW STATE</h3>
				 
				 		<fieldset>
						<label>State name:</label>
						<form:input path="state" />
						<form:errors path="state"/>
						<br>
						<c:if test="${exsists != null}">

										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											${exsists}</div>

						</c:if>
						</fieldset>
					
						<fieldset>
					 	<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
						</fieldset>
							
	 </form:form>
	 </div>
	     <a href="${pageContext.request.contextPath}/all">Back to home</a>
</body>
</html>