<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">

<head>
	
	<title>Update the form</title>
 
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

<body>

<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">UPDATE DETAILS</h2>
                </div>
                <div class="card-body">
                    <form:form  action="${pageContext.request.contextPath}/register/finalProcessRegistration" modelAttribute="buyers" method="POST">
                    <form:hidden path="id"></form:hidden>
                        <div class="form-row">
                            <div class="name">First Name</div><br>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="firstName" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="firstName" /></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Last Name</div><br>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="lastName" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="lastName" /></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">City</div><br>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="city" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="city" /></label>
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
                            <div class="name">shop Name</div><br>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="shopName" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="shopName" /></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">License</div><br>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="shopLicense" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="shopLicense" /></label>
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
                         <div>
                            <button class="btn btn--radius-2 btn--red" type="submit">Done</button>
                        </div>
                        <div>
                        <br><br>
                         
                            
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
	 <form:form  id="contact" action="${pageContext.request.contextPath}/register/finalProcessRegistration" modelAttribute="buyers" method="POST">
	 <form:hidden path="id"></form:hidden>
	  					<h3>UPDATE INFO</h3>
	  					<fieldset>
						<label>First name:</label>
						<form:input path="firstName" />
						<form:errors path="firstName"/>
					</fieldset>
					<fieldset>

					
						<label>Last name</label>
						<form:input path="lastName" />
						<form:errors path="lastName"/>
					
					</fieldset>
					<fieldset>
					
						<label>contacts</label>
						<form:input path="contacts" />
						<form:errors path="contacts"/>
					</fieldset>
					<fieldset>
					
					
						<label>Shop name</label>
						<form:input path="shopName" />
						<form:errors path="shopName"/>
					</fieldset>
					<fieldset>
					
					
						<label>License Number of Shop</label>
						<form:input path="shopLicense" />
						<form:errors path="shopLicense"/>
					</fieldset>
					<fieldset>
					
						<label>City</label>
						<form:input path="city" />
						<form:errors path="city"/>
					</fieldset>
					<fieldset>
					
						<label>State</label>
						<form:input path="state" />
						<form:errors path="state"/>
					
					</fieldset>
					<fieldset>
					
						<label>Address</label>
						<form:input path="address" />
						<form:errors path="address"/>
					</fieldset>
					<fieldset>
					
						<label>Email</label>
						<form:input path="email" />
						<form:errors path="email"/>
					
					</fieldset>
					
					
						<fieldset>
					 	<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
						</fieldset>
					
		
	 </form:form>
	 </div>    
	 -->
</body>
</html>