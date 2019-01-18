<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ocgr.*" %>


<%@ include file="common_pages/control_session.jsp" %>

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
		<title>Dashboard | Open Commerce</title>
		<meta name="description" content="An online marketplace for professional and industrial use">
		<meta name="keywords" content="e-commerce, online store, order, professional, industry, tools, machinery" />
		<meta name="author" content="Codrops, ismgroup42" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<jsp:include page="common_pages/page_head.html" />  
	</head>

<body>
	<!--[if lt IE 8]>
	<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
	<![endif]-->
	<div class="container-fluid">
		<div class="row">
			<div class="header-nav-wrapper">
				<div class="logo">
					<a href="index.html"><img src="img/synthetica-logo.png" alt="Logo Goes Here"></a>
				</div>
				<div class="primary-nav-wrapper">
					<nav>
						<ul class="primary-nav">
							<li><a href="index.html">Home</a></li>
							<li><a href="categories.html">Browse</a></li>
							<li><a href="dashboard.html">Dashboard</a></li>
							<li><a href="advanced_search.html">Advanced Search</a></li>
						</ul>
					</nav>
					<div class="secondary-nav-wrapper">
						<ul class="secondary-nav">
							<li class="subscribe"><a href="login.html">Log Out</a></li>
							<li class="search"><a href="#search" class="show-search"><i class="fa fa-search"></i></a></li>
						</ul>
					</div>
					<div class="search-wrapper">
						<ul class="search">
							<li>
								<input type="text" id="search-input" placeholder="Start typing then hit enter to search">
								<span><a href="advanced_search.html">Advanced search</a></span>
							</li>
							<li>
								<a href="#" class="hide-search"><i class="fa fa-close"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="navicon">
					<a class="nav-toggle" href="#"><span></span></a>
				</div>
			</div>
		</div>
	</div>
	<header>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-6">
					<h1>Welcome, Alex Jones</h1>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</header>
	
<!-- SECTION: Intro -->
	

	<section class="collective has-padding alternate-bg" id="intro">
	
	<%
