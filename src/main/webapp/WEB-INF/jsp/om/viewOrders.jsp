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
	<script src="<c:url value='/js/bootstrap-datepicker.js'/>"></script>
	<script src="<c:url value='/js/bootstrap-datepicker.zh-CN.js'/>"></script>

	<script type="text/javascript">
		$(function() {
			$('.datepicker').datepicker({
				format : 'yyyy-mm-dd',
				language : 'zh-CN',
				autoclose : true,
				todayBtn : true
			});
		});
	</script>

	<h2>订单总览</h2>
	<!-- Order Selection Criteria -->
	<fieldset>
		<legend></legend>
		<button class="btn-info btn-small" data-toggle="collapse" href="#order-criteria"
			 type="button">
			<spring:message code="label.criteria" />
		</button>
		<div id="order-criteria" class="collapse">
			<div class="input-prepend">
				<span class="add-on"><spring:message
						code="label.order.number" /></span> <input id="prependedInput"
					type="text">
			</div>
			<div class="input-prepend">
				<span class="add-on"><spring:message
						code="label.order.customer" /></span> <input id="prependedInput"
					type="text">
			</div>
			<div class="input-prepend">
				<span class="add-on"><spring:message
						code="label.order.custmerOrderNumber" /></span> <input
					id="prependedInput" type="text">
			</div>
			<div class="input-prepend">
				<span class="add-on"><spring:message
						code="label.order.status" /></span> <input id="prependedInput"
					type="text">
			</div>
			<div class="input-prepend input-append">
				<span class="add-on"><spring:message
						code="label.order.enteredDate" /></span> <input
					class="input-medium datepicker" id="appendedPrependedInput"
					type="text"> <span class="add-on  input-medium date-picker">
					- </span> <input class="input-medium datepicker"
					id="appendedPrependedInput" type="text">
			</div>
			<div class="input-prepend input-append">
				<span class="add-on"><spring:message
						code="label.order.requiredDate" /></span> <input
					class="input-medium datepicker" id="appendedPrependedInput"
					type="text"> <span class="add-on"> - </span> <input
					class="input-medium datepicker" id="appendedPrependedInput"
					type="text">
			</div>
			<div class="input-prepend input-append">
				<span class="add-on"><spring:message
						code="label.order.totalAmount" /></span> <input
					id="appendedPrependedInput" type="number"> <span
					class="add-on"> - </span> <input id="appendedPrependedInput"
					type="number">
			</div>
		</div>

	</fieldset>
	<!-- End Order Selection Criteria -->
	<!-- Order List -->
	<fieldset>
		<table class="table table-striped table-condensed">
			<tr>
				<th><spring:message code="label.order.showDetail" /></th>
				<th><spring:message code="label.order.number" /></th>
				<th><spring:message code="label.order.customer" /></th>
				<th><spring:message code="label.order.custmerOrderNumber" /></th>
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
					<td>${order.custmerOrderNumber}</td>
					<td><fmt:formatDate value="${order.enteredDate}" type="date"
							pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${order.requiredDate}" type="date"
							pattern="yyyy-MM-dd" /></td>
					<td>${order.totalAmount}</td>
					<td>${order.status}</td>
				</tr>
				<tr>
					<!-- Order Line Detail -->
					<td></td>
					<td colspan="7">
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
					<!-- End Order Line Detail -->
				</tr>
			</c:forEach>
		</table>
	</fieldset>
	<!-- End Order List -->

	<!-- Pagination -->
	<c:if test="${!empty orderPage}">
		<div class="pagination pagination-centered pagination-large">
			<ul>
				<!-- Pagination first page -->
				<c:choose>
					<c:when test="${orderPage.firstPage ne '0'}">
						<li><a
							href="<c:url value='/order/list/${orderPage.firstPage }'/>">&laquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a>&laquo;</a></li>
					</c:otherwise>
				</c:choose>

				<!-- Pagination previous page -->
				<c:choose>
					<c:when test="${orderPage.previousPage ne '0'}">
						<li><a
							href="<c:url value='/order/list/${orderPage.previousPage }'/>">&lsaquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a>&lsaquo;</a></li>
					</c:otherwise>
				</c:choose>

				<!-- Pagination page 1 -->
				<c:if test="${orderPage.page1 ne '0'}">
					<li
						class="<c:if test="${orderPage.page1 eq orderPage.currentPage}">active</c:if>">
						<a href="<c:url value='/order/list/${orderPage.page1 }'/>">${orderPage.page1
							}</a>
					</li>
				</c:if>

				<!-- Pagination page 2 -->
				<c:if test="${orderPage.page2 ne '0'}">
					<li
						class="<c:if test="${orderPage.page2 eq orderPage.currentPage}">active</c:if>">
						<a href="<c:url value='/order/list/${orderPage.page2 }'/>">${orderPage.page2
							}</a>
					</li>
				</c:if>

				<!-- Pagination page 3 -->
				<c:if test="${orderPage.page3 ne '0'}">
					<li
						class="<c:if test="${orderPage.page3 eq orderPage.currentPage}">active</c:if>">
						<a href="<c:url value='/order/list/${orderPage.page3 }'/>">${orderPage.page3
							}</a>
					</li>
				</c:if>

				<!-- Pagination page 4 -->
				<c:if test="${orderPage.page4 ne '0'}">
					<li
						class="<c:if test="${orderPage.page4 eq orderPage.currentPage}">active</c:if>">
						<a href="<c:url value='/order/list/${orderPage.page4 }'/>">${orderPage.page4
							}</a>
					</li>
				</c:if>

				<!-- Pagination page 5 -->
				<c:if test="${orderPage.page5 ne '0'}">
					<li
						class="<c:if test="${orderPage.page5 eq orderPage.currentPage}">active</c:if>">
						<a href="<c:url value='/order/list/${orderPage.page5 }'/>">${orderPage.page5
							}</a>
					</li>
				</c:if>

				<!-- Pagination next page -->
				<c:choose>
					<c:when test="${orderPage.nextPage ne '0'}">
						<li><a
							href="<c:url value='/order/list/${orderPage.nextPage }'/>">&rsaquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a>&rsaquo;</a></li>
					</c:otherwise>
				</c:choose>

				<!-- Pagination last page -->
				<c:choose>
					<c:when test="${orderPage.lastPage ne '0'}">
						<li><a
							href="<c:url value='/order/list/${orderPage.lastPage }'/>">&raquo;</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="disabled"><a>&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</c:if>
	<!-- End Pagination -->
</body>
</html>