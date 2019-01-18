<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List, java.math.BigDecimal,  ocgr.*" %>
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
		<title>Place Order | Open Commerce</title>
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
					<%
						Order lastOrder = null;
						if (session.getAttribute("show_order") == null){
					%>
						<h1>Secure Checkout</h1>
					<%
						} else {
							lastOrder = (Order)session.getAttribute("show_order");
					%>	
						<h3>Order <span class="bold italic"><%= lastOrder.getId()%></span> Details</h3>
					<%
						}
					%>
					</div>
					<div class="col-md-4">
					</div>
				</div>
			</div>
		</header>
		
		<!--Main section-->
		
		<% 			
			String product_id = (String)session.getAttribute("product_id");
			String vendor_id = (String)session.getAttribute("vendor_id");
			String string_quantity = (String)session.getAttribute("quantity");
			
			int quantity = Integer.parseInt(string_quantity);
			ProductDAO pdao = new ProductDAO();
			Product product = null;
			String product_name = null;
			BigDecimal price = new BigDecimal(0.0);
			try {
				product = pdao.getProductById(product_id);
				product_name = product.getName();
				price = pdao.getPricing(product);
				price = price.setScale(2, BigDecimal.ROUND_HALF_UP);
			} catch (Exception e) {
				request.setAttribute("message", e.getMessage());
			}
			BigDecimal total = price.multiply(new BigDecimal(quantity));
			total = total.setScale(2, BigDecimal.ROUND_HALF_UP);
			session.setAttribute("total", total);
		%>
		
		<section class="freebies has-padding" id="freebies">
			<div class="container freebies-intro">
				<div class="row">
					<form class="wp2 animated fadeInUp" name="orderForm" method="post" action="checkout.jsp">
						<div class="col-md-6 content-left">
							<div class="row">
								<div class="col-md-12">
								<%
									if (session.getAttribute("show_order") == null){
								%>
									<h4 id="login">Your order will be placed with this information:</h4>
								<%
									} else {
								%>
									<h4 id="login">Your order was be placed with this information:</h4>
								<%
									}
								%>
								</div>
							</div>
							<div class="row">
								<div class="col-md-1">
								</div>
								<div class="col-md-9">
									<div class="form-group">
										<label for="fullname" >Full Name</label>
										<input name="fullname" id="fullname" readonly class="form-control" type="text" value="<%= username %>" >
									</div>
									<div class="form-group">
										<label for="c_name" >Company Name</label>
										<input name="c_name" id="c_name" readonly class="form-control" type="text" value="<%= client.getCompName() %>" >
									</div>
									<div class="form-group">
										<label for="itin">Tax Registration No.</label>
										<input name="itin" id="itin" readonly class="form-control" maxlength="9" type="text" value="<%= client.getItin() %>">
									</div>
									<div class="form-group">
										<label for="doi" >Doi</label>
										<input name="doi" id="doi" readonly class="form-control" type="text" value="<%= client.getDoy() %>">
									</div>
									<div class="form-group">
										<label for="address" >Address</label>
										<input name="address" id="address" readonly class="form-control" type="text" value="<%= client.getAddress() %>" >
									</div>
									<div class="form-group">
										<label for="email" >E-mail</label><br>
										<input name="email" id="email" value="<%= client.getEmail() %>" readonly class="form-control" type="email">
									</div>
									<div class="form-group">
										<label for="phone" >Phone</label>
										<input name="phone" id="phone" value="<%= client.getPhone() %>"  readonly class="form-control" type="tel">
									</div>									
								</div>
							</div>
						</div>
						<div class="col-md-6 content-right">
							<div class="row">
								<div class="col-md-12">
									<h4>Your Order:</h4>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<table class="table table-hover wp2">
										<thead>
											<tr>
												<th>Item</th>
												<th>Quantity</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><%= product_name %></td>
												<td><%= quantity %></td>
												<td><%= price %> €</td>
											</tr>
											<tr>
												<td colspan="2"><h3>Total</h3></td>
												<td><h3><%= total %> €</h3></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<%
								if (session.getAttribute("show_order") == null){
							%>
							<div class="row">
								<div class="col-md-12 wp2">
									<button type="submit" class="btn btn-default price">Checkout</button>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</form>
				</div>
			</div>	
		</section>
		
		<jsp:include page="common_pages/footer.jsp"/>
		
	</body>

</html>
