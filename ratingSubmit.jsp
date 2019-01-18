<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ocgr.*" %>
<%@ page errorPage="error.jsp"%>

<%@ include file="common_pages/control_session.jsp" %>

<%
String ratingStr = (String)request.getParameter("input-21b");
double rating = Double.parseDouble(ratingStr);

String comment = (String)request.getParameter("comment");

String product = (String)request.getParameter("product");

String previousPage = "ViewProduct?prod_id="+ product;
%>



<%
if (session.getAttribute("user-object") == null) {
	request.setAttribute("message", "Rating was not submitted. Make sure you are logged in as a Client.");
%>
	<jsp:forward page="<%=previousPage %>" />
<%
} else if (userType.equals("client")) {
	ClientDAO cdao = new ClientDAO();
	RatingDAO rdao = new RatingDAO();
	Rating rate = new Rating( client.getId(), product, rating, comment);
	try {
	rdao.SubmitRating(rate);
	} catch (Exception e) {
		request.setAttribute("message", "Rating was not submitted. Remember, you can only rate once.");
%>
	<jsp:forward page="<%=previousPage %>" />
<%
	}
	request.setAttribute("message", "Rating submitted.");
%>
	<jsp:forward page="<%=previousPage %>" />
<%
} else {
	request.setAttribute("message", "Rating was not submitted. Make sure you are logged in as a Client.");
%>
	<jsp:forward page="<%=previousPage %>" />
<%
}
%>


