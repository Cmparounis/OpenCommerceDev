<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List, ocgr.*" %>
<%@ page errorPage="error.jsp"%>

<%@ include file="common_pages/control_session.jsp" %>
<%
	if (userType==null || (userType.equals("client"))){		
%>
		<jsp:forward page="index.jsp"/>
<%	
}
%>		

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en-US">
<!--<![endif]-->

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Submit Product | Open Commerce</title>
		<meta name="description" content="An online marketplace for professional and industrial use">
		<meta name="keywords" content="e-commerce, online store, order, professional, industry, tools, machinery" />
		<meta name="author" content="Codrops, imdgroup42" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<%@ include file="common_pages/page_head.html" %>
	
	</head>
	
	<body>
	
	<%@ include file="common_pages/navbar.jsp" %>
	
	<header>
		<div class="container">
			<div class="row is-centered">
				<h1>Product</h1>
			</div>
		</div>
	</header>
	
	<!--Message section-->
	<%
	if (request.getAttribute("message") != null ) {
	%>
	<section class="crew has-padding alternate-bg" id="team">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h4>Unable to submit Product</h4>		
					<h3 class="text-center wp1"> Oops an error occured! <%= (String)request.getAttribute("message") %> </h3>
				</div>
			</div>	
		</div>
	</section>	
	<%
	}
	%>
	
	<!--Main section-->
	<section class="freebies has-padding" id="freebies">
		<div class="container freebies-intro">
			<div class="row">
				<form class="form-horizontal wp2 animated fadeInUp" name="productForm" method="post" action="ProductController" onsubmit="return checkForm(this);" >
					<div class="row">			
						<div class="col-md-offset-2 col-md-12">
							<h4>Submit your Product</h4>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="inputCategory" class="col-md-3 control-label">Category</label>
								<div class="col-md-6">
									<select name="category" class="form-control" id="inputCategory" required>
										<option value="none" selected disabled>Choose a Category</option>
										<%
											CategoryDAO cdao = new CategoryDAO();
											List<Category> categories = cdao.getCategories();
											for (int i=0; i< categories.size(); i++) { 
										%>
												<option value="<%= categories.get(i).getId() %>"> <%= categories.get(i).getDescription() %> </option>
										<%	
											}
										%>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="inputName" class="col-md-3 control-label">Product Name</label>
								<div class="col-md-6">
									<input class="form-control" name="name" id="inputName" placeholder="Product Name" type="text" maxlength="30" required>
								</div>
							</div>
							<div class="form-group">
								<label for="inputDescription" class="col-md-3 control-label">Product Description</label>
								<div class="col-md-6">
									<input class="form-control" name="description" id="inputDescription" placeholder="Description" type="text" maxlength="50" required>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPhoto" class="col-md-3 control-label">Upload a Photo</label>
								<div class="col-md-6">
									<input name="photo" id="inputPhoto" type="file">
								</div>
							</div>		
							<hr>
							<div class="form-group">
								<label for="inputPieces" class="col-md-3 control-label">Total Pieces</label>
								<div class="col-md-2">
									<input class="form-control" name="pieces" id="inputPieces" placeholder="Pieces" type="number" maxlength="6" min=1 required>
								</div>
							</div>				
							<div class="form-group">
								<label for="inputPrice" class="col-md-3 control-label">Initial Price</label>
								<div class="col-md-2">
									<input class="form-control" name="price" id="inputPrice" placeholder="Price" type="number" step="0.01" maxlength="10" min=0 required>
								</div>
							</div>						
							<div class="form-group">
								<label for="inputDiscount" class="col-md-3 control-label">Discount Percentage %</label>
								<div class="col-md-2">
									<input class="form-control" name="discount" id="inputDiscount" type="number" step="0.1" placeholder="Percent(%)" min=0 required>
								</div>
							</div>
							<div class="form-group">
								<label for="inputScaling" class="col-md-3 control-label">Per Number of Pieces</label>
								<div class="col-md-2">
									<input class="form-control" name="scaling" id="inputScaling" placeholder="Scaling" type="number" maxlength="6" min=1 required>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="row is-centered">
							<button type="submit" class="btn primary wp2 animated fadeInUp">Submit</button>	
						</div>
					</div>
				</form>	
			</div>
		</div>
	</section>
	<!--End Main section-->
	
	<jsp:include page="common_pages/footer.jsp"/>
		
</body>

</html>