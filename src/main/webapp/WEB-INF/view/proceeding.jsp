<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">

<head>
	
	<title>Shipping address</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link href="${pageContext.request.contextPath}/resources/foorm/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/resources/foorm/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="${pageContext.request.contextPath}/resources/foorm/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath}/resources/foorm/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="${pageContext.request.contextPath}/resources/foorm/css/main.css" rel="stylesheet" media="all">	 
		  
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

<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">FILL ADDRESS</h2>
                </div>
                <div class="card-body">
                    <form:form  action="${pageContext.request.contextPath}/buyer/furtherproceed" modelAttribute="ss" method="POST">
                    <form:hidden path="orderId"></form:hidden>
	 <form:hidden path="orderDescription"></form:hidden>
	 <form:hidden path="amount"></form:hidden>
	 <form:hidden path="buser"></form:hidden>
	 <form:hidden path="status"></form:hidden>
	 <form:hidden path="sww"></form:hidden>
	 <form:hidden path="date"></form:hidden>
                        <div class="form-row">
                            <div class="name">Address</div><br>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="address" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="address" /></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">State</div>
                            <div class="value">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <form:select path="state">

								<c:forEach var="oneschedule" items="${list}">
									<form:option value="${oneschedule.state}" label = "${ oneschedule.state }"></form:option>
								</c:forEach>
							</form:select>
						<label class="label--desc"> <form:errors path="state" /></label>
						<c:if test="${StateError != null}">
									<label class="label--desc">Select a state is necessary</label>
						</c:if>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button class="btn btn--radius-2 btn--red" type="submit">Done</button>
                        </div>
                        <div>
                        <br><br>
                        <a class="btn btn--radius-2 btn--red" style="text-decoration: none" href="${pageContext.request.contextPath}/buyer/declineorderlast">Back to home</a>
                            
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="${pageContext.request.contextPath}/resources/foorm/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="${pageContext.request.contextPath}/resources/foorm/vendor/select2/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/foorm/vendor/datepicker/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/foorm/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="${pageContext.request.contextPath}/resources/foorm/js/global.js"></script>


	<!--  
	 <div class="containery">
	 <form:form  id="contact" action="${pageContext.request.contextPath}/buyer/furtherproceed" modelAttribute="ss" method="POST">
	 <form:hidden path="orderId"></form:hidden>
	 <form:hidden path="orderDescription"></form:hidden>
	 <form:hidden path="amount"></form:hidden>
	 <form:hidden path="buser"></form:hidden>
	 <form:hidden path="status"></form:hidden>
	 <form:hidden path="sww"></form:hidden>
	 <form:hidden path="date"></form:hidden>
	  <h3>SHIPPING DETAILS</h3>
	  <fieldset>
						 <label>address:</label> 
						 <form:input path="address" />
						<form:errors path="address"/> 
		</fieldset>			 
		<fieldset>				
						
						<form:errors path="state" />
							<label> State</label> <form:select path="state">

								<c:forEach var="oneschedule" items="${list}">
									<form:option value="${oneschedule.state}" label = "${ oneschedule.state }"></form:option>
								</c:forEach>
							</form:select>
						<c:if test="${StateError != null}">
									Select a state is necessary
						</c:if>
			</fieldset>			
						
						
						
						
				 <fieldset>
					 	<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
						</fieldset>	

				
				 
	 </form:form>
	 </div>
	  <a href="${pageContext.request.contextPath}/buyer/declineorderlast">back to home page</a>
	  -->
</body>
</html>