<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ocgr.*" %>
<%@ page errorPage="error.jsp"%>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

ClientDao cdao = new ClientDao();

try {
	cdao.authenticate(email, password);
} catch(Exception e) {
	
	request.setAttribute("message", e.getMessage());
%>
	<jsp:forward page="client_login.jsp"/>	
<%	
}

session.setAttribute( "user-object", cdao.findClient( email, password) );
session.setAttribute( "user-type", "client" );
%>	
<jsp:forward page="<%= request.getAttribute("currentPage")%>"/>
