<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<!-- Bootstrap -->
<link href="<c:url value='/css/bootstrap.css'/>" rel="stylesheet" />
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
</head>
<body>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="<c:url value='/js/bootstrap.js'/>"></script>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<button type="button" class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="brand"
					href="http://twitter.github.io/bootstrap/examples/fluid.html#">DMS</a>
				<div class="nav-collapse collapse">
					<p class="navbar-text pull-right">
						Logged in as <a
							href="http://twitter.github.io/bootstrap/examples/fluid.html#"
							class="navbar-link">Username</a>
					</p>
					<ul class="nav">
						<li class="active"><a
							href="http://twitter.github.io/bootstrap/examples/fluid.html#">Home</a></li>
						<li><a
							href="http://twitter.github.io/bootstrap/examples/fluid.html#about">About</a></li>
						<li><a
							href="http://twitter.github.io/bootstrap/examples/fluid.html#contact">Contact</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3">
				<div class="well sidebar-nav">
					<ul class="nav nav-list">
						<li class="nav-header">Sidebar</li>
						<li class="active"><a
							href="http://twitter.github.io/bootstrap/examples/fluid.html#">Link</a></li>
						<li><a
							href="http://twitter.github.io/bootstrap/examples/fluid.html#">Link</a></li>
						<li><a
							href="http://twitter.github.io/bootstrap/examples/fluid.html#">Link</a></li>
						<li class="nav-header">Sidebar</li>
						<li><a
							href="http://twitter.github.io/bootstrap/examples/fluid.html#">Link</a></li>
						<li><a
							href="http://twitter.github.io/bootstrap/examples/fluid.html#">Link</a></li>
						<li class="nav-header">Sidebar</li>
						<li><a
							href="http://twitter.github.io/bootstrap/examples/fluid.html#">Link</a></li>
						<li><a
							href="http://twitter.github.io/bootstrap/examples/fluid.html#">Link</a></li>

					</ul>
				</div>
				<!--/.well -->
			</div>
			<!--/span-->
			<div class="span9">
				<decorator:body />
			</div>
			<!--/span-->
		</div>
		<!--/row-->

		<hr />

		<div style="text-align: center">
			<p>© DSystem 2013</p>
		</div>
	</div>
	<!--/.fluid-container-->

</body>
</html>