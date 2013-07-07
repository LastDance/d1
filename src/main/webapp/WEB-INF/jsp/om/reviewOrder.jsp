<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="currentPage" content="createOrder" />
<meta name="currentCategory" content="OM" />

<title>任务单录入| DMS</title>
</head>
<body>
	<script src="<c:url value='/js/bootstrap-datepicker.js'/>"></script>
	<script src="<c:url value='/js/bootstrap-datepicker.zh-CN.js'/>"></script>

	<h2>任务单录入</h2>
	<table class="table">
		<tr>
			<td><spring:message code="label.order.number" /></td>
			<td>${rof.order.prefix }${rof.order.id }</td>
			<td><spring:message code="label.order.status" /></td>
			<td>${rof.order.status }</td>
		</tr>
		<tr>
			<td><spring:message code="label.order.customer" /></td>
			<td>${rof.order.customer }</td>
			<td><spring:message code="label.order.requiredDate" /></td>
			<td>${rof.order.requiredDate }</td>
		</tr>
		<tr>
			<td><spring:message code="label.order.comment" /></td>
			<td colspan="3">${rof.order.comment }</td>
		</tr>
		<tr>
			<td><spring:message code="label.order.line" /></td>
			<td>${rof.line.line }</td>
			<td><spring:message code="label.order.lineItem" /></td>
			<td>${rof.line.lineItem }</td>
			<td><spring:message code="label.order.lineComment" /></td>
			<td>${rof.line.comment }</td>
		</tr>
	</table>

</body>
</html>