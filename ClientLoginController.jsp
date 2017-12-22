<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ocgr.*" %>

<%
String email = (String)request.getParameter("email");
String password = (String)request.getParameter("password");

ClientDAO cdao = new ClientDAO();

try {
	cdao.authenticate(email, password);
} catch(Exception e) {
	
	request.setAttribute("message", e.getMessage());
%>
	<jsp:forward page="login.jsp"/>	
<%	
}

session.setAttribute( "user-object", cdao.findClient( email, password) );
session.setAttribute( "user-type", "client" );

if (session.getAttribute("currentPage") == null ) {
%>
	<jsp:forward page="dashboard.jsp"/>
<%	
} else {	
	String previousPage = (String)session.getAttribute("currentPage");
%>	
	<jsp:forward page="<%=previousPage%>"/>
<%	
}
%>