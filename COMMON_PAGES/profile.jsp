<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ocgr.*" %>


<%@ include file="control_session.jsp" %>


	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title> Profile | Open Commerce</title>
		<meta name="description" content="An online marketplace for professional and industrial use">
		<meta name="keywords" content="e-commerce, online store, order, professional, industry, tools, machinery" />
		<meta name="author" content="Codrops, ismgroup42" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/normalize.min.css">
		<link rel="stylesheet" href="css/animate.min.css">
		<link rel="stylesheet" href="css/flickity.min.css">
		<link rel="stylesheet" href="css/styles.css">
		<link rel="stylesheet" href="css/profile.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	</head>

	<%
		if (userType.equals("vendor")) {
	%>
				<div class="row">
					<div class="col-md-9">
						<h3><%= username %> <small> &ensp;representing <%= vendor.getCompName() %> </small> </h3>
					</div>
					<div class="col-md-3">
						<h5>Vendor</h5>
					</div>
				</div>
				<form name='editCredsForm' method='post' action='credentialsEdit.jsp'>
					<div class="row">
						<div class="col-md-6 content-left">
							<div class="row">
								<div class="col-md-1">
								</div>
									<div class="col-md-11">
										<div class="form-group">
											<label for="fullname" >Full Name</label>
											<input name="fullname" id="fullname" class="form-control" type="text" value="<%= username %>" >
										</div>
										<div class="form-group">
											<label for="itin">Password</label>
											<input name="itin" id="itin" class="form-control" maxlength="9" type="text" value="**********">
										</div>
										<div class="form-group">
											<label for="c_name" >Company Name</label>
											<input name="c_name" id="c_name" class="form-control" type="text" value="<%= vendor.getCompName() %>" >
										</div>
										<div class="form-group">
											<label for="itin">Tax Registration No.</label>
											<input name="itin" id="itin" class="form-control" maxlength="9" type="text" value="<%= vendor.getItin() %>">
										</div>
									</div>
							</div>
						</div>
						<div class="col-md-6 content-right">
							<div class="form-group">
								<label for="doi" >Doi</label>
								<input name="doi" id="doi" class="form-control" type="text" value="<%= vendor.getDoy() %>">
							</div>
							<div class="form-group">
								<label for="address" >Address</label>
								<input name="address" id="address" class="form-control" type="text" value="<%= vendor.getAddress() %>" >
							</div>
							<div class="form-group">
								<label for="email" >E-mail</label><br>
								<input name="email" id="email" value="<%= vendor.getEmail() %>" class="form-control" type="email">
							</div>
							<div class="form-group">
								<label for="phone" >Phone</label>
								<input name="phone" id="phone" value="<%= vendor.getPhone() %>" class="form-control" type="tel">
							</div>	
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 content-left">
							<div class="row">
								<div class="col-md-1">
								</div>
								<div class="col-md-11">
									<p>From here, you can review your credentials, and edit them.<br>Press "Submit Changes" when ready.</p>
								</div>
							</div>
						</div>
						<div class="col-md-6 content-right">
							<button type='submit' class='btn btn-default price'>Submit Changes</button>
						</div>
					</div>
				</form>
	<%
		}
		if 	(userType.equals("client")) {
	%>
				<div class="row">
					<div class="col-md-9">
						<h3><%= username %> <small> &ensp;representing <%= client.getCompName() %> </small> </h3>
					</div>
					<div class="col-md-3">
						<h5>Client</h5>
					</div>
				</div>
				<form name='editCredsForm' method='post' action='credentialsEdit.jsp'>
					<div class="row">
						<div class="col-md-6 content-left">
							<div class="row">
								<div class="col-md-1">
								</div>
									<div class="col-md-11">
										<div class="form-group">
											<label for="fullname" >Full Name</label>
											<input name="fullname" id="fullname"  class="form-control" type="text" value="<%= username %>" >
										</div>
										<div class="form-group">
											<label for="itin">Password</label>
											<input name="itin" id="itin"  class="form-control" maxlength="9" type="text" value="**********">
										</div>
										<div class="form-group">
											<label for="c_name" >Company Name</label>
											<input name="c_name" id="c_name"  class="form-control" type="text" value="<%= client.getCompName() %>" >
										</div>
										<div class="form-group">
											<label for="itin">Tax Registration No.</label>
											<input name="itin" id="itin"  class="form-control" maxlength="9" type="text" value="<%= client.getItin() %>">
										</div>
									</div>
							</div>
						</div>
						<div class="col-md-6 content-right">
							<div class="form-group">
								<label for="doi" >Doi</label>
								<input name="doi" id="doi"  class="form-control" type="text" value="<%= client.getDoy() %>">
							</div>
							<div class="form-group">
								<label for="address" >Address</label>
								<input name="address" id="address"  class="form-control" type="text" value="<%= client.getAddress() %>" >
							</div>
							<div class="form-group">
								<label for="email" >E-mail</label><br>
								<input name="email" id="email" value="<%= client.getEmail() %>"  class="form-control" type="email">
							</div>
							<div class="form-group">
								<label for="phone" >Phone</label>
								<input name="phone" id="phone" value="<%= client.getPhone() %>"   class="form-control" type="tel">
							</div>	
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 content-left">
							<div class="row">
								<div class="col-md-1">
								</div>
								<div class="col-md-11">
									<p>From here, you can review your credentials, and edit them.<br>Press "Submit Changes" when ready.</p>
								</div>
							</div>
						</div>
						<div class="col-md-6 content-right">
							<button type='submit' class='btn btn-default price'>Submit Changes</button>
						</div>
					</div>
				</form>
	<%
		}
	%>

