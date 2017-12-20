<%@ page import="java.util.Set, java.util.HashSet" %>
<%
request.setAttribute("currentPage", request.getRequestURI().replace(request.getContextPath() + "/","") );
	
String userType = "";
String username = "";
Client client = null;
Vendor vendor = null;

if (session.getAttribute("user-object")!= null){
	
	try {
		userType = (String)session.getAttribute("user-type");
	} catch (Exception e) {
		request.setAttribute("message", e.getMessage());
	}
	
	if (userType.equals("client")) {
		client = (Client)session.getAttribute("user-object");
		username = client.getFullname();
	} else if (userType.equals("vendor")) {
		vendor = (Vendor)session.getAttribute("user-object");
		username = vendor.getFullname();
	}
	
} else {
	Set<String> pages = new HashSet<String>();
	pages.add("dashboard.jsp");
	pages.add("");
	pages.add("");
	pages.add("");
	if( pages.contains(request.getRequestURI().replace(request.getContextPath() + "/","")) ) {
		request.setAttribute("message", "Login is necessary in order to proceed");
%>
		<jsp:forward page="login.jsp"/>
<%
	}
}  
%>
