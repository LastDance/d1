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
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet"
	media="screen" />
</head>
<body>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<h1>Information System</h1>
	<p>
		<b>Navigation</b>
	</p>
	<hr />

	<div id="sidebar" style="float: left; width: 200px">
		<ul>
			<li>1: link1</li>
			<li>2: link2</li>
		</ul>
	</div>

	<div id="content" style="float: left; width: 800px; min-height: 700px">
		<decorator:body />
	</div>

	<div id="footer" style="clear: both">
		<hr />
		<div style="text-align: center">© DSystem, Since 2013</div>
	</div>
</body>
</html>