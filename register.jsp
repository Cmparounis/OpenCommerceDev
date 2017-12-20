<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>


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
		<title>Register | Open Commerce</title>
		<meta name="description" content="An online marketplace for professional and industrial use">
		<meta name="keywords" content="e-commerce, online store, order, professional, industry, tools, machinery" />
		<meta name="author" content="Codrops, ismgroup42" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<%@ include file="COMMON_PAGES/page_head.html" %>
	
	</head>
	
	<body>
	
	<jsp:include file="COMMON_PAGES/navbar.jsp"/>
	
	<header>
		<div class="container">
			<div class="row is-centered">
				<h1>Register</h1>
			</div>
		</div>
	</header>
	
	<!--Main section-->
	<section class="freebies has-padding" id="freebies">
		<div class="container freebies-intro">
			<div class="row">
				<form class="form-horizontal wp2 animated fadeInUp" name="registerForm" method="post" action="RegisterController" >
					<div class="col-md-6 content-left">
						<div class="row">
							<div class="col-md-12">
								<h4>Create an account</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-1">
							</div>
							<div class="col-md-11">
								<div class="form-group">
									<label for="inputEmail" class="col-sm-3 control-label">Email</label>
									<div class="col-sm-7">
										<input class="form-control" id="inputEmail" placeholder="Email" type="email">
									</div>
								</div>

								<div class="form-group">
									<label for="inputPassword" class="col-sm-3 control-label">Password</label>
									<div class="col-sm-7">
										<input class="form-control" name="Password" id="inputPssword" placeholder="Password" type="password" maxlength="20">
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputConfirmPassword" class="col-sm-3 control-label">Confirm your Password</label>
									<div class="col-sm-7">
										<input class="form-control" name="confirmPassword" id="inputPssword" placeholder="Confirm Password" type="password" maxlength="20">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 content-right">
						<div class="row">			
							<div class="col-md-12">
								<h4>Submit your Data</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-1">
							</div>
							<div class="col-md-11">
								<div class="form-group">
									<label for="inputName" class="col-sm-3 control-label">Full Name</label>
									<div class="col-sm-7">
										<input class="form-control" name="name" id="inputName" placeholder="Name" type="text">
									</div>
								</div>
								<div class="form-group">
									<label for="inputCompanyName" class="col-sm-3 control-label">Company Name</label>
									<div class="col-sm-7">
										<input class="form-control" name="companyName" id="inputCompanyName" placeholder="Company Name" type="text">
									</div>
								</div>

								<div class="form-group">
									<label for="inputAddress" class="col-sm-3 control-label">Address</label>
									<div class="col-sm-7">
										<input class="form-control" name="address" id="inputAddress" placeholder="Address" type="text">
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputTaxnumber" class="col-sm-3 control-label">Tax Number</label>
									<div class="col-sm-7">
										<input class="form-control" name="name" id="inputTaxnumber" placeholder="Tax Registration Number" type="text" maxlength="9">
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputDoi" class="col-sm-3 control-label">Doi</label>
									<div class="col-sm-7">
										<input class="form-control" name="doi" id="inputDoi" placeholder="Doi" type="text">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPhonenumber" class="col-sm-3 control-label">Phone Number</label>
									<div class="col-sm-7">
										<input class="form-control" name="phone" id="inputPhonenumber" placeholder="Phone Number" type="tel" maxlength="10">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-7 radio">
							<label class="radio-inline"><input type="radio" name="userType" value="Customer"><h3>Customer</h3></label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<label class="radio-inline"><input type="radio" name="userType" value="Vendor"><h3>Vendor</h3></label>	
						</div>
					</div>
									
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-7">
							<button type="submit" class="btn primary wp2 animated fadeInUp">Register</button>	
						</div>
					</div>
				</form>	
			</div>
		</div>	
	</section>
	<!--End Main section-->
	
	<%@ include page="COMMON_PAGES/footer.jsp" %>
		
</body>

</html>
