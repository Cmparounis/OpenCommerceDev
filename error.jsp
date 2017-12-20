<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ocgr.*" %>
<%@ page isErrorPage="true"%>

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
		
	<%@ include file="COMMON_PAGES/page_head.html" %>
	
	</head>
	
	<body>
	
	<jsp:include file="COMMON_PAGES/navbar.jsp"/>
	
	
	<h3 class="text-center wp1"> Oops an error occured! (<%= exception.getMessage() %>) </h3>
	
	
	<%@ include page="COMMON_PAGES/footer.jsp" %>
	
	</body>

</html>