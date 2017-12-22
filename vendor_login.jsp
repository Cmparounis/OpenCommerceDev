<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ocgr.*" %>


<% 
String username = "";

if (request.getAttribute("currentPage") != null) {
	String previousPage = (String)request.getAttribute("currentPage"); 
	request.setAttribute("currentPage", previousPage);
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
		<title>Vendor Login | Open Commerce</title>
		<meta name="description" content="An online marketplace for professional and industrial use">
		<meta name="keywords" content="e-commerce, online store, order, professional, industry, tools, machinery" />
		<meta name="author" content="Codrops, ismgroup42" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<%@ include file="common_pages/page_head.html" %>
	
	</head>
	
	<body>
	
	<%@ include file="common_pages/navbar.jsp" %>

		<header>
			<div class="container">
				<div class="row is-centered">
					<div class="col-md-4">
					</div>
					<div class="col-md-4">
						<h1>Vendor Login</h1>
					</div>
					<div class="col-md-4">
					</div>
				</div>
			</div>
		</header>
		
		<!--Main section-->
		<section class="freebies has-padding" id="freebies">
			<div class="container freebies-intro">
			
			<% if(request.getAttribute("message") != null) { %>
			
				<div class="row is-centered">
					<div class="col-md-12 text-center">
						<h3 class="wp1"><%=(String)request.getAttribute("message") %></h3>
					</div>
				</div>
				<br><br><br>
			<% } %>	
			
				<div class="row">
					<div class="col-md-6 content-left">
						<div class="row">
							<div class="col-md-12">
								<h4 id="login">Existing Vendors</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-1">
							</div>
							<div class="col-md-9">
								<form class="wp2 animated fadeInUp" name="vLoginForm" method="post" action="VendorLoginController.jsp">
									<div class="form-group">
										<label for="inputEmail">Email address</label>
										<input type="email" class="form-control" name="email" id="inputEmail" aria-describedby="emailHelp" placeholder="Enter email" required><br>
										<h5><small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small></h5>
									</div>
									<div class="form-group">
										<label for="inputPassword">Password</label>
										<input type="password" class="form-control" name="password" id="inputPassword" placeholder="Password" required>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-default price">Login</button> 
										<span><a href="login.jsp">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Back to Customer Login</a></span>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-6 content-right">
						<div class="row">
							<div class="col-md-12">
								<h4>New to Open Commerce?</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-2">
							</div>
							<div class="col-md-10">
								<a href="register.jsp" class="btn primary wp2 animated fadeInUp">Get Started Now</a>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</section>
	
		<jsp:include page="common_pages/footer.jsp"/>
	
	</body>
</html>