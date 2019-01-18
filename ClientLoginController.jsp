<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ocgr.*" %>
<%@ page errorPage="error.jsp"%>

<%
String email = (String)request.getParameter("email");
String password = (String)request.getParameter("password");
String categ = (String)session.getAttribute("cat_id");
String product = (String)session.getAttribute("prod_id");
String search_input = (String)session.getAttribute("search_entry");

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
	if (previousPage.equals("ViewByCategory")){
%>	
		<jsp:forward page="<%=previousPage%>">
		<jsp:param name="cat_id" value="<%=categ%>"/>
		</jsp:forward>
	<%	
	}else if (previousPage.equals("ViewProduct")) {
	%>
		<jsp:forward page="<%=previousPage%>">
		<jsp:param name="prod_id" value="<%=product%>"/>
		</jsp:forward>
	<%	
	}else if (previousPage.equals("Search")) {
	%>
		<jsp:forward page="<%=previousPage%>">
		<jsp:param name="search_entry" value="<%=search_input%>"/>
		</jsp:forward>
	<%
	}
	%>
	<jsp:forward page="<%=previousPage%>"/>
<%	
}
%>