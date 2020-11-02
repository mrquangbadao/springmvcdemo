<!DOCTYPE html>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
	<title>CV_VIEW</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<c:url value="/resources/cv/css/bootstrap.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/cv/vendors/linericon/style.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/cv/css/font-awesome.min.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/cv/vendors/owl-carousel/owl.carousel.min.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/cv/vendors/lightbox/simpleLightbox.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/cv/vendors/nice-select/css/nice-select.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/cv/vendors/animate-css/animate.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/cv/vendors/popup/magnific-popup.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/cv/vendors/flaticon/flaticon.css"/>"/>
        
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <!-- main css -->
        <link rel="stylesheet" href="<c:url value="/resources/cv/css/style.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/cv/css/responsive.css"/>"/>
        
        <style>
		        /* unvisited link */
		a:link {
		  color: red;
		}
		
		/* visited link */
		a:visited {
		  color: green;
		}
		
		/* mouse over link */
		a:hover {
		  color: hotpink;
		}
		
		/* selected link */
		a:active {
		  color: blue;
		}
        
        </style>
    </head>
    <body>
        
        <!--================Header Menu Area =================-->
        <header class="header_area">
            <div class="main_menu">
            	<nav class="navbar navbar-expand-lg navbar-light">
					<div class="container box_1620">
						<!-- Brand and toggle get grouped for better mobile display -->
						<a class="navbar-brand logo_h" href="index.html"><img src="<c:url value="/resources/cv/img/logo.png"/>" alt=""></a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
							<ul class="nav navbar-nav menu_nav ml-auto">
								<li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li> 
								<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">Log Out</a></li> 
								<!-- <li class="nav-item"><a class="nav-link" href="about-us.html">About</a></li> 
								<li class="nav-item"><a class="nav-link" href="services.html">Services</a></li> 
								<li class="nav-item submenu dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link" href="portfolio.html">Portfolio</a></li>
										<li class="nav-item"><a class="nav-link" href="elements.html">Elements</a></li>
									</ul>
								</li> 
								<li class="nav-item submenu dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
										<li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
									</ul>
								</li> 
								<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li> -->
							</ul>
						</div> 
					</div>
            	</nav>
            </div>
        </header>
        <!--================Header Menu Area =================-->
        
       <!--================Home Banner Area =================-->
        <section class="home_banner_area">
           	<div class="container box_1620">
           		<div class="banner_inner d-flex align-items-center">
					<div class="banner_content">
						<div class="media">
						
							<div class="media-body">
								<div class="personal_text">
									<h3>Xin chào, ${userLogin.username } </h3>
									<h6>Bạn chưa có trang cá nhân, bấm vào <a href = "${pageContext.request.contextPath}/user-detail">đây</a>  để tạo trang cá nhân của riêng mình nhé</h6>
									
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
        </section>
        <!--================End Home Banner Area =================-->
            
        
        <!--================Footer Area =================-->
        <footer class="footer_area p_120">
        	<div class="container">
        		<div class="row footer_inner">
        			<div class="col-lg-5 col-sm-6">
        				<aside class="f_widget ab_widget">
        					<div class="f_title">
        						<h3>About Me</h3>
        					</div>
        					<p>Do you want to be even more successful? Learn to love learning and growth. The more effort you put into improving your skills,</p>
        					<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
        				</aside>
        			</div>
        			<div class="col-lg-5 col-sm-6">
        				<aside class="f_widget news_widget">
        					<div class="f_title">
        						<h3>Newsletter</h3>
        					</div>
        					<p>Stay updated with our latest trends</p>
        					<div id="mc_embed_signup">
                                <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe_form relative">
                                	<div class="input-group d-flex flex-row">
                                        <input name="EMAIL" placeholder="Enter email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address '" required="" type="email">
                                        <button class="btn sub-btn"><span class="lnr lnr-arrow-right"></span></button>		
                                    </div>				
                                    <div class="mt-10 info"></div>
                                </form>
                            </div>
        				</aside>
        			</div>
        			<div class="col-lg-2">
        				<aside class="f_widget social_widget">
        					<div class="f_title">
        						<h3>Follow Me</h3>
        					</div>
        					<p>Let us be social</p>
        					<ul class="list">
        						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
        						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
        						<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
        						<li><a href="#"><i class="fa fa-behance"></i></a></li>
        					</ul>
        				</aside>
        			</div>
        		</div>
        	</div>
        </footer>
        <!--================End Footer Area =================-->
        
        
        
        
        
        
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="<c:url value="/resources/cv/js/jquery-3.3.1.min.js"/>"/></script>
        <script src="<c:url value="/resources/cv/js/popper.js"/>"/></script>
        <script src="<c:url value="/resources/cv/js/bootstrap.min.js"/>"/></script>
        <script src="<c:url value="/resources/cv/js/stellar.js"/>"/></script>
        <script src="<c:url value="/resources/cv/vendors/lightbox/simpleLightbox.min.js"/>"/></script>
        <script src="<c:url value="/resources/cv/vendors/nice-select/js/jquery.nice-select.min.js"/>"/></script>
        <script src="<c:url value="/resources/cv/vendors/isotope/imagesloaded.pkgd.min.js"/>"/></script>
        <script src="<c:url value="/resources/cv/vendors/isotope/isotope.pkgd.min.js"/>"/></script>
        <script src="<c:url value="/resources/cv/vendors/owl-carousel/owl.carousel.min.js"/>"/></script>
        <script src="<c:url value="/resources/cv/vendors/popup/jquery.magnific-popup.min.js"/>"/></script>
        <script src="<c:url value="/resources/cv/js/jquery.ajaxchimp.min.js"/>"/></script>
        <script src="<c:url value="/resources/cv/vendors/counter-up/jquery.waypoints.min.js"/>"/></script>
        <script src="<c:url value="/resources/cv/vendors/counter-up/jquery.counterup.min.js"/>"/></script>
        <script src="<c:url value="/resources/cv/js/mail-script.js"/>"/></script>
        <script src="<c:url value="/resources/cv/js/theme.js"/>"/></script>
    </body>
</html>