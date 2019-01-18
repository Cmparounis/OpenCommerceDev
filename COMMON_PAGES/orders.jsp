<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedList, java.util.List, ocgr.*" %>


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
		if (userType.equals("client")) {
			OrderDAO odao = new OrderDAO();
			List<Order> orders = new LinkedList<Order>();
			try {
			orders = odao.getOrderByClient(client);
			} catch (Exception e){
			}
			for (Order order : orders) {
	%>
	<div class="row has-top-margin">
		<div class="col-sm-12">
			<h3> Order No. : <%= order.getId()%> </h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">To Client </th>
						<th scope="col">From Vendor </th>
						<th scope="col">Status </th>
						<th scope="col">Address </th>
						<th scope="col">Payment Method </th>
						<th scope="col">Submitted On </th>
						<th scope="col">Payment Total </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%= order.getClient().getCompName()%></td>
						<td><%= order.getVendor().getCompName()%></td>
						<td><%= order.getStatus()%></td>
						<td><%= order.getAddress()%></td>
						<td><%= order.getPayment()%></td>
						<td><%= order.getTimestamp().toString()%></td>
						<td><%= order.getTotal().floatValue()%>&ensp;€</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%
			}
		}
		if 	(userType.equals("vendor")) {
			OrderDAO odao = new OrderDAO();
			List<Order> orders = new LinkedList<Order>();
			try {
			orders = odao.getOrderByVendor(vendor);
			} catch (Exception e) {
			}
			for (Order order : orders) {
				
	%>
	<div class="row has-top-margin">
		<div class="col-sm-12">
			<h3> Order No. : <%= order.getId()%> </h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">To Client </th>
						<th scope="col">From Vendor </th>
						<th scope="col">Status </th>
						<th scope="col">Address </th>
						<th scope="col">Payment Method </th>
						<th scope="col">Submitted On </th>
						<th scope="col">Payment Total </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><%= order.getClient().getCompName()%></td>
						<td><%= order.getVendor().getCompName()%></td>
						<td><%= order.getStatus()%></td>
						<td><%= order.getAddress()%></td>
						<td><%= order.getPayment()%></td>
						<td><%= order.getTimestamp().toString()%></td>
						<td><%= order.getTotal().floatValue()%>&ensp;€</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%
			}
		}
	%>

