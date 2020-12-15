<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AUTOPOWER ONLINE WHOLE SALE STORE</title>

<style>
 body {
    	background-image: url('${pageContext.request.contextPath}/resources/images/backgroung.jpg');
  		background-repeat: no-repeat;
  		background-attachment: fixed;  
  		background-position: center;
  		background-size : cover;
  		height : 100%;
		}
 
 
</style>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/drop_down.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/logout.css" />



  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Day - v2.1.0
  * Template URL: https://bootstrapmade.com/day-multipurpose-html-template-for-free/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->



</head>
<body>























	<br>
			
							 
      
     
 
	 
	<br>
	<br>
	<br>
	<br>
	<!-- ============= BEGIN BUYER SECTION ============= -->
	<security:authorize access="hasRole('BUYER')"> 
	<!-- ======= Top Bar ======= -->
  <div id="topbar" class="d-none d-lg-flex align-items-center fixed-top ">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="icofont-envelope"></i> <a href="mailto:autopower@outlook.com">autopower@outlook.com</a>
        <i class="icofont-phone"></i> +91 9928681900
      </div>
      <div class="social-links">
        <a href="#" class="twitter"><i class="icofont-twitter"></i></a>
        <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
        <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
        <a href="#" class="skype"><i class="icofont-skype"></i></a>
        <a href="#" class="linkedin"><i class="icofont-linkedin"></i></i></a>
      </div>
    </div>
  </div>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="">Auto Power</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
         <!-- <li class="active"><a href="index.html">Home</a></li> --> 
          <li><a href="#about">About</a></li>
          <li><a href="${pageContext.request.contextPath}/register/beginFinalRegistrationProcess">Update Profile</a></li>
          <li class="drop-down"><a href="">Products</a>
            <ul>
            <li><a href="${pageContext.request.contextPath}/buyer/seeProducts">Buy</a></li>
            <li><a href="${pageContext.request.contextPath}/buyer/writeReview">Write Review</a></li>    
            </ul>
          </li>
          <li class="drop-down"><a href="">Orders</a>
            <ul>
            <li><a href="${pageContext.request.contextPath}/buyer/seepins">Pins</a></li>
            <li><a href="${pageContext.request.contextPath}/buyer/seeOrders">All Orders</a></li>    
            </ul>
          </li>
          
          <li class="drop-down"><a href="">Help</a>
            <ul>
              <li><a href="${pageContext.request.contextPath}/buyer/messageinsert">Write Message</a></li>
              <li><a href="${pageContext.request.contextPath}/buyer/seeresponseadmin">Response From Admin</a></li>
            </ul>
          </li>
           
          <li><form:form id="xxx" action="${pageContext.request.contextPath}/logout" method="POST">
			<a  href="#" onclick="document.getElementById('xxx').submit()">Logout</a>
		 </form:form></li>

        </ul>
       
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
  
  
  	<!--  
	<div class="dropdown">
  	<button class="dropbtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Menu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
  	<div class="dropdown-content">
    <a href="${pageContext.request.contextPath}/register/beginFinalRegistrationProcess">Update Your Personal Information</a>
    <a href="${pageContext.request.contextPath}/buyer/seeProducts">See products to buy </a>
    <a href="${pageContext.request.contextPath}/buyer/seeOrders">All Orders</a>
    <a href="${pageContext.request.contextPath}/buyer/writeReview">Write review</a>
    <a href="${pageContext.request.contextPath}/buyer/seepins">See pins for verified orders</a>
    <a href="${pageContext.request.contextPath}/buyer/messageinsert">Support message</a>
    <a href="${pageContext.request.contextPath}/buyer/seeresponseadmin">Message from admin</a>
  	</div>
	</div>
	-->	 
	
	
	
		<!-- Add a link to point to /leaders ... this is for the managers -->
		
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>	 
	<!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="footer-info">
              <h3>Auto Power</h3>
              <p>
                Gali Patte Wali , Naya Bazar <br>
                Delhi - 110 006<br><br>
                <strong>Phone:</strong> +91 9928681900<br>
                <strong>Email:</strong> autopower@outlook.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>
          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
               
              <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/buyer/seeProducts">Buy Products</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/buyer/seeOrders">All Orders</a></li>
            </ul>
          </div>
          <div class="col-lg-4 col-md-6 footer-newsletter">
          <section id="about" class="about">
            <h4 class="about">About Us</h4>
           	Auto Power Electronics was established in 2017.<br>
  			Today, We are serving across many states over India.<br>
  			Our Product are of highest quality along with ISO Certification.<br>
  			HeadQuaters are located at Gali Patte Wali , Naya Bazar , Delhi - 110006.<br>
  			</section>
          </div>
        </div>
      </div>
    </div>
  </footer><!-- End Footer -->
	</security:authorize>	
	<!-- ======== END OF THE BUYER SECTION ========= -->
	
	
	
	
	
	
	<!-- ========= BEGIN TRANSPORT ORDER ========== -->
	<security:authorize access="hasRole('TRANSPORT')">
	<header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center">
      <h1 class="logo mr-auto"><a href="">Auto Power</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
         <!-- <li class="active"><a href="index.html">Home</a></li> --> 
          <li><a href="#about">About</a></li>
          <li><a href="${pageContext.request.contextPath}/transportation/updateTransportationDetails">Update Profile</a></li>
          <li class="drop-down"><a href="">Orders</a>
            <ul>
            <li><a href="${pageContext.request.contextPath}/transportation/seeActiveTransportationOrders">Active</a></li>
            <li><a href="${pageContext.request.contextPath}/transportation/seeAllTransportationOrders">Completed</a></li>    
            </ul>
          </li>
        
          <li class="drop-down"><a href="">Help</a>
            <ul>
              <li><a href="${pageContext.request.contextPath}/transportation/messageinsert">Write Message</a></li>
              <li><a href="${pageContext.request.contextPath}/transportation/seeresponseadmin">Response From Admin</a></li>
            </ul>
          </li>
           
          <li><form:form id="xxx" action="${pageContext.request.contextPath}/logout" method="POST">
			<a  href="#" onclick="document.getElementById('xxx').submit()">Logout</a>
		 </form:form></li>

        </ul>
       
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
	
	
	<div id="topbar" class="d-none d-lg-flex align-items-center fixed-top ">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="icofont-envelope"></i> <a href="mailto:autopower@outlook.com">autopower@outlook.com</a>
        <i class="icofont-phone"></i> +91 9928681900
      </div>
      <div class="social-links">
        <a href="#" class="twitter"><i class="icofont-twitter"></i></a>
        <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
        <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
        <a href="#" class="skype"><i class="icofont-skype"></i></a>
        <a href="#" class="linkedin"><i class="icofont-linkedin"></i></i></a>
      </div>
    </div>
  </div>
	 
	<!--  <div class="dropdown">
  	<button class="dropbtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Menu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
  	<div class="dropdown-content">
    <a href="${pageContext.request.contextPath}/transportation/updateTransportationDetails">Update Transport Company profile</a>
    <a href="${pageContext.request.contextPath}/transportation/seeActiveTransportationOrders">Check Active Orders</a>
    <a href="${pageContext.request.contextPath}/transportation/seeAllTransportationOrders">Check All Orders</a>
    <a href="${pageContext.request.contextPath}/transportation/messageinsert">Support message</a>
    <a href="${pageContext.request.contextPath}/transportation/seeresponseadmin">Message from admin</a>
  	</div>
		</div>
		
		--->
		 
		 <br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>	 
	<!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="footer-info">
              <h3>Auto Power</h3>
              <p>
                Gali Patte Wali , Naya Bazar <br>
                Delhi - 110 006<br><br>
                <strong>Phone:</strong> +91 9928681900<br>
                <strong>Email:</strong> autopower@outlook.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>
          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
               
               
              <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/transportation/seeActiveTransportationOrders">Active Orders</a></li>
            </ul>
          </div>
          <div class="col-lg-4 col-md-6 footer-newsletter">
          <section id="about" class="about">
            <h4 class="about">About Us</h4>
           	Auto Power Electronics was established in 2017.<br>
  			Today, We are serving across many states over India.<br>
  			Our Product are of highest quality along with ISO Certification.<br>
  			HeadQuaters are located at Gali Patte Wali , Naya Bazar , Delhi - 110006.<br>
  			</section>
          </div>
        </div>
      </div>
    </div>
  </footer><!-- End Footer -->
	</security:authorize>	
	<!-- ========== END OF THE TRANSPORT SECTION =========== -->
	
	
	
	
	<!-- ======= ADMIN SECTION ONLY ======== -->
	<security:authorize access="hasRole('ADMIN')">
	
	<!-- ======= Top Bar ======= -->
  <div id="topbar" class="d-none d-lg-flex align-items-center fixed-top ">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="icofont-envelope"></i> <a href="mailto:autopower@outlook.com">autopower@outlook.com</a>
        <i class="icofont-phone"></i> +91 9928681900
      </div>
      <div class="social-links">
        <a href="#" class="twitter"><i class="icofont-twitter"></i></a>
        <a href="#" class="facebook"><i class="icofont-facebook"></i></a>
        <a href="#" class="instagram"><i class="icofont-instagram"></i></a>
        <a href="#" class="skype"><i class="icofont-skype"></i></a>
        <a href="#" class="linkedin"><i class="icofont-linkedin"></i></i></a>
      </div>
    </div>
  </div>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="">Auto Power</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
         <!-- <li class="active"><a href="index.html">Home</a></li> --> 
          <li><a href="#about">About</a></li>
          <li><a href="${pageContext.request.contextPath}/administration/listAllProduct">Update Products</a></li>
          <li><a href="${pageContext.request.contextPath}/administration/seeUnverifiedOrders">Verify Orders</a></li>
          <li class="drop-down"><a href="">Add</a>
            <ul>
            <li><a href="${pageContext.request.contextPath}/administration/addNewProduct">New Product</a></li>
            <li><a href="${pageContext.request.contextPath}/administration/addNewState">New State</a></li>    
            </ul>
          </li>
          <li class="drop-down"><a href="">List</a>
            <ul>
              <li><a href="${pageContext.request.contextPath}/administration/listAllProduct">All Products</a></li>
              <li><a href="${pageContext.request.contextPath}/administration/seeallbuyers">All Buyers</a></li>
              <li><a href="${pageContext.request.contextPath}/administration/seealltransporters">All Transport Companies</a></li>
              <li><a href="${pageContext.request.contextPath}/administration/seeallstates">All States</a></li>
            </ul>
          </li>
          <li class="drop-down"><a href="">Messages</a>
            <ul>
              <li><a href="${pageContext.request.contextPath}/administration/responsemessageb">From Buyers</a></li>
              <li><a href="${pageContext.request.contextPath}/administration/responsemessaget">From Transport Companies</a></li>
            </ul>
          </li>
          <li class="drop-down"><a href="">Orders</a>
            <ul>
              <li><a href="${pageContext.request.contextPath}/administration/seeMidOrders">in Transportation</a></li>
              <li><a href="${pageContext.request.contextPath}/administration/seeDoneOrders">delivered</a></li>
            </ul>
          </li>
          <li><form:form id="xxx" action="${pageContext.request.contextPath}/logout" method="POST">
			<a  href="#" onclick="document.getElementById('xxx').submit()">Logout</a>
		 </form:form></li>

        </ul>
       
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
		 
		<!--- <div class="dropdown">
  	<button class="dropbtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Menu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
  	<div class="dropdown-content">
    		<a href="${pageContext.request.contextPath}/administration/addNewState">Add a new state to operate in</a>		 
			<a href="${pageContext.request.contextPath}/administration/addNewProduct">Add a new Product</a>		 
			<a href="${pageContext.request.contextPath}/administration/listAllProduct">List All Products</a>		 
			<a href="${pageContext.request.contextPath}/administration/seeUnverifiedOrders">See All Unverified Orders</a>		 
			<a href="${pageContext.request.contextPath}/administration/seeMidOrders">Orders that are in process</a>		 
			<a href="${pageContext.request.contextPath}/administration/seeDoneOrders">Orders Delievered</a>
			<a href="${pageContext.request.contextPath}/administration/seeallbuyers">See all registered Buyers</a>
			<a href="${pageContext.request.contextPath}/administration/seealltransporters">See all registered Transport Companies</a>		 
			<a href="${pageContext.request.contextPath}/administration/responsemessageb">response the support buyer</a>
			<a href="${pageContext.request.contextPath}/administration/responsemessaget">response the support transporter</a>
  	</div>
		</div> 
		
		--->
		 
	
	
	
	<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>



<!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="footer-info">
              <h3>Auto Power</h3>
              <p>
                Gali Patte Wali , Naya Bazar <br>
                Delhi - 110 006<br><br>
                <strong>Phone:</strong> +91 9928681900<br>
                <strong>Email:</strong> autopower@outlook.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>
          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
               
              <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/administration/seeUnverifiedOrders">Verify orders</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/administration/responsemessageb">Respond to users</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/administration/responsemessaget">Respond to buyers</a></li>
            </ul>
          </div>
          <div class="col-lg-4 col-md-6 footer-newsletter">
          <section id="about" class="about">
            <h4 class="about">About Us</h4>
           	Auto Power Electronics was established in 2017.<br>
  			Today, We are serving across many states over India.<br>
  			Our Product are of highest quality along with ISO Certification.<br>
  			HeadQuaters are located at Gali Patte Wali , Naya Bazar , Delhi - 110006.<br>
  			</section>
          </div>
        </div>
      </div>
    </div>
  </footer><!-- End Footer -->
	
		 
			
		 
	</security:authorize>	
	<!-- ======= END OF ADMIN SECTION ======== -->


  <br>
<br>
</body>
</html>