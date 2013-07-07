<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="currentPage" content="viewOrders" />
<meta name="currentCategory" content="OM" />

<title>订单浏览 | DMS</title>
</head>
<body>
	<h2>订单浏览</h2>
	<table class="table table-striped table-condensed">
		<tr>
			<th><spring:message code="label.order.number" /></th>
			<th><spring:message code="label.order.customer" /></th>
			<th><spring:message code="label.order.requiredDate" /></th>
			<th><spring:message code="label.order.totalAmount" /></th>
			<th><spring:message code="label.order.status" /></th>
		</tr>
		<c:forEach items="${obf.orders}" var="order">
			<tr>
				<td><a href="<c:url value='/order/viewOrder/${order.id}'/>">
						${order.prefix}${order.id} </a></td>
				<td>${order.customer}</td>
				<td><fmt:formatDate value="${order.requiredDate}" type="date" dateStyle="short"/></td>
				<td>${order.requiredDate}</td>
				<%-- 		<td>${order.totalAmount}</td> --%>
				<td>${order.status}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>