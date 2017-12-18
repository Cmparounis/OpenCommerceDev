<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setAttribute("currentPage", request.getRequestURI().replace(request.getContextPath() + "/","") );
	
	if( session.getAttribute("user-object") == null ) {
		request.setAttribute("message", "Your session has expired. Please login.");
%>
		<jsp:forward page="login.jsp"/>
<%	}  %>
