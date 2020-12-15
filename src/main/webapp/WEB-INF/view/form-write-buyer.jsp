<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">

<head>
	
	<title>Respond to Buyer</title>
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
                    <h2 class="title">REPLY TO HELP</h2>
                </div>
                <div class="card-body">
                    <form:form  action="${pageContext.request.contextPath}/administration/buyerresponsedone" modelAttribute="x" method="POST">
                    <form:hidden path="messageId"></form:hidden>
	 <form:hidden path="status"></form:hidden>
	 <form:hidden path="messageInfo"></form:hidden>
	 <form:hidden path="buser"></form:hidden>
	 <form:hidden path="date"></form:hidden>
                        <div class="form-row">
                       <h5>Message: ${x.messageInfo }</h5>  <br>  <br>
                           
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="responseInfo" placeholder="reply" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="responseInfo" /></label>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button class="btn btn--radius-2 btn--red" type="submit">Done</button>
                        </div>
                        <div>
                        <br><br>
                        <a class="btn btn--radius-2 btn--red" style="text-decoration: none" href="${pageContext.request.contextPath}/all">Back to home</a>
                            
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
	 <form:form  id="contact" action="${pageContext.request.contextPath}/administration/buyerresponsedone" modelAttribute="x" method="POST">
	 <form:hidden path="messageId"></form:hidden>
	 <form:hidden path="status"></form:hidden>
	 <form:hidden path="messageInfo"></form:hidden>
	 <form:hidden path="buser"></form:hidden>
	 <form:hidden path="date"></form:hidden>
	 <h3>RESPOND TO BUYER</h3>
	 <fieldset>
						 <label>Message :</label> 
						 <form:input path="responseInfo" />
						<form:errors path="responseInfo"/> 
					</fieldset>
					
					
						<fieldset>
					 	<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
						</fieldset>	
					 
			${x.date }
			${x.messageId}
			${x.status }
			${x.buser }
			${x.messageInfo }
	 </form:form>
	 </div>
	 
	 -->
	   
</body>
</html>