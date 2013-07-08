<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<head>
<title></title>
	<decorator:usePage id="thePage" />
	<link href="<c:url value='/css/bootstrap.css'/>" rel="stylesheet" />
	<link href="<c:url value='/css/datepicker.css'/>" rel="stylesheet" />
</head>
<body>
	<decorator:body/>
</body>
</html>