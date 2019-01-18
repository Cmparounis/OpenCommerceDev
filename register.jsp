<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>


<%
	String username = "";
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
		<title>Register | Open Commerce</title>
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
				<h1>Register</h1>
			</div>
		</div>
	</header>
		
	<!--Message section-->
	<%
	if (request.getAttribute("message") != null ) {
	%>
	<section class="crew has-padding alternate-bg" id="team">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4>Unable to register</h4>		
					<h3 class="text-center wp1"> Oops an error occured! <%= (String)request.getAttribute("message") %> </h3>
				</div>
			</div>	
		</div>
	</section>	
	<%
	}
	%>
	
	<!--Main section-->
	<section class="freebies has-padding" id="freebies">
		<div class="container freebies-intro">
			<div class="row">
				<form class="form-horizontal wp2 animated fadeInUp" name="registerForm" method="post" action="RegisterController" onsubmit="return checkForm(this);" >
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
										<input class="form-control" name="email" id="inputEmail" placeholder="Email" type="email" required>
									</div>
								</div>

								<div class="form-group">
									<label for="inputPassword" class="col-sm-3 control-label">Password</label>
									<div class="col-sm-7">
										<input class="form-control" name="password" id="inputPssword" placeholder="Password" type="password"  
														pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
														title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 
														onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');
														if(this.checkValidity()) form.pwd2.pattern = RegExp.escape(this.value);" required>
									</div>
								</div>
								
								<div class="form-group">
									<label for="confirmPassword" class="col-sm-3 control-label">Confirm your Password</label>
									<div class="col-sm-7">
										<input class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" 
														type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" title="Please enter the same Password as above" 
														onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" required>
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
										<input class="form-control" name="name" id="inputName" placeholder="Name" type="text" required>
									</div>
								</div>
								<div class="form-group">
									<label for="inputCompanyName" class="col-sm-3 control-label">Company Name</label>
									<div class="col-sm-7">
										<input class="form-control" name="companyName" id="inputCompanyName" placeholder="Company Name" type="text" required>
									</div>
								</div>

								<div class="form-group">
									<label for="inputAddress" class="col-sm-3 control-label">Address</label>
									<div class="col-sm-7">
										<input class="form-control" name="address" id="inputAddress" placeholder="Address" type="text" required>
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputTaxNumber" class="col-sm-3 control-label">Tax Number</label>
									<div class="col-sm-7">
										<input class="form-control" name="itin" id="inputTaxNumber" placeholder="Tax Registration Number" type="text" maxlength="9" required>
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputDoi" class="col-sm-3 control-label">Doi</label>
									<div class="col-sm-7">
										<input class="form-control" name="doi" id="inputDoi" placeholder="Doi" type="text" required>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPhonenumber" class="col-sm-3 control-label">Phone Number</label>
									<div class="col-sm-7">
										<input class="form-control" name="phone" id="inputPhonenumber" placeholder="Phone Number" type="tel" maxlength="10" required>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-7 radio">
							<label class="radio-inline"><input type="radio" name="userType" value="client" required><h3>Customer</h3></label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							<label class="radio-inline"><input type="radio" name="userType" value="vendor" required><h3>Vendor</h3></label>	
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
		
		<script type="text/javascript">

			document.addEventListener("DOMContentLoaded", function() {

			// JavaScript form validation

			var checkPassword = function(str)
			{
			  var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
			  return re.test(str);
			};

			var checkForm = function(e)
			{
			  if(this.username.value == "") {
				alert("Error: Username cannot be blank!");
				this.username.focus();
				e.preventDefault(); // equivalent to return false
				return;
			  }
			  re = /^\w+$/;
			  if(!re.test(this.username.value)) {
				alert("Error: Username must contain only letters, numbers and underscores!");
				this.username.focus();
				e.preventDefault();
				return;
			  }
			  if(this.pwd1.value != "" && this.pwd1.value == this.pwd2.value) {
				if(!checkPassword(this.pwd1.value)) {
				  alert("The password you have entered is not valid!");
				  this.pwd1.focus();
				  e.preventDefault();
				  return;
				}
			  } else {
				alert("Error: Please check that you've entered and confirmed your password!");
				this.pwd1.focus();
				e.preventDefault();
				return;
			  }
			  alert("Both username and password are VALID!");
			};

			var myForm = document.getElementById("registerForm");
			myForm.addEventListener("submit", checkForm, true);

			// HTML5 form validation

			var supports_input_validity = function()
			{
			  var i = document.createElement("input");
			  return "setCustomValidity" in i;
			}

			if(supports_input_validity()) {
			  var usernameInput = document.getElementById("inputEmail");
			  usernameInput.setCustomValidity(usernameInput.title);

			  var pwd1Input = document.getElementById("inputPssword");
			  pwd1Input.setCustomValidity(pwd1Input.title);

			  var pwd2Input = document.getElementById("confirmPassword");

			  // input key handlers

			  usernameInput.addEventListener("keyup", function(e) {
				usernameInput.setCustomValidity(this.validity.patternMismatch ? usernameInput.title : "");
			  }, false);

			  pwd1Input.addEventListener("keyup", function(e) {
				this.setCustomValidity(this.validity.patternMismatch ? pwd1Input.title : "");
				if(this.checkValidity()) {
				  pwd2Input.pattern = RegExp.escape(this.value);
				  pwd2Input.setCustomValidity(pwd2Input.title);
				} else {
				  pwd2Input.pattern = this.pattern;
				  pwd2Input.setCustomValidity("");
				}
			  }, false);

			  pwd2Input.addEventListener("keyup", function(e) {
				this.setCustomValidity(this.validity.patternMismatch ? pwd2Input.title : "");
			  }, false);

			}

			}, false);

		</script>
	</section>
	<!--End Main section-->
	
	<jsp:include page="common_pages/footer.jsp"/>
		
</body>

</html>
