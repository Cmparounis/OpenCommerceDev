	<div class="container-fluid">
		<div class="row">
			<div class="header-nav-wrapper">
				<div class="logo">
					<a href="index.html"><img src="img/synthetica-logo.png" alt="Logo Goes Here"></a>
				</div>
				<div class="primary-nav-wrapper">
					<nav>
						<ul class="primary-nav">
							<li><a href="index.html">Home</a></li>
							<li><a href="categories.html">Browse</a></li>
							<li><a href="dashboard.html">Dashboard</a></li>
							<li><a href="advanced_search.html">Advanced Search</a></li>
						</ul>
					</nav>
					<div class="secondary-nav-wrapper">
						<ul class="secondary-nav">
						<% if (session.getAttribute("user-object") == null){ %>
							<li class="subscribe"><a href="login.html">Log In</a></li>
							<% } else { %>
							<li class="subscribe dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-haspopup="true"><%= username %><span class="caret"></span></a>
								<div class="dropdown-menu">
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="dashboard.jsp">Dashboard</a>
										<li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
									</ul>
								</div>	
							</li>
<% } %>
							<li class="search"><a href="#search" class="show-search"><i class="fa fa-search"></i></a></li>
						</ul>
					</div>
					<div class="search-wrapper">
						<ul class="search">
							<li>
								<input type="text" id="search-input" placeholder="Start typing then hit enter to search">
								<span><a href="advanced_search.html">Advanced search</a></span>
							</li>
							<li>
								<a href="#" class="hide-search"><i class="fa fa-close"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="navicon">
					<a class="nav-toggle" href="#"><span></span></a>
				</div>
			</div>
		</div>
	</div>