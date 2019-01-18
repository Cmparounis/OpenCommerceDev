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
ProductDAO pdao = new ProductDAO();
List<Product> products = new LinkedList<Product>();
try {
	 products = pdao.getProductByVendor(vendor);
}catch (Exception e) {
	e.printStackTrace();
}

%>
	<section class="get-started has-padding text-center" id="get-started">
		
			<div class="row">
				<div class="col-md-12 wp4 animated fadeInUp">
					<h2>Submit a new Product</h2>
					<a href="submitProduct.jsp" class="btn secondary-white">Here</a>
				</div>
			</div>
		
	</section>
	<section class="latest-articles has-padding" id="articles">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-4">
					<h4>Products submitted by <%= vendor.getCompName() %> </h4>
				</div>
			</div>
<%
if ( products.isEmpty() ) {
%>
<h3> No products submitted.</h3>
<%
} else {
	int counter = 0;
	for (Product product : products) {
		String desc = product.getDescription();
		counter++;
		if (counter%2 != 0 || counter == 1){
%>
			<div class="row has-top-margin">
<%
		}
%>
				<div class="col-md-4">
					<article class="article-post">
						<a href="ViewProduct?prod_id=<%= product.getId()%>">
							<div class="article-image has-overlay" style="background-image: url(img/article-01.jpg)">
							</div>
							<figure>
								<figcaption>
									<h2><%= product.getName()%></h2>
									<p><em>Product Description:</em> <%= desc %>... </p>
								</figcaption>
							</figure>
						</a>
						<ul class="article-footer">
							<li class="article-category">
								<a href="ViewByCategory?cat_id=<%=product.getCategory().getId()%>"><%=product.getCategory().getName()%></a>
							</li>
							
							<li class="article-comments">
							<%
							double avgRating = 0;
							try {
								 avgRating = pdao.getAverageRatings(product);
							%>
								 <span><i class="fa fa-star"></i><%= avgRating %>&emsp;</span>
							<%
							} catch (Exception e) {
							%>
								<span><i class="fa fa-star"></i>No ratings found&emsp;</span>
							<%
							}
							%>
								<span><a href="EditProduct?prod_id=<%= product.getId()%>" ><i class="fa fa-cog" aria-hidden="true"></i> Edit</a><span>

							</li>
						</ul>
					</article>
				</div>
<%
		if (counter%2 == 0 && counter != 1){
%>
			</div>
<%
		}
	}
}
%>
			</div>	
		</div>
	</section>
	<!-- END SECTION: Articles -->



