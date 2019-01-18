<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List, java.math.BigDecimal, java.math.MathContext, java.sql.Timestamp, ocgr.*" %>
<%@ page errorPage="error.jsp"%>

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
	<title>Checkout | Open Commerce</title>
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
			<div class="row">
				<div class="col-md-4">
				</div>
				<div class="col-md-4">
					<h1>Secure Checkout</h1>
				</div>
				<div class="col-md-4">
				</div>
			</div>
		</div>
	</header>
	
	<% 
		String product_id = (String)session.getAttribute("product_id");
		String vendor_id = (String)session.getAttribute("vendor_id");
		String string_quantity = (String)session.getAttribute("quantity");
		BigDecimal total = (BigDecimal)session.getAttribute("total");
		
		OrderDAO odao = new OrderDAO();
		VendorDAO vdao = new VendorDAO();
		DataManagement data = new DataManagement();
		Vendor myVendor = null;
		String order_id = null;
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		try {
			myVendor = vdao.getVendorById(vendor_id);
			order_id = data.generateId("order");
			
		}catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}
		
		Order order = new Order(order_id, timestamp, total, client.getAddress(), "Confirmed", "Deposit to bank account", client, myVendor );
		try{
			odao.submitOneProductOrder(order, product_id, string_quantity);
		}catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}
		
		session.setAttribute("show_order", order);
	%>
	
	<!--Main section-->
	<section class="freebies has-padding" id="freebies">
		<div class="container">
			<div class="row is-centered">
				<h1 class="wp1">Your order has been processed and is currently awaiting confirmation from the Vendor</h1>
				<h5 class="wp2">Thank you from Opencommerce.gr</h5><hr>
				<p class="wp3">Order No. :  <a href="order.jsp"><%= order_id%></a>&nbsp;&nbsp;  Sent to Vendor : <a href="#"><%= myVendor.getFullname()%></a>
								&nbsp;&nbsp; Company : <a href="#"><%= myVendor.getCompName()%></a></p>
			</div>
			
			
		</div>	
	</section>
	
	<jsp:include page="common_pages/footer.jsp"/>

</body>

</html>
