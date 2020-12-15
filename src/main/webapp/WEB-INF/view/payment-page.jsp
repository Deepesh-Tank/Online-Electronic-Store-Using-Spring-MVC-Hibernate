<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">

<head>
	
	<title>Payment Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Icons font CSS-->
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
                    <h2 class="title">PAYMENT</h2>
                </div>
                <div class="card-body">
                    <form:form  action="${pageContext.request.contextPath}/buyer/furtherproceedpayment" modelAttribute="oid" method="POST">
                    <form:hidden path="Pid"></form:hidden>
	 				<form:hidden path="Oid"></form:hidden>
                        <div class="form-row">
                        <h5>Send Payment to :8989899945 / SBI Account : 3330119899</h5>
                        <h5>The Assigned TransPorter is ${A.name } | ${A.company}</h5>
                        <h5>The Total Shipping Amount : ${TSA} Rs to paid at the time of receiving package.</h5>
                        <h5>The Total Product Amount :  ${TPA} Rs .</h5>
                        <h5>Amount To Paid : ${TA} Rs.</h5>
                        <br>
                        <h5>Enter Transaction Reference Number</h5>
                        
                            
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="info" placeholder="Transaction Reference Number" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="info" /></label>
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
	 <form:form  id="contact" action="${pageContext.request.contextPath}/buyer/furtherproceedpayment" modelAttribute="oid" method="POST">
	 <form:hidden path="Pid"></form:hidden>
	 <form:hidden path="Oid"></form:hidden>
	  <h3>TRANSACTION DETAILS</h3>
				  <fieldset>
						 <label>Transaction Reference Number</label> 
						 <form:input path="info" />
						<form:errors path="info"/> 
					  </fieldset>
<fieldset>
					 	<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
						</fieldset>	
	<br>The Assigned TransPorter is ${A.name } | ${A.company}<br>
	 The Total Shipping Amount : ${TSA} Rs to paid at the time of receiving package.<br>
	 The Total Product Amount :  ${TPA} Rs .<br>
	 Amount To Paid : ${TA} Rs.<br>			 
	 </form:form>
	 
	 
	 </div>
	 <a href="${pageContext.request.contextPath}/buyer/declineorderlast">back to home page</a>
	 -->
</body>
</html>