if (userType.equals("vendor")) {
%>
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-sm-10">
				<h4>Dashboard</h4>
			</div>
		</div>
		<div class="row profile">
			<div class="col-md-3">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img src="img/crew-hb.jpg" class="img-responsive img-circle" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">
							Marcus Doe
						</div>
						<div class="profile-usertitle-job">
							Makerbot ltd.
						</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR MENU -->
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active">
								<a href="common_pages/profile.jsp">
								<i class="glyphicon glyphicon-home"></i>
								Overview </a>
							</li>
							<li>
								<a href="common_pages/products.jsp">
								<i class="glyphicon glyphicon-user"></i>
								Account Settings </a>
							</li>
							<li>
								<a href="common_pages/orders.jsp">
								<i class="glyphicon glyphicon-ok"></i>
								Tasks </a>
							</li>
							<li>
								<a href="common_pages/statistics.jsp">
								<i class="glyphicon glyphicon-flag"></i>
								Help </a>
							</li>
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>
			<section id="dynamic">
			<div class="col-md-9">
				<div class="profile-content">
				   
				</div>
			</div>
			</section>
		</div>
	</div>
	<%
}else if (userType.equals("client")) {
	%>
		<div class="container">
		<div class="row">
			<div class="col-md-10 col-sm-10">
				<h4>Dashboard</h4>
			</div>
		</div>
		<div class="row profile">
			<div class="col-md-3">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img src="img/crew-hb.jpg" class="img-responsive img-circle" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">
							Marcus Doe
						</div>
						<div class="profile-usertitle-job">
							Makerbot ltd.
						</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR MENU -->
					<div class="profile-usermenu">
						<ul class="nav">
							<li class="active">
								<a href="common_pages/profile.jsp">
								<i class="glyphicon glyphicon-home"></i>
								Overview </a>
							</li>
							<li>
								<a href="common_pages/products.jsp">
								<i class="glyphicon glyphicon-user"></i>
								Account Settings </a>
							</li>
							<li>
								<a href="common_pages/orders.jsp">
								<i class="glyphicon glyphicon-ok"></i>
								Tasks </a>
							</li>
							<li>
								<a href="common_pages/statistics.jsp">
								<i class="glyphicon glyphicon-flag"></i>
								Help </a>
							</li>
						</ul>
					</div>
					<!-- END MENU -->
				</div>
			</div>
			<section id="dynamic">
			<div class="col-md-9">
				<div class="profile-content">
				   
				</div>
			</div>
			</section>
		</div>
	</div>
	<%
}
	%>
	<script>
		$(document).ready(function(){
		$('.profile-usermenu ul li a').click(function(e){
			e.preventDefault();
			$(".profile-content").load($(this).attr('href'));
		});
	});
	</script>
		<div class="container">
	

			<div class="row">
				<div class="col-md-5">
				</div>
				<div class="col-md-2">
					<h3>Pending Orders</h3>
				</div>
				<div class="col-md-5">
				</div>	
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<form class="form-horizontal" name="submit_form" method="post" action="successfull_sale.html">
						<div class="table-responsive">
							<table class="table table-hover table-condensed active ">
								<thead>
									<tr class="info">
										<th>Order Date</th>
										<th>Customer</th>
										<th>Product id</th>
										<th>Product description</th>
										<th>Payment</th>
										<th>Repayment duration</th>
										<th>Price per piece</th>
										<th>Pieces</th>
										<th>Total price</th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody class="text-center">
									<tr class="active">
										<div class="form-group" id="condition1">
											<td><span class="date">03/01/2016</span></td>
											<td><a href="user_111.html">MEAS Inc</a></td>
											<td><a href="product_111.html">0554836</a></td>
											<td>Huqsvarna H505ts</td>
											<td>Deposit to account</td>
											<td>20 Day credit</td>
											<td>254,65 &euro;</td>
											<td>4</td>
											<td>1018,6 &euro;</td>
											<td>
												<label class="radio-inline"><input type="radio" name="condition1" value="Accept">Accept</label>
											</td>
											<td>
												<label class="radio-inline"><input type="radio" name="condition1" value="Decline">Decline</label>
											</td>	
										</div>	
									</tr>
									<tr class="active">
										<div class="form-group" id="condition2">
											<td><span class="date">03/02/2016</span></td>
											<td><a href="user_111.html">Bouygues Construction</a></td>
											<td><a href="product_111.html">4582674</a></td>
											<td>Yamaha OHV  5.5hp</td>
											<td>Cash on delivery</td>
											<td>Immediate payment</td>
											<td>229,09 &euro;</td>
											<td>2</td>
											<td>458,18 &euro;</td>
											<td>
												<label class="radio-inline"><input type="radio" name="condition2" value="Accept">Accept</label>
											</td>
											<td>
												<label class="radio-inline"><input type="radio" name="condition2" value="Decline">Decline</label>
											</td>
										</div>							
									</tr>
								</tbody>
							</table>
						</div>
						<div class="form-group">
							<div class="col-md-offset-4 col-md-4">
								<button type="submit button" class="btn btn-default price">Confirm</button>
								<button type="reset" class="btn btn-default price">Clear</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row is-centered">
					<h3>Latest Transactions</h3>
			</div>
			<div class="row">
				<div class="col-md-8 col-sm-8">
					<h5>Period</h5>
					<select name="article-sort" id="inputArticle-Sort" class="">
						<option value="">Last month</option>
						<option value="">Last 3 months</option>
						<option value="">Last 6 months</option>
						<option value="">Last year</option>
					</select>
				</div>
			</div>
			
			<div class="table-responsive">
				<div class="form-group" id="condition1">
								</div><div class="form-group" id="condition2">
								</div><table class="table table-hover table-condensed active ">
					<thead>
						<tr class="info">
							<th>Order Date</th>
							<th>Payout Date</th>
							<th>Customer</th>
							<th>Product id</th>
							<th>Product description</th>
							<th>Payment</th>
							<th>Price per piece</th>
							<th>Pieces</th>
							<th>Total price</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<tr class="active">
							<td><span class="date">03/01/2016</span></td>
								<td><span class="date">22/01/2016</span></td>
								<td><a href="user_111.html">MEAS Inc</a></td>
								<td><a href="product_111.html">0554836</a></td>
								<td>Huqsvarna H505ts</td>
								<td>Deposit to account</td>
								<td>254,65 €</td>
								<td>4</td>
								<td>1018,6 €</td>
								
						</tr>
						<tr class="active">
							<td><span class="date">03/01/2016</span></td>
								<td><span class="date">03/01/2016</span></td>
								<td><a href="user_111.html">Bouygues Construction</a></td>
								<td><a href="product_111.html">4582674</a></td>
								<td>Yamaha OHV  5.5hp</td>
								<td>Cash on delivery</td>
								<td>229,09 €</td>
								<td>2</td>
								<td>458,18 €</td>
														
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row is-centered">
					<h3>Product Registration</h3>	
			</div>
			<form class="form-horizontal" name="submit_form" method="post" action="successfull_submission.html">
				<div class="form-group">
					<label for="inputCategory" class="col-sm-2 control-label">Product Category</label>
					<div class="col-sm-6">
						<select name="category" class="form-control" id="inputCategory">
							<option value="none">---Choose Category---</option>
							<option value="garden">Garden Equipment</option>
							<option value="medical">Medical Equipment</option>
							<option value="office">Office equipment</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="inputType" class="col-sm-2 control-label">Product Type</label>
					<div class="col-sm-6">
						<select name="type" class="form-control" id="inputType">
							<option value="none">---Choose Product Type---</option>
							<option value="garden"></option>
							<option value="medical"></option>
							<option value="office"></option>
						</select>
					</div>
				</div>	
				<div class="form-group">
					<label for="inputModel" class="col-sm-2 control-label">Brand</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputModel" placeholder="Brand Name" type="text">
					</div>
				</div>
				<div class="form-group">
					<label for="inputModel" class="col-sm-2 control-label">Model name</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputModel" placeholder="Model name" type="text">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<label class="radio-inline"><input name="condition" type="radio">New</label>
						<label class="radio-inline"><input name="condition" type="radio">Used</label>
						<label class="radio-inline"><input name="condition" type="radio">Refurbished</label>	
					</div>
				</div>
				<div class="form-group">
					<label for="inputPrice" class="col-sm-2 control-label">Price per Piece</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputPrice" placeholder="€/piece" type="text">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPicture" class="col-sm-2 control-label">Product image</label>
					<div class="col-sm-6">
						<input id="inputPicture" type="file">
					</div>
				</div>
				<div class="form-group">
					<label for="inputDescription" class="col-sm-2 control-label">Additional Description</label>
					<div class="col-sm-6">
						<textarea class="form-control" rows="5" id="inputDescription"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="inputComment" class="col-sm-2 control-label">Comments</label>
					<div class="col-sm-6">
						<textarea class="form-control" rows="5" id="inputComment"></textarea>
					</div>
				</div>	
				<div class="form-group">
					<div class="col-md-offset-4 col-md-4">
						<button type="submit button" class="btn btn-default price">Confirm</button>
						<button type="reset" class="btn btn-default price">Clear</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<!-- END SECTION: Intro -->
	<!-- SECTION: Stats -->
	<section class="crew " id="team">
		<div class="container">
			<div class="row skillset">
				<div class="col-md-6">
					<div class="bar-chart-wrapper">
						<h5 class="bar-chart-text">Customer Satisfaction <span class="push-right">90%</span></h5>
						<div class="bar-wrapper">
							<div class="bar" data-percentage="90%" style="width: 90%;">
								<span></span>
							</div>
						</div>
					</div>
					<div class="bar-chart-wrapper">
						<h5 class="bar-chart-text">Completed Orders <span class="push-right">95%</span></h5>
						<div class="bar-wrapper">
							<div class="bar" data-percentage="95%" style="width: 95%;">
								<span></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="bar-chart-wrapper">
						<h5 class="bar-chart-text">Average Product Rating <span class="push-right"><i class="fa fa-star"></i>4.0</span></h5>
						<div class="bar-wrapper">
							<div class="bar" data-percentage="80%" style="width: 80%;">
								<span></span>
							</div>
						</div>
					</div>
					<div class="bar-chart-wrapper">
						<h5 class="bar-chart-text">Compliance to Standards & Practices <span class="push-right">90%</span></h5>
						<div class="bar-wrapper">
							<div class="bar" data-percentage="90%" style="width: 90%;">
								<span></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- END SECTION: Stats -->
	<!-- SECTION: Footer -->
	<footer class="has-padding footer-bg">
		<div class="container">
			<div class="row">
				<div class="col-md-4 footer-branding wp4">
					<img class="footer-branding-logo" src="img/synthetica-logo.png" alt="Synthetica freebie html5 css3 template logo">
				</div>
				<div class="col-md-4 footer-branding wp4">
					<img class="footer-branding-logo" src="img/ismgroup42.png" alt="ismlogo">
				</div>
				<div class="col-md-4 footer-branding wp4">
					<img class="footer-branding-logo" src="img/DMST.png" alt="dmstl">
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 footer-branding wp4 animated fadeIn">
					<p>Opencommerce.gr was created using the theme Synthetica, generously provided by <a href="http://peterfinlan.com/"><em>Peter Finlan</em></a> for <a href="https://tympanus.net/codrops/"><em>codrops</em></a>. Back-end coding and modification by <a href="#"><em>ismGroup42</em></a>.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 footer-nav">
					<ul class="footer-primary-nav">
						<li><a href="index.html">Home</a></li>
						<li><a href="categories.html">Browse</a></li>
						<li><a href="advanced_search.html">Advanced Search</a></li>
						<li><a href="dashboard.html">Dashboard</a></li>
					</ul>
					<ul class="footer-share">
						<li><a href="http://tympanus.net/codrops/licensing/">Licence</a></li>
						<li><a href="#" class="share-trigger"><i class="fa fa-share"></i>Share</a></li>
					</ul>
					<div class="share-dropdown">
						<ul>
							<li><a href="#" class="share-twitter"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#" class="share-facebook"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#" class="share-linkedin"><i class="fa fa-linkedin"></i></a></li>
						</ul>
					</div>
					<ul class="footer-secondary-nav">
						<li><p>© Copyright <a href="#"><em> ismGroup42</em></a>. All rights reserved | <a href="#"><em>Terms Of Use</em></a> | <a href="#"><em>Contact</em></a></p></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!-- END SECTION: Footer -->
	<!-- JS CDNs -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>
	<script src="http://vjs.zencdn.net/5.4.6/video.min.js"></script>
	<!-- jQuery local fallback -->
	<script>
	window.jQuery || document.write('<script src="js/min/jquery-1.11.2.min.js"><\/script>')
	</script>
	<!-- JS Locals -->
	<script src="js/min/bootstrap.min.js"></script>
	<script src="js/min/modernizr-2.8.3-respond-1.4.2.min.js"></script>
	<script src="js/min/retina.min.js"></script>
	<script src="js/min/jquery.waypoints.min.js"></script>
	<script src="js/min/flickity.pkgd.min.js"></script>
	<script src="js/min/scripts-min.js"></script>
	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID and uncomment -->
	<!--
	<script>
	(function(b, o, i, l, e, r) {
		b.GoogleAnalyticsObject = l;
		b[l] || (b[l] =
			function() {
				(b[l].q = b[l].q || []).push(arguments)
			});
		b[l].l = +new Date;
		e = o.createElement(i);
		r = o.getElementsByTagName(i)[0];
		e.src = '//www.google-analytics.com/analytics.js';
		r.parentNode.insertBefore(e, r)
	}(window, document, 'script', 'ga'));
	ga('create', 'UA-XXXXX-X', 'auto');
	ga('send', 'pageview');
	</script>
	-->
</body>

</html>
