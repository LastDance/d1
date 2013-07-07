<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="currentPage" content="welcome"/>
<meta name="currentCategory" content="welcome"/>
<title>欢迎 | DMS</title>
</head>
<body>

	<h2>DMS信息系统</h2>
	<div>
		<span class="label label-success"><%=session.getAttribute("user").toString()%>
			<%=" @ "%> <%=session.getAttribute("loginTimestamp")%></span>

	</div>
	<br />
	<div class="alert alert-info">研发中…</div>
	<div class="progress progress-info progress-striped active">
		<div class="bar" style="width: 10%"></div>
	</div>


</body>
</html>