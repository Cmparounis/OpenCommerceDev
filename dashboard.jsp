<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="ocgr" %>
<%@ page errorPage="error.jsp"%>

<%

try {
	session.getAttribute("user-object");
} catch(Exception e) { 
	request.setAttribute("message", e.getMessage());
}
String check;
String username;
if (session.getAttribute("user-object")!= null){
	try {
		String check = session.getAttribute("user-type");
	} catch (Exception e) {
		request.setAttribute("message", e.getMessage());
	}
	if (check.equals("client")) {
		Client client = (Client)session.getAttribute("ex3-user-object");
		ClientDAO cdao = new ClientDAO();
		username = client.getFullname;
	} elseif (check.equals("vendor")) {
		Vendor vendor = (Vendor)session.getAttribute("ex3-user-object");
		VendorDAO vdao = new VendorDAO();
		username = vendor.getFullname;
	} else {
		request.setAttribute("message", "You are not authorized to access to this resource. Please login.");
%>		
	<jsp:forward page="login_ex3_8130104.jsp"/>	
<%		
	}
}
%>

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
<%@ include file="COMMON_FILES/page_head.html" %>
	</head>
	<body>
<%@ include file="COMMON_FILES/navbar.jsp" %>

		<header>
			<div class="container">
				<div class="row">
					<div class="col-md-4">
					</div>
					<div class="col-md-4">
						<h1>Welcome,<%= username %></h1>
					</div>
					<div class="col-md-4">
					</div>
				</div>
			</div>
		</header>
		
		<!-- SECTION: Intro -->
<% 
if (check.equals("vendor") {
%>

		<section class="collective has-padding alternate-bg" id="intro">
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
									<%= username %>
								</div>
								<div class="profile-usertitle-job">
									<%= vendor.getCompName() %>
								</div>
							</div>
							<!-- END SIDEBAR USER TITLE -->
							<!-- SIDEBAR MENU -->
							<div class="profile-usermenu">
								<ul class="nav">
									<li class="active">
										<a href="common_pages/profile.jsp">
										<i class="glyphicon glyphicon-user"></i>
										Profile </a>
									</li>
									<li>
										<a href="common_pages/products.jsp">
										<i class="glyphicon glyphicon-barcode"></i>
										Products </a>
									</li>
									<li>
										<a href="common_pages/orders.jsp">
										<i class="glyphicon glyphicon-shopping-cart"></i>
										Orders </a>
									</li>
									<li>
										<a href="common_pages/statistics.jsp">
										<i class="glyphicon glyphicon-stats"></i>
										Stats </a>
									</li>
								</ul>
							</div>
							<!-- END MENU -->
						</div>
					</div>
					<div class="col-md-9">
						<div class="profile-content">
						   <%@ include page="common_pages/profile.jsp" %>
						</div>
					</div>
				</div>
			</div>
			<script>
				$(document).ready(function(){
				$('.profile-usermenu ul li a').click(function(e){
					e.preventDefault();
					$(".profile-content").load($(this).attr('href'));
				});
			});
			</script>
		</section>
	<%
}else if (check.equals("client")) {
	%>
		<section class="collective has-padding alternate-bg" id="intro">
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
									<%= username %>
								</div>
								<div class="profile-usertitle-job">
									<%= client.getCompName()%>
								</div>
							</div>
							<!-- END SIDEBAR USER TITLE -->
							<!-- SIDEBAR MENU -->
							<div class="profile-usermenu">
								<ul class="nav">
									<li class="active">
										<a href="common_pages/profile.jsp">
										<i class="glyphicon glyphicon-user"></i>
										Profile </a>
									</li>
									<li>
										<a href="common_pages/orders.jsp">
										<i class="glyphicon glyphicon-shopping-cart"></i>
										Orders </a>
									</li>
									<li>
										<a href="common_pages/ratings.jsp">
										<i class="glyphicon glyphicon-star"></i>
										Ratings </a>
									</li>
									
								</ul>
							</div>
							<!-- END MENU -->
						</div>
					</div>
					<div class="col-md-9">
						<div class="profile-content">
						   <%@ include page="common_pages/profile.jsp" %>
						</div>
					</div>
				</div>
			</div>
			<script>
				$(document).ready(function(){
				$('.profile-usermenu ul li a').click(function(e){
					e.preventDefault();
					$(".profile-content").load($(this).attr('href'));
				});
			});
			</script>
		</section>
<%
} 
%>
	
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
	<%@ include page="COMMON_FILES/footer" %>
	</body>
</html>