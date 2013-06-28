<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎 | DMS</title>
</head>
<body>

	<h2>DMS信息系统</h2>
	
	<%= session.getAttribute("sysuser") %>
	<% java.util.Date date=new java.util.Date();%>
	<%=date%>
	
</body>
</html>