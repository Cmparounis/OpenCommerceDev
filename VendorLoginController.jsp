<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ocgr.*" %>
<%@ page errorPage="error.jsp"%>

<%
String email = (String)request.getParameter("email");
String password = (String)request.getParameter("password");

VendorDao vdao = new VendorDao();

try {
	vdao.authenticate(email, password);
} catch(Exception e) {
	
	request.setAttribute("message", e.getMessage());
%>
	<jsp:forward page="vendor_login.jsp"/>	
<%	
}

session.setAttribute( "user-object", vdao.findVendor( email, password) );
session.setAttribute( "user-type", "vendor" );

if (request.getAttribute("currentPage") == null ) {
%>
	<jsp:forward page="dashboard.jsp"/>
<%	
} else {	
	String previousPage = (String)request.getAttribute("currentPage");
%>	
	<jsp:forward page="<%=previousPage%>"/>
<%	
}
%>