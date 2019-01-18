import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import exercise1_8130081.DataValidation;
import exercise1_8130081.DepartmentDAO;
import exercise1_8130081.Department;

public class RegisterController_8130081 extends HttpServlet {

  /**
   * Handles HTTP POST requests.
   *
   * @param request
   *            the request object
   * @param response
   *            the response object
   *
   * @throws IOException
   *             if an input or output error is detected when the servlet
   *             handles the POST request
   * @throws ServletException
   *             if the request for the POST could not be handled
   */
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

    response.setContentType("text/html; charset=utf-8");
    PrintWriter out = new PrintWriter(response.getWriter(), true);

    /*
     * gets parameters from the request.
     */
    String department = request.getParameter("department");
    String am = request.getParameter("AM");
    String fullname = request.getParameter("fullName");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String gender = request.getParameter("gender");
    String check = request.getParameter("checkbox");

    DataValidation checkData = new DataValidation();

	try {

		out.println("<html lang='en'>");
		out.println("	<head>");
		out.println("	<meta charset='utf-8'>");
		out.println("	<meta http-equiv='X-UA-Compatible' content='IE=edge'>");
		out.println("	<meta name='viewport' content='width=device-width, initial-scale=1'>");
		out.println("	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->");
		out.println("	<meta name='description' content='Exercise Template 2017-2018'>");
		out.println("	<meta name='author' content='jdoe@example.com'>");
		out.println("");
		out.println("	<title>ISM-Successful Registered</title>");
		out.println("");
		out.println("	<!-- Bootstrap core CSS -->");
		out.println("	<link rel='stylesheet' href='../css/bootstrap.min.css'>");
		out.println("");
		out.println("	<!-- Custom styles for this template -->");
		out.println("	<link href='../css/theme_8XXXXXX.css' rel='stylesheet'>");
		out.println("");
		out.println("	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->");
		out.println("	<!--[if lt IE 9]>");
		out.println("	  <script src='https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js'></script>");
		out.println("	  <script src='https://oss.maxcdn.com/respond/1.4.2/respond.min.js'></script>");
		out.println("	<![endif]-->");
		out.println("	</head>");
		out.println("");
		out.println("	<body>");
		out.println("");
		out.println("	<!-- Fixed navbar -->");
		out.println("	<nav class='navbar navbar-inverse navbar-fixed-top'>");
		out.println("		<div class='container'>");
		out.println("			<div class='navbar-header'>");
		out.println("				<button type='button' class='navbar-toggle collapsed' data-toggle='collapse' data-target='#navbar' aria-expanded='false' aria-controls='navbar'>");
		out.println("					<span class='sr-only'>Toggle navigation</span>");
		out.println("					<span class='icon-bar'></span> <span class='icon-bar'></span>");
		out.println("					<span class='icon-bar'></span>");
		out.println("				</button>");
		out.println("				<a class='navbar-brand' href='#'>8130081</a>");
		out.println("			</div>");
		out.println("			<div id='navbar' class='navbar-collapse collapse'>");
		out.println("				<ul class='nav navbar-nav'>");
		out.println("					<li><a href='../index_8130081.html'>Home</a></li>");
		out.println("					<li class='active'><a href='../register_8130081.html'>Register</a></li>");
		out.println("					<li><a href='../about_8130081.html'>About</a></li>");
		out.println("				</ul>");
		out.println("");
		out.println("			</div>");
		out.println("			<!--/.nav-collapse -->");
		out.println("		</div>");
		out.println("	</nav>");
		out.println("");
		out.println("	<div class='container theme-showcase' role='main'>");
		out.println("");
		out.println("		<!-- Main jumbotron for a primary marketing message or call to action -->");
		out.println("		<div class='jumbotron'>");
		out.println("			<h1>OpenCommerce</h1>");
		out.println("		</div>");
		out.println("");
		out.println("		<!-- Page Title -->");
		out.println("		<div class='page-header'>");
		out.println("			<h1>Register Student</h1>");
		out.println("		</div>");
		out.println("");
		out.println("	</div>");

		if ( checkData.isAmValid(am) && checkData.isFullnameValid(fullname) && checkData.isValidPhoneNumber(phone) &&
			checkData.isValidGender(gender) && checkData.isValidEmailAddress(email) && checkData.checkDepartment(department) ) {

			DepartmentDAO depart = new DepartmentDAO();
			int id = Integer.parseInt(department);
			Department department_name = depart.getDepartmentByID(id);
			department = department_name.getName();

			out.println("	<div class='container'>");
			out.println("		<p class='alert alert-success' role='alert'>The Student has been registered to the Database</p>");
			out.println("	</div>");
			out.println("");
			out.println("	<div class='container'>");
			out.println("		<ul class='list-unstyled'>");
			out.println("    		<li><b>Department: </b>"+ department +"</li>");
			out.println("    		<li><b>AM: </b>"+ am +"</li>");
			out.println("    		<li><b>Fullname: </b>"+ fullname +"</li>");
			out.println("    		<li><b>Email: </b>"+ email +"</li>");
			out.println("			<li><b>Phone: </b>"+ phone +"</li>");
			out.println("			<li><b>Gender: </b>"+ gender +"</li>");
			if (check != null) {
				out.println("		<li><b>Stay up to date with the latest news: </b> <button type='button' class='btn btn-success btn-xs disabled'>Yes</button></li>");
			}
			out.println("		</ul>");
			out.println("	</div>");
			out.println("");
			out.println("");
			out.println("	<!-- footer -->");
			out.println("		<footer class='navbar-inverse'>");
			out.println("			<div class='container'>");
			out.println("				<div class='row'>");
			out.println("					<div class='col-xs-12'>");
			out.println("						<p class='text-center'>&copy; Copyright 2017 by ismgroup42</p>");
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
			out.println("");

		} else {

			out.println("	<div class='container'>");
			out.println("		<div class='alert alert-danger' role='alert'>");
			out.println("			<ol>");
			if (!checkData.checkDepartment(department)){
				out.println("			<li>The Department is not valid</li>");
			}
			if (!checkData.isAmValid(am)){
				out.println("			<li>The AM must be a 7-digit integer</li>");
			}
			if (!checkData.isFullnameValid(fullname)){
				out.println("			<li>The Fullname must be at least 5 characters long</li>");
			}
			if (!checkData.isValidEmailAddress(email)){
				out.println("			<li>The Email is not a valid email adress</li>");
			}
			if (!checkData.isValidPhoneNumber(phone)){
				out.println("			<li>The Phone must be a 10-digit number</li>");
			}
			if (!checkData.isValidGender(gender)){
				out.println("			<li>The Gender field is not valid</li>");
			}
			out.println("			</ol>");
			out.println("		</div>");
			out.println("	</div>");
			out.println("");
			out.println("	<div class='col text-center'>");
			out.println("		<a href='../register_8130081.html'>");
			out.println("			<button type='button' class='btn btn-primary btn-lg'>");
			out.println("				<span class='glyphicon glyphicon-chevron-left'></span>Back to the Form");
			out.println("			</button>");
			out.println("		</a>");
			out.println("	</div>");
			out.println("");
			out.println("	<!-- footer -->");
			out.println("		<footer class='navbar-inverse'>");
			out.println("			<div class='container'>");
			out.println("				<div class='row'>");
			out.println("					<div class='col-xs-12'>");
			out.println("						<p class='text-center'>&copy; Copyright 2017 by ismgroup42</p>");
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
			out.println("");
			out.println("	</body>");
			out.println("</html>");
		}
		} catch (Exception ex) {
			out.println("Exception: " + ex.getMessage());
			out.println("</body>");
      		out.println("</html>");
		}

    }

}

