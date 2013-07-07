<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<!-- Le -->
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" />
<title>登录 - DMS</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<script src="http://code.jquery.com/jquery.js"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>

<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	max-width: 300px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading,.form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin input[type="text"],.form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}
</style>
<script src="<c:url value='/css/bootstrap-responsive.css'/>"></script>
</head>

<body>
	<spring:hasBindErrors htmlEscape="true" name="user">
		<c:if test="${errors.errorCount gt 0}">

			<div class="alert alert-error fade in" style="text-align: center">
				<a class="close" data-dismiss="alert" href="#">&times;</a>
				<c:forEach items="${errors.allErrors}" var="error">
					<span> <spring:message text="${error.defaultMessage}" />
					</span>
					<br />
				</c:forEach>
			</div>
		</c:if>
	</spring:hasBindErrors>

	<div class="container">
		<form:form method="post" action="login" commandName="user"
			class="form-signin">
			<h2 class="form-signin-heading">请登录</h2>
			<c:set var="label_username">
				<spring:message code='label.username' />
			</c:set>
			<form:errors path="username" cssClass="label label-important " />
			<form:input path="username" class="input-block-level"
				placeholder="${label_username}" />

			<c:set var="label_password">
				<spring:message code='label.password' />
			</c:set>
			<form:errors path="password" cssClass="label label-important" />
			<form:password path="password" class="input-block-level"
				placeholder="${label_password}" />
			<button class="btn btn-large btn-primary" type="submit">
				<spring:message code="label.login" />
			</button>
		</form:form>
	</div>
	<!-- /container -->

</body>
</html>