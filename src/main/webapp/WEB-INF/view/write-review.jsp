 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Write Review</title>
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
                    <h2 class="title">WRITE REVIEW</h2>
                </div>
                <div class="card-body">
                    <form:form  action="${pageContext.request.contextPath}/buyer/reviewdone" modelAttribute="n" method="POST">
                    <form:hidden path="proId"></form:hidden>
	  <form:hidden path="rid"></form:hidden>
	  <form:hidden path="user"></form:hidden>
	  <form:hidden path="date"></form:hidden>
                        <div class="form-row">
                            <div class="name"> ${name} </div><br>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="review" placeholder="review" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="review"/></label>
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
	 <form:form  id="contact" action="${pageContext.request.contextPath}/buyer/reviewdone" modelAttribute="n" method="POST">
	  <form:hidden path="proId"></form:hidden>
	  <form:hidden path="rid"></form:hidden>
	  <form:hidden path="user"></form:hidden>
	  <form:hidden path="date"></form:hidden>
	  <h3>WRITE REVIEW</h3>
	  <fieldset> Product Name : ${name} </fieldset>
	  <fieldset>
						 <label>review</label> 
						 <form:input path="review" />
						<form:errors path="review"/> 
				</fieldset>	 
					 <fieldset>
					 	<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
						</fieldset>
	 </form:form>
	 </div>
	 <a href="${pageContext.request.contextPath}/all">back to home page</a>
	 -->
</body>
</html>