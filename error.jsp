<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ocgr.*" %>


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
		<title>Login | Open Commerce</title>
		<meta name="description" content="An online marketplace for professional and industrial use">
		<meta name="keywords" content="e-commerce, online store, order, professional, industry, tools, machinery" />
		<meta name="author" content="Codrops, ismgroup42" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<%@ include file="common_pages/page_head.html" %>
	
	</head>
	
	<body>
	
	<%@ include file="common_pages/navbar.jsp" %>
	
	<section class="crew has-padding alternate-bg" id="team">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4>Error</h4>		
					<h3 class="text-center wp1"> Oops an error occured! <%= exception.getMessage() %> </h3>
				</div>
			</div>	
		</div>
	</section>	
	
	
	<jsp:include page="common_pages/footer.jsp"/>
	
	</body>

</html>