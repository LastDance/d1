<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="currentPage" content="viewOrder" />
<meta name="currentCategory" content="OM" />

<title>订单浏览 | DMS</title>
</head>
<body>
	<h2>订单浏览</h2>
	<c:if test="${not empty message}">
		<div class="alert alert-success fade in">
			<a class="close" data-dismiss="alert" href="#">&times;</a> <span>
				${message} </span> <br />
		</div>
	</c:if>

	<table class="table">
		<tr>
			<td style="text-align:right"><strong><spring:message code="label.order.number" /></strong></td>
			<td>${order.prefix }${order.id }</td>
			<td style="text-align:right"><strong><spring:message code="label.order.status" /></strong></td>
			<td>${order.status }</td>
		</tr>
		<tr>
			<td style="text-align:right"><strong><spring:message code="label.order.customer" /></strong></td>
			<td>${order.customer }</td>
			<td style="text-align:right"><strong><spring:message code="label.order.custmerOrderNumber" /></strong></td>
			<td>${order.custmerOrderNumber }</td>
		</tr>
		<tr>
			<td style="text-align:right"><strong><spring:message code="label.order.enteredBy" /></strong></td>
			<td>${order.enteredBy }</td>
			<td style="text-align:right"><strong><spring:message code="label.order.enteredDate" /></strong></td>
			<td>${order.enteredDate }</td>
		</tr>
		<tr>
			<td><strong style="text-align:right"><spring:message code="label.order.comment" /></strong></td>
			<td colspan="3">${order.comment }</td>
		</tr>
	</table>
	<fieldset>
		<legend>
			<spring:message code="label.order.orderLine" />
		</legend>
		<table class='table table-striped table-condensed'>
			<tr>
				<th><spring:message code="label.order.line" /></th>
				<th><spring:message code="label.order.lineItem" /></th>
				<th><spring:message code="label.order.linePrice" /></th>
				<th><spring:message code="label.order.lineQuantity" /></th>
				<th><spring:message code="label.order.lineStatus" /></th>
				<th><spring:message code="label.order.lineComment" /></th>
			</tr>
			<c:forEach var="line" items="${order.orderLines}">
				<tr>
					<td>${line.line }</td>
					<td>${line.lineItem }</td>
					<td>${line.itemPrice }</td>
					<td>${line.lineQuantity }</td>
					<td>${line.status }</td>
					<td>${line.comment }</td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>

</body>
</html>