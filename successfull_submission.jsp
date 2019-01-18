<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DateFormat, java.text.SimpleDateFormat, java.util.Date, ocgr.*" %>
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
		<title>Register | Open Commerce</title>
		<meta name="description" content="An online marketplace for professional and industrial use">
		<meta name="keywords" content="e-commerce, online store, order, professional, industry, tools, machinery" />
		<meta name="author" content="Codrops, imdgroup42" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<%@ include file="common_pages/page_head.html" %>
	
	</head>
	
	<body>
	
	<%@ include file="common_pages/navbar.jsp" %>
	
	<header>
		<div class="container">
			<div class="row is-centered">
				<h1>Successful Submission</h1>
			</div>
		</div>
	</header>
<%
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	Date date = new Date();
	Category category = (Category)request.getAttribute("category");
	String prod_name = (String)request.getAttribute("prod_name");
	String description = (String)request.getAttribute("description");
	Product product = (Product)request.getAttribute("product");	
	String pieces = (String)request.getAttribute("pieces");
	String price = (String)request.getAttribute("price");
	String scaling = (String)request.getAttribute("scaling");
%>
	
	<!--Main section-->
	<section class="freebies has-padding" id="freebies">
		<div class="container">
			<div class="row is-centered">
				<h1 class="wp1">Your product has been successfully submitted</h1>
				<hr>
				<h3>Product Information :</h3>
				<table class="table table-hover table-condensed active animated fadeInUp">
					<thead>
						<tr>
							<th>Submission Date</th>
							<th>Category</th>
							<th>Product Name</th>
							<th>Product Description</th>
							<th>Product id</th>
							<th>Pieces Submited</th>
							<th>Initial Price</th>
							<th>Scaling Info</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<tr class="active">
							<div class="form-group">
								<td><span class="date"><%=dateFormat.format(date)%></span></td>
								<td><a href="ViewByCategory?cat_id=<%=category.getId() %>"><%=category.getName()%></a></td>
								<td><%=prod_name%></a></td>
								<td><%=description%></td>
								<td><a href="ViewProduct?prod_id=<%=product.getId()%>"><%=product.getName()%></a></td>
								<td>&emsp;&emsp;&emsp;<%=pieces%></a></td>
								<td>&emsp;<%=price%>&euro;</td>
								<td><%=scaling%></a></td>
							</div>	
						</tr>
					</tbody>
				</table>
			</div>
		</div>	
	</section>
	<!--End Main section-->
	
	<jsp:include page="common_pages/footer.jsp"/>
		
</body>

</html>