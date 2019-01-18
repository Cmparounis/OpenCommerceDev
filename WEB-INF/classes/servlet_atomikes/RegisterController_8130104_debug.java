import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import exercise1_8130104.*;

public class RegisterController_8130104_debug extends HttpServlet {
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		response.setContentType("text/html; charset=ISO-8859-7");
		PrintWriter out = new PrintWriter(response.getWriter(), true);

		String department  = request.getParameter("department");
		String am = request.getParameter("am");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");

		exercise1_8130104.DataValidation newInstance = new exercise1_8130104.DataValidation();

		try{
			out.println("<!DOCTYPE html>");
			out.println("<html lang='en'>");
			out.println("	<head>");
			out.println("	<meta charset='utf-8'>");
			out.println("	<meta http-equiv='X-UA-Compatible' content='IE=edge'>");
			out.println("	<meta name='viewport' content='width=device-width, initial-scale=1'>");
			out.println("	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->");
			out.println("	<meta name='description' content='Exercise Template 2017-2018'>");
			out.println("	<meta name='author' content='jdoe@example.com'>");
			out.println("");
			out.println("	<title>IsmGroup42 - Register</title>");
			out.println("");
			out.println("	<!-- Bootstrap core CSS -->");
			out.println("	<link rel='stylesheet'href='../css/bootstrap.min.css'>");
			out.println("");
			out.println("	<!-- Custom styles for this template -->");
			out.println("	<link href='../css/theme_8XXXXXX.css' rel='stylesheet'>");
			out.println("");
			out.println("	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->");
			out.println("	<!--[if lt IE 9]>");
			out.println("		  <script src='https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js'></script>");
			out.println("		  <script src='https://oss.maxcdn.com/respond/1.4.2/respond.min.js'></script>");
			out.println("	<![endif]-->");
			out.println("	</head>");
			out.println("");
			out.println("	<body>");
			out.println("");
			out.println("		<!-- Fixed navbar -->");
			out.println("		<nav class='navbar navbar-inverse navbar-fixed-top'>");
			out.println("			<div class='container'>");
			out.println("				<div class='navbar-header'>");
			out.println("					<button type='button' class='navbar-toggle collapsed' data-toggle='collapse' data-target='#navbar' aria-expanded='false' aria-controls='navbar'>");
			out.println("						<span class='sr-only'>Toggle navigation</span>");
			out.println("						<span class='icon-bar'></span> <span class='icon-bar'></span>");
			out.println("						<span class='icon-bar'></span>");
			out.println("					</button>");
			out.println("					<a class='navbar-brand' href='../index_8130104.html'>8130104</a>");
			out.println("				</div>");
			out.println("				<div id='navbar' class='navbar-collapse collapse'>");
			out.println("					<ul class='nav navbar-nav'>");
			out.println("						<li><a href='../index_8130104.html'>Home</a></li>");
			out.println("						<li class='active'><a href='../register_8130104.html'>Register</a></li>");
			out.println("						<li><a href='../about_8130104.html'>About</a></li>");
			out.println("					</ul>");
			out.println("");
			out.println("				</div>");
			out.println("				<!--/.nav-collapse -->");
			out.println("			</div>");
			out.println("		</nav>");
			out.println("");
			out.println("		<div class='container theme-showcase' role='main'>");
			out.println("");
			out.println("			<!-- Main jumbotron for a primary marketing message or call to action -->");
			out.println("			<div class='jumbotron'>");
			out.println("				<h1>Team OpenCommerce</h1>");
			out.println("			</div>");
			out.println("");
			out.println("			<!-- Page Title -->");
			out.println("			<div class='page-header'>");
			out.println("				<h1>Register Student</h1>");
			out.println("			</div>");
			out.println("			");
			if ((newInstance.isAmValid(am) == true)&&(newInstance.isFullnameValid(fullname) == true)&&(newInstance.isValidPhoneNumber(phone) == true)&&(newInstance.isValidGender(gender) == true)&&(newInstance.isValidEmailAddress(email) == true)){
				exercise1_8130104.DepartmentDAO dept = new exercise1_8130104.DepartmentDAO();
				int depId = Integer.parseInt(department);

				out.println("			<div class='alert alert-success'>");
				out.println("				The Student has been registered to the Database");
				out.println("			</div>");
				out.println("			<div>");
				out.println("				<ul class='list-unstyled'>");
				out.println("					<li><span><b> Department:</b>"+ dept.getDepartmentByID(depId).getName() +"</span>");
				out.println("					<li><span><b> AM:</b>"+ am +"</span>");
				out.println("					<li><span><b> Full Name:</b>"+ fullname +"</span>");
				out.println("					<li><span><b> Email:</b>"+ email +"</span>");
				out.println("					<li><span><b> Phone:</b>"+ phone +"</span>");
				out.println("					<li><span><b> Gender:</b>"+ gender +"</span>");
				out.println("					<li><span><b> Stay up to date with the latest news:</b> <button type='button' class='btn-sm btn-success'>Yes</button></span>");
				out.println("			</div>");
				out.println("	</div>");
				out.println("		<!-- /container -->");
				out.println("");
				out.println("		<!-- footer -->");
				out.println("		<footer class='navbar-inverse'>");
				out.println("			<div class='container'>");
				out.println("				<div class='row'>");
				out.println("					<div class='col-xs-12'>");
				out.println("						<p class='text-center'>&copy; Copyright 2017 by ismgroup42	</p>");
				out.println("					</div>");
				out.println("				</div>");
				out.println("			</div>");
				out.println("		</footer>");
				out.println("		<!-- End footer -->");
				out.println("");
				out.println("		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->");
				out.println("		<!-- jQuery library -->");
				out.println("		<script src='js/jquery.min.js'></script>");
				out.println("		<!-- Bootstrap core JavaScript -->");
				out.println("		<script	src='js/bootstrap.min.js'></script>");
				out.println("	</body>");
				out.println("</html>");
			} else {
				out.println("			<div class='alert alert-danger'>");
				out.println("				<ol class='unstyled'>");
				if (newInstance.checkDepartment(department) == false){
								out.println("					<li><span>The Department is not valid</li> ");
				}
				if (newInstance.isAmValid(am) == false){
				out.println("					<li><span>The AM must be a 7-digit integer</li> ");
				}
				if (newInstance.isFullnameValid(fullname) == false){
				out.println("					<li><span>The Fullname must be at least 5 characters long</li> ");
				}
				if (newInstance.isValidEmailAddress(email) == false){
				out.println("					<li><span>The Email is not a valid email address</li> ");
				}
				if (newInstance.isValidGender(gender) == false){
				out.println("					<li><span>The Gender field is not valid</li> ");
				}
				if (newInstance.isValidPhoneNumber(phone) == false){
				out.println("					<li><span>The Phone must be a 10-digit number</li> ");
				}
				out.println("				</ol>");
				out.println("			</div>");
				out.println("			");
				out.println("				<div class='justify-content-md-center'>");
				out.println("					<a href='../register_8130104.html' class='btn-lg btn-info' role='button'><span class='glyphicon glyphicon-chevron-left'></span>Back to form</a>");
				out.println("				</div>");
				out.println("		</div>");
				out.println("		</div>");
				out.println("		<!-- /container -->");
				out.println("");
				out.println("		<!-- footer -->");
				out.println("		<footer class='navbar-inverse'>");
				out.println("			<div class='container'>");
				out.println("				<div class='row'>");
				out.println("					<div class='col-xs-12'>");
				out.println("						<p class='text-center'>&copy; Copyright 2017 by ismgroup42	</p>");
				out.println("					</div>");
				out.println("				</div>");
				out.println("		</footer>");
				out.println("		<!-- End footer -->");
				out.println("");
				out.println("		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->");
				out.println("		<!-- jQuery library -->");
				out.println("		<script src='js/jquery.min.js'></script>");
				out.println("		<!-- Bootstrap core JavaScript -->");
				out.println("		<script	src='js/bootstrap.min.js'></script>");
				out.println("	</body>");
				out.println("</html>");
			}
		}
	catch (Exception ex) {
			out.println("<html>");
			out.println("	<body>");
			out.println("	Exception:" + ex.getMessage());
			out.println("	</body>");
			out.println("</html>");
		}

	}
}








