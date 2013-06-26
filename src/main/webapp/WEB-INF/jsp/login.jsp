<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap -->
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet"
	media="screen" />
<title>登录 - DMS</title>
</head>
<body>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<form:form method="post" action="authentication" commandName="sysUser">
		<table>
			<tr>
				<td><form:label path="username">
						<spring:message code="label.username" />
					</form:label></td>
				<td><form:input path="username" /></td>
			</tr>
			<tr>
				<td><form:label path="password">
						<spring:message code="label.password" />
					</form:label></td>
				<td><form:password path="password" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"
					value="<spring:message code="label.login"/>" /></td>
			</tr>
		</table>
	</form:form>
</body>
</html>