<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="ocgr" %>
<%@ page errorPage="error.jsp"%>

<%@ include file="COMMON_PAGES/control_session.jsp" %>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en-US">
<!--<![endif]-->

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Home | Open Commerce</title>
	<meta name="description" content="An online marketplace for professional and industrial use">
	<meta name="keywords" content="e-commerce, online store, order, professional, industry, tools, machinery" />
	<meta name="author" content="Codrops, ismgroup42" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="COMMON_PAGES/page_head.html" %>
</head>

<body>

<%@ include file="COMMON_PAGES/navbar.jsp" %>

<% 
if (session.getAttribute("user-object") == null) {
%>
	<header class="hero">
		<div class="carousel js-flickity">
			<div class="carousel-cell" style="background-image: url(img/hero-bg-01.jpg);">
				<div class="hero-bg">
					<div class="container">
						<div class="row">
							<div class="col-md-12 text-center">
								<h1 class="wp1">Open Commerce. A platform made by professionals, for professionals.</h1>
								<a href="#intro" class="btn primary wp2">Learn more</a>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8 col-md-offset-2 hero-intro-text wp3">
								<p>Find the offer that is just <span class="bold italic">right</span> for you. </p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-cell" style="background-image: url(img/hero-bg-02.jpg);">
				<div class="hero-bg">
					<div class="container">
						<div class="row">
							<div class="col-md-12 text-center">
								<h1 class="wp1">Powerful tools, at your hands. Ready to deliver.</h1>
								<a href="register.html" class="btn primary wp2">Get Started Now</a>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8 col-md-offset-2 hero-intro-text wp3">
								<p>Search, Filter, Compare, Order. Instantaneously.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-cell" style="background-image: url(img/hero-bg-03.jpg);">
				<div class="hero-bg">
					<div class="container">
						<div class="row">
							<div class="col-md-12 text-center">
								<h1 class="wp1">Open Commerce for vendors. <span class="bold italic">Simplifying transactions, a click at a time.</span> </h1>
								<a href="register.html" class="btn primary wp2">Register Now</a>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8 col-md-offset-2 hero-intro-text wp3">
								<p>A payment model that's the right fit for your needs, now.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class='mouse-container'>
			<a href="#intro">
				<div class='mouse'>
					<span class='scroll-down'></span>
				</div>
			</a>
		</div>
	</header>
	<!-- SECTION: Intro -->
	<section class="collective has-padding" id="intro">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h4>The Platform</h4>
				</div>
				<div class="col-md-9 wp3">
					<h1>Introducing Open Commerce</h1>
					<p>Opencommerce.gr is the e-commerce platform that was designed with industry and professionals first in mind. Simplify your workflow and dedicate more time to <span class="bold italic">what matters</span>.</p>
					<h1>There is always an offer</h1>
					<p>Still waiting on that offer email? Place your orders instanteously. By bringing vendors and clients together Open Commerce manages to eliminate the buffer time in corporate transactions</p>
					<h1>Flexible pricing</h1>
					<p>Pricing that scales with the quantity ordered. Flexible payment solutions. Zero comissions. All in one place.</p>
					<h1>Open Commerce<small> for Vendors</small></h1>
					<p>More than a marketplace. Be where yor clients are with Open Commerce.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-5">
				</div>
				<div class="col-md-2">
					<a href="register.html" class="btn primary wp4">Get Started Now</a>
				</div>
				<div class="col-md-5">
				</div>
			</div>
		</div>
	</section>
	<!-- END SECTION: Intro -->
<% 
} else {
%>
	<header class="hero">
		<div class="carousel-cell" style="background-image: url(img/hero-bg-03.jpg);">
			<div class="hero-bg">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center">
							<h1 class="wp1">Welcome, <%= username %>.<span class="bold italic">Thank you for choosing OpenCommerce for your transactions</span> </h1>
							<a href="dashboard.jsp" class="btn primary wp2">Go to Dashboard</a>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 hero-intro-text wp3">
<%
	if (userType.equals("client")) {
							ClientDAO cdao = new ClientDAO();
%>
							<p>With OpenCommerce you have rated <%= cdao.getRatingsByClient(client).size() %> products.</p>
<%
	} elseif (userType.equals("vendor")) {	
							OrderDAO odao = new OrderDAO();
%>
							<p>With OpenCommerce you have shipped <%= odao.getOrdersByVendor(vendor).size() %> products.</p>	
<%
	} 
%>						
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="carousel js-flickity">
			<div class="carousel-cell" style="background-image: url(img/hero-bg-01.jpg);">
				<div class="hero-bg">
					<div class="container">
						<div class="row">
							<div class="col-md-12 text-center">
								<h1 class="wp1">Start making your next move. </h1>
								<a href="advanced_search.jsp" class="btn primary wp2">Get Started</a>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8 col-md-offset-2 hero-intro-text wp3">
								<p>Welcome to the eCommerce platform that was designed <span class="bold italic">just for you.</span></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-cell" style="background-image: url(img/hero-bg-02.jpg);">
				<div class="hero-bg">
					<div class="container">
						<div class="row">
							<div class="col-md-12 text-center">
								<h1 class="wp1">Easy management & deep insights</h1>
								<a href="dashboard.jsp" class="btn primary wp2">Go to Dashboard</a>
							</div>
						</div>
						<div class="row">
							<div class="col-md-8 col-md-offset-2 hero-intro-text wp3">
								<p>Search, Filter, Compare, Order. Instantaneously.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class='mouse-container'>
			<a href="#intro">
				<div class='mouse'>
					<span class='scroll-down'></span>
				</div>
			</a>
		</div>
	</header>
<%
} 
%>	

	<!-- SECTION: Stats -->
	<div class="stats has-padding-tall">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-4 stats-container">
					<i class="icon icon-Users"></i>
					<div class="stats-wrapper">
						<p class="stats-number" data-stop="326">426</p>
						<p class="stats-text">Vendors</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 col-4 stats-container">
					<i class="icon icon-Truck"></i>
					<div class="stats-wrapper">
						<p class="stats-number" data-stop="12392">12.392</p>
						<p class="stats-text">Orders in 2017&emsp;</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-4 col-4  stats-container">
					<i class="icon icon-DesktopMonitor"></i>
					<div class="stats-wrapper">
						<p class="stats-number" data-stop="70000">70000</p>
						<p class="stats-text">Unique Visits in 2017&emsp;</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END SECTION: Stats -->
	<!-- SECTION: Articles -->
	<section class="latest-articles has-padding alternate-bg" id="articles">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4">
					<h4>[DUMMY]Most popular (In Development)</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<article class="article-post">
						<a href="product_page.html">
							<div class="article-image has-overlay" style="background-image: url(img/article-01.jpg)">
							</div>
							<figure>
								<figcaption>
									<h2>Product 1</h2>
									<p><em>Product Description:</em> A posuere donec senectus suspendisse bibendum magna ridiculus a justo orci parturient suspendisse ad rhoncus...</p>
								</figcaption>
							</figure>
						</a>
						<ul class="article-footer">
							<li class="article-category">
								<a href="#">Category 1</a>
							</li>
							
							<li class="article-comments">
								<span><i class="fa fa-comments"></i> 51</span>
							</li>
							<li class="article-comments">
								<span><i class="fa fa-star"></i> 3.5&emsp;</span>
							</li>
						</ul>
					</article>
				</div>
				<div class="col-md-4">
					<article class="article-post">
						<a href="product_page.html">
							<div class="article-image has-overlay" style="background-image: url(img/article-02.jpg)">
							</div>
							<figure>
								<figcaption>
									<h2>Product 2</h2>
									<p><em>Product Description:</em> A posuere donec senectus suspendisse bibendum magna ridiculus a justo orci parturient suspendisse ad rhoncus...</p>
								</figcaption>
							</figure>
						</a>
						<ul class="article-footer">
							<li class="article-category">
								<a href="#">Category 7</a>
							</li>
							<li class="article-comments">
								<span><i class="fa fa-comments"></i> 42</span>
							</li>
							<li class="article-comments">
								<span><i class="fa fa-star"></i> 4.2&emsp;</span>
							</li>
						</ul>
					</article>
				</div>
				<div class="col-md-4">
					<article class="article-post">
						<a href="product_page.html">
							<div class="article-image has-overlay" style="background-image: url(img/article-03.jpg)">
							</div>
							<figure>
								<figcaption>
									<h2>Product 3</h2>
									<p><em>Product Description:</em> A posuere donec senectus suspendisse bibendum magna ridiculus a justo orci parturient suspendisse ad rhoncus...</p>
								</figcaption>
							</figure>
						</a>
						<ul class="article-footer">
							<li class="article-category">
								<a href="#">Category 3</a>
							</li>
							<li class="article-comments">
								<span><i class="fa fa-comments"></i> 58</span>
							</li>
							<li class="article-comments">
								<span><i class="fa fa-star"></i> 3.7&emsp;</span>
							</li>
						</ul>
					</article>
				</div>
			</div>
			<div class="row is-centered">
				<a href="#intro" class="btn secondary view-more">View more</a>
			</div>
		</div>
	</section>
	<!-- END SECTION: Articles -->
	<!-- SECTION: Crew -->
	<section class="crew has-padding" id="team">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4>The Team</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2 col-sm-4 col-xs-8">
				</div>
				<div class="col-md-3 col-sm-6 col-xs-12">
					<article class="crew-member" style="background-image: url(img/crew-dk.jpg)">
						<figure>
							<figcaption class="overlay">
								<h2>Dimitrios Kostaris</h2>
								<p>Cruiser and Bruiser</p>
								<div class="crew-socials">
									<ul>
										<li><a href="#"><i class="fa fa-facebook"></i></a>
										</li>
										<li><a href="#"><i class="fa fa-linkedin"></i></a>
										</li>
									</ul>
								</div>
							</figcaption>
						</figure>
					</article>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-12">
					<article class="crew-member" style="background-image: url(img/crew-hb.jpg)">
						<figure>
							<figcaption class="overlay">
								<h2>Charalampos Mparounis</h2>
								<p>Lead Pungineer</p>
								<div class="crew-socials">
									<ul>
										<li><a href="#"><i class="fa fa-twitter"></i></a>
										</li>
										<li><a href="#"><i class="fa fa-linkedin"></i></a>
										</li>
									</ul>
								</div>
							</figcaption>
						</figure>
					</article>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-12">
					<article class="crew-member" style="background-image: url(img/crew-at.jpg)">
						<figure>
							<figcaption class="overlay">
								<h2>Anna Tsakona</h2>
								<p>Admin Adventurer</p>
								<div class="crew-socials">
									<ul>
										<li><a href="#"><i class="fa fa-facebook"></i></a>
										</li>
										<li><a href="#"><i class="fa fa-linkedin"></i></a>
										</li>
									</ul>
								</div>
							</figcaption>
						</figure>
					</article>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<br><h1 class="text-center"><small>We are currently looking to expand. Want to join our young team?Have a look <a class="bold italic" href="careers.html">here</a>.</small></h1>
				</div>
			</div>
		</div>
	</section>
	<!-- END SECTION: Crew -->
<% 
if (session.getAttribute("user-object")== null) {
%>
<!-- <jsp:include page="get_started.jsp" /> -->
<%@ include page="COMMON_PAGES/get_started.jsp" %>  
<%
}
%>
<%@ include page="COMMON_PAGES/footer.jsp" %>
	</body>
</html>