 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update form</title>
 
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
                    <h2 class="title">UPDATE DETAILS</h2>
                </div>
                <div class="card-body">
                    <form:form  action="${pageContext.request.contextPath}/transportation/updateDetailsTransport" modelAttribute="transport" method="POST">
                    <form:hidden path="userName"></form:hidden>
                        <div class="form-row">
                            <div class="name">Company</div><br>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="company" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="company" /></label>
                                </div>
                            </div>
                        </div>
                        <c:if test = "${ transport.state == null }">
                        <div class="form-row">
                            <div class="name">State</div>
                            <div class="value">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                       <form:select path="state">
								<form:option value="${ null }" label = "Select a State from this List (*)"></form:option>
								<c:forEach var="oneschedule" items="${statelist}">
									<form:option value="${oneschedule.state}" label = "${ oneschedule.state }"></form:option>
								</c:forEach>
							</form:select>
						<c:if test="${StateError != null}">
									Select a state is necessary
						</c:if>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:if>
                        <c:if test = "${tempCustomer.status != 0 }">
                        <form:hidden path="state"></form:hidden>
                        </c:if>
                        <div class="form-row">
                            <div class="name">Contacts</div><br>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="contacts" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="contacts" /></label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Permit</div><br>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="permit" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="permit" /></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Price/Weight</div><br>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="pw" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="pw" /></label>
                                </div>
                            </div>
                        </div>
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
                            <div class="name">Email</div><br>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="email" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="email" /></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Owner Name</div><br>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="name" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="name" /></label>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button class="btn btn--radius-2 btn--red" type="submit">Done</button>
                        </div>
                        <div>
                        <br><br>
                       <!--   <a class="btn btn--radius-2 btn--red" style="text-decoration: none" href="${pageContext.request.contextPath}/buyer/declineorderlast">Back to home</a>-->
                            
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
	 <form:form id="contact" action="${pageContext.request.contextPath}/transportation/updateDetailsTransport" modelAttribute="transport" method="POST">
	  <form:hidden path="userName"></form:hidden>
			<h3>UPDATE FORM</h3>
				
						
						<fieldset>
						<label>Transporter Company</label>
						<form:input path="company" />
						<form:errors path="company"/>
					</fieldset>
					<fieldset>
						<form:errors path="state" />
							<label> State</label> 
							<br>
							<form:select path="state">
								<form:option value="${ null }" label = "Select a State from this List (*)"></form:option>
								<c:forEach var="oneschedule" items="${statelist}">
									<form:option value="${oneschedule.state}" label = "${ oneschedule.state }"></form:option>
								</c:forEach>
							</form:select>
						<c:if test="${StateError != null}">
									Select a state is necessary
						</c:if>
					
						</fieldset>
					<fieldset>
						<label>Contacts</label>
						<form:input path="contacts" />
						<form:errors path="contacts"/>
					
					</fieldset>
					<fieldset>
					<label>Permit Number</label>
						<form:input path="permit" />
						<form:errors path="permit"/>
					</fieldset>
					<fieldset>
						<label>Price per weight</label>
						<form:input path="pw" />
						<form:errors path="pw"/>
					</fieldset>
					<fieldset>
						<label>Office Address</label>
						 <form:input path="address" />
						<form:errors path="address"/>
					</fieldset> 
					<fieldset>
						<label>Email</label>
						 <form:input path="email" />
						<form:errors path="email"/>
				</fieldset>
					
				<fieldset>
						<label>Transporter Name</label>
						<form:input path="name" />
						<form:errors path="name"/>
					</fieldset>
					<fieldset>
					 <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
					 </fieldset>
				<br>
	 </form:form>
	 </div>
	 <a href="${pageContext.request.contextPath}/all">Back to home</a>
	  <br>
	  <br>
	  -->
</body>
</html>