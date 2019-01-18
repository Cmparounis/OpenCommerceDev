<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap, ocgr.*" %>


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
		if 	(userType.equals("client")) {
			ClientDAO cdao = new ClientDAO();
			HashMap<Product, Rating> ratings = cdao.getRatingsByClient(client);
	%>
				<div class="row">
					<div class="col-md-9">
						<h3><%= username %> <small> &ensp;representing <%= client.getCompName() %> </small> </h3>
					</div>
					<div class="col-md-3">
						<h5>Client</h5>
					</div>
				</div>
	<%
	int counter=  0;
		for (Product product : ratings.keySet()) {
			counter++;
			Rating rating = ratings.get(product);
	%>	
						<div class="row">
							<div class="col-md-6 content-left">
								<div class="row">
									<div class="col-md-1">
									</div>
									<div class="col-md-11">
										<h5><%=counter %>.&ensp;<%=product.getName() %></h5>			
									</div>
								</div>
							</div>
							<div class="col-md-6 content-right">
								<h5> Rating: <span><i class="fa fa-star"></i>&ensp;<%=rating.getRating() %></span></h5>
							</div>
							<hr>
						</div>
	<%
		}
	}
	
	%>

