<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ocgr.*" %>
<%@ page errorPage="error.jsp"%>

<%
	session.setAttribute("quantity", request.getParameter("qrange"));
%>

<%@ include file="common_pages/control_session.jsp" %>

<jsp:forward page="order.jsp"/>