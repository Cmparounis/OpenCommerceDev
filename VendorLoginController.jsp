<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ocgr.*" %>
<%@ page errorPage="error.jsp"%>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

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
%>	
<jsp:forward page= "<%= request.getAttribute("currentPage") %>"/>