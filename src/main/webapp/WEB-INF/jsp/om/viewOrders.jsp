<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="currentPage" content="viewOrders" />
<meta name="currentCategory" content="OM" />

<title>订单浏览 | DMS</title>
</head>
<body>
	<h2>订单总览</h2>
	<table class="table table-striped table-condensed">
		<tr>
			<th><spring:message code="label.order.showDetail" /></th>
			<th><spring:message code="label.order.number" /></th>
			<th><spring:message code="label.order.customer" /></th>
			<th><spring:message code="label.order.enteredDate" /></th>
			<th><spring:message code="label.order.requiredDate" /></th>
			<th><spring:message code="label.order.totalAmount" /></th>
			<th><spring:message code="label.order.status" /></th>
		</tr>
		<c:forEach items="${orderPage.items}" var="order">
			<tr>
				<td><a class="accordion-toggle" data-toggle="collapse"
					data-parent="#line${order.id}" href="#line${order.id}"> <spring:message
							code="label.order.showDetail" />
				</a></td>
				<td><a href="<c:url value='/order/viewOrder/${order.id}'/>">
						${order.prefix}${order.id} </a></td>
				<td>${order.customer}</td>
				<td><fmt:formatDate value="${order.enteredDate}" type="date"
						pattern="yyyy-MM-dd" /></td>
				<td><fmt:formatDate value="${order.requiredDate}" type="date"
						pattern="yyyy-MM-dd" /></td>
				<td>${order.totalAmount}</td>
				<td>${order.status}</td>
			</tr>
			<tr>
				<td></td>

				<td colspan="6">
					<div id="line${order.id}" class="collapse">
						<table class="table table-striped table-condensed">
							<tr>
								<th><spring:message code="label.order.line" /></th>
								<th><spring:message code="label.order.lineItem" /></th>
								<th><spring:message code="label.order.lineQuantity" /></th>
								<th><spring:message code="label.order.lineTotalAmount" /></th>
							</tr>
							<c:forEach items="${order.orderLines}" var="orderLine">
								<tr>
									<td>${orderLine.line}</td>
									<td>${orderLine.lineItem}</td>
									<td>${orderLine.lineQuantity}</td>
									<td>${orderLine.totalAmount}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>

	<c:if test="${!empty orderPage}">
		<div class="pagination pagination-centered pagination-large">
			<ul>
				<c:if test="${orderPage.firstPage ne '0'}">
					<li><a
						href="<c:url value='/order/viewOrders/${orderPage.firstPage }'/>">&laquo;</a></li>
				</c:if>
				<c:if test="${orderPage.previousPage ne '0'}">
					<li><a
						href="<c:url value='/order/viewOrders/${orderPage.previousPage }'/>">&lsaquo;</a></li>
				</c:if>
				<c:if test="${orderPage.page1 ne '0'}">
					<li
						class="<c:if test="${orderPage.page1 eq orderPage.currentPage}">active</c:if>">
						<a href="<c:url value='/order/viewOrders/${orderPage.page1 }'/>">${orderPage.page1
							}</a>
					</li>
				</c:if>
				<c:if test="${orderPage.page2 ne '0'}">
					<li
						class="<c:if test="${orderPage.page2 eq orderPage.currentPage}">active</c:if>">
						<a href="<c:url value='/order/viewOrders/${orderPage.page2 }'/>">${orderPage.page2
							}</a>
					</li>
				</c:if>
				<c:if test="${orderPage.page3 ne '0'}">
					<li
						class="<c:if test="${orderPage.page3 eq orderPage.currentPage}">active</c:if>">
						<a href="<c:url value='/order/viewOrders/${orderPage.page3 }'/>">${orderPage.page3
							}</a>
					</li>
				</c:if>
				<c:if test="${orderPage.page4 ne '0'}">
					<li
						class="<c:if test="${orderPage.page4 eq orderPage.currentPage}">active</c:if>">
						<a href="<c:url value='/order/viewOrders/${orderPage.page4 }'/>">${orderPage.page4
							}</a>
					</li>
				</c:if>
				<c:if test="${orderPage.page5 ne '0'}">
					<li
						class="<c:if test="${orderPage.page5 eq orderPage.currentPage}">active</c:if>">
						<a href="<c:url value='/order/viewOrders/${orderPage.page5 }'/>">${orderPage.page5
							}</a>
					</li>
				</c:if>
				<c:if test="${orderPage.nextPage ne '0'}">
					<li><a href="<c:url value='/order/viewOrders/${orderPage.nextPage }'/>">&rsaquo;</a></li>
				</c:if>
				<c:if test="${orderPage.lastPage ne '0'}">
					<li><a
						href="<c:url value='/order/viewOrders/${orderPage.lastPage }'/>">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</c:if>
</body>
</html>