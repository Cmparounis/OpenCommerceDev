<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="ocgr.Category" %>
<%@ page import="ocgr.CategoryDAO" %>
<%@ page errorPage="error.jsp"%>

<%

try {
	session.getAttribute("user-object");
} catch(Exception e) { 
	request.setAttribute("message", e.getMessage());
}
String check = null;
String username;
if (session.getAttribute("user-object")!= null){
	try {
		check = (String) session.getAttribute("user-type");
	} catch (Exception e) {
		request.setAttribute("message", e.getMessage());
	}
	if (check.equals("client")) {
		Client client = (Client)session.getAttribute("ex3-user-object");
		ClientDAO cdao = new ClientDAO();
		username = client.getFullname();
	} else if (check.equals("vendor")) {
		Vendor vendor = (Vendor)session.getAttribute("ex3-user-object");
		VendorDAO vdao = new VendorDAO();
		username = vendor.getFullname();
	} else {
		throw new ServletException("Invalid user object");
	}
}

CategoryDAO cdao = new CategoryDAO();
List<Category> categories = new ArrayList<Category>();
try {
	categories= cdao.getCategories();
} catch (Exception e) {
	request.setAttribute("message", e.getMessage());
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
	<title>Browse | Open Commerce</title>
	<meta name="description" content="An online marketplace for professional and industrial use">
	<meta name="keywords" content="e-commerce, online store, order, professional, industry, tools, machinery" />
	<meta name="author" content="Codrops, ismgroup42" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="COMMON_FILES/page_head.html" %>
</head>
<body>
<%@ include file="COMMON_FILES/navbar.jsp" %>
	<section class="freebies has-padding" id="freebies">
		<div class="container freebies-intro">
			<div class="row">
				<div class="col-md-12">
					<h4>Categories</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 content-left">
				</div>
				<div class="col-md-6 content-right">
				</div>
			</div>
		</div>
		<div class="container-fluid">
<%
int counter = 0;
		for (Category category: categories){
			counter++;
			switch (counter) {
				case 1: 
%>
			<div class="row">
				<div class="col-md-4 no-padding">
					<article class="item wp5">
						<figure class="has-overlay">
							<figcaption class="overlay">
								<div class="freebie-content">
									<a href="servlet/ViewByCategory?id="<%=category.getId %>""><h2><%= category.getName()%></h2></a>
									<div class="group">
										<div class="row">
											<div class="col-xs-3">
												<a href="servlet/ViewByCategory?id="<%=category.getId %>""><%= category.getDescription()%></a>
											</div>
										</div>
									</div>
								</div>
							</figcaption>
							<img src="img/sedna-freebie.jpg" alt="Sedna Freebie">
						</figure>
					</article>
				</div>
			
<%				
				
				break;
				case 2: 
%>
				<div class="col-md-4 no-padding">
					<article class="item wp5">
						<figure class="has-overlay">
							<figcaption class="overlay">
								<div class="freebie-content">
									<a href="servlet/ViewByCategory?id="<%=category.getId %>""><h2><%= category.getName()%></h2></a>
									<div class="group">
										<div class="row">
											<div class="col-xs-3">
												<a href="servlet/ViewByCategory?id="<%=category.getId %>""><%= category.getDescription()%></a>
											</div>
										</div>
									</div>
								</div>
							</figcaption>
							<img src="img/sedna-freebie.jpg" alt="Sedna Freebie">
						</figure>
					</article>
				</div>
<%	
				break;
				case 3:
%>
				<div class="col-md-4 no-padding">
					<article class="item wp5">
						<figure class="has-overlay">
							<figcaption class="overlay">
								<div class="freebie-content">
									<a href="servlet/ViewByCategory?id="<%=category.getId %>""><h2><%= category.getName()%></h2></a>
									<div class="group">
										<div class="row">
											<div class="col-xs-3">
												<a href="servlet/ViewByCategory?id="<%=category.getId %>""><%= category.getDescription()%></a>
											</div>
										</div>
									</div>
								</div>
							</figcaption>
							<img src="img/sedna-freebie.jpg" alt="Sedna Freebie">
						</figure>
					</article>
				</div>
			</div>
<%					
				break;
				case 4:
%>
			<div class="row">
				<div class="col-md-6 no-padding">
					<article class="item wp5">
						<figure class="has-overlay">
							<figcaption class="overlay">
								<div class="freebie-content">
									<a href="servlet/ViewByCategory?id="<%=category.getId %>""><h2><%= category.getName()%></h2></a>
									<div class="group">
										<div class="row">
											<div class="col-xs-3">
												<a href="servlet/ViewByCategory?id="<%=category.getId %>""><%= category.getDescription()%></a>
											</div>
										</div>
									</div>
								</div>
							</figcaption>
							<img src="img/sedna-freebie.jpg" alt="Sedna Freebie">
						</figure>
					</article>
				</div>
<%					
				break;
				case 5:
%>
				<div class="col-md-6 no-padding">
					<article class="item wp5">
						<figure class="has-overlay">
							<figcaption class="overlay">
								<div class="freebie-content">
									<a href="servlet/ViewByCategory?id="<%=category.getId %>""><h2><%= category.getName()%></h2></a>
									<div class="group">
										<div class="row">
											<div class="col-xs-3">
												<a href="servlet/ViewByCategory?id="<%=category.getId %>""><%= category.getDescription()%></a>
											</div>
										</div>
									</div>
								</div>
							</figcaption>
							<img src="img/sedna-freebie.jpg" alt="Sedna Freebie">
						</figure>
					</article>
				</div>
			</div>
<%					
				break;
				case 6:
%>
			<div class="row">
				<div class="col-md-3 no-padding">
					<article class="item wp5">
						<figure class="has-overlay">
							<figcaption class="overlay">
								<div class="freebie-content">
									<a href="servlet/ViewByCategory?id="<%=category.getId %>""><h2><%= category.getName()%></h2></a>
									<div class="group">
										<div class="row">
											<div class="col-xs-3">
												<a href="servlet/ViewByCategory?id="<%=category.getId %>""><%= category.getDescription()%></a>
											</div>
										</div>
									</div>
								</div>
							</figcaption>
							<img src="img/sedna-freebie.jpg" alt="Sedna Freebie">
						</figure>
					</article>
				</div>
<%					
				break;
				case 7:
%>
				<div class="col-md-3 no-padding">
					<article class="item wp5">
						<figure class="has-overlay">
							<figcaption class="overlay">
								<div class="freebie-content">
									<a href="servlet/ViewByCategory?id="<%=category.getId %>""><h2><%= category.getName()%></h2></a>
									<div class="group">
										<div class="row">
											<div class="col-xs-3">
												<a href="servlet/ViewByCategory?id="<%=category.getId %>""><%= category.getDescription()%></a>
											</div>
										</div>
									</div>
								</div>
							</figcaption>
							<img src="img/sedna-freebie.jpg" alt="Sedna Freebie">
						</figure>
					</article>
				</div>
<%					
				break;
				case 8:
%>
				<div class="col-md-3 no-padding">
					<article class="item wp5">
						<figure class="has-overlay">
							<figcaption class="overlay">
								<div class="freebie-content">
									<a href="servlet/ViewByCategory?id="<%=category.getId %>""><h2><%= category.getName()%></h2></a>
									<div class="group">
										<div class="row">
											<div class="col-xs-3">
												<a href="servlet/ViewByCategory?id="<%=category.getId %>""><%= category.getDescription()%></a>
											</div>
										</div>
									</div>
								</div>
							</figcaption>
							<img src="img/sedna-freebie.jpg" alt="Sedna Freebie">
						</figure>
					</article>
				</div>
<%					
				break;
				case 9:
%>
				<div class="col-md-3 no-padding">
					<article class="item wp5">
						<figure class="has-overlay">
							<figcaption class="overlay">
								<div class="freebie-content">
									<a href="servlet/ViewByCategory?id="<%=category.getId %>""><h2><%= category.getName()%></h2></a>
									<div class="group">
										<div class="row">
											<div class="col-xs-3">
												<a href="servlet/ViewByCategory?id="<%=category.getId %>""><%= category.getDescription()%></a>
											</div>
										</div>
									</div>
								</div>
							</figcaption>
							<img src="img/sedna-freebie.jpg" alt="Sedna Freebie">
						</figure>
					</article>
				</div>
			</div>
<%					
				counter = 0;
				break;
			}
		}
%>
			
<%
		}
		
		</div>
	</section>
<% 
if (session.getAttribute("user-object")= null) {
%>
<jsp:include page="get_started.jsp" />  
<%
}
%>
<%@ include page="COMMON_FILES/footer" %>


	</body>
</html>