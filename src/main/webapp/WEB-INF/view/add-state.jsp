<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
	<title>Add State</title>

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
                    <h2 class="title">Add New Product</h2>
                </div>
                <div class="card-body">
                    <form:form  action="${pageContext.request.contextPath}/administration/proceedaddstate" modelAttribute="ord" method="POST">
                     
                     
                        <div class="form-row">
                            <div class="name">State</div>
                            <div class="value">
                                <div class="input-group">
                                    <form:input path="state" class="input--style-5" />
                                    <label class="label--desc"> <form:errors path="state" /></label>
                                </div>
                            </div>
                        </div>
                         
                      <!--    <div class="form-row m-b-55">
                            <div class="name">Phone</div>
                            <div class="value">
                                <div class="row row-refine">
                                    <div class="col-3">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="area_code">
                                            <label class="label--desc">Area Code</label>
                                        </div>
                                    </div>
                                    <div class="col-9">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="phone">
                                            <label class="label--desc">Phone Number</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
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
	
	
	
	
	
 
	
	

</body>

</html>










