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
     		共${orderPage.totalCount}记录 
     		<c:choose>
				<c:when test="${orderPage.startIndex ne '0'}">
					<a href="<c:url value='/order/viewOrders/0'/>">首页</a>
				</c:when>
				<c:otherwise>
       首页
      			</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${orderPage.previousIndex lt orderPage.startIndex}">
					<a href="<c:url value='/order/viewOrders/${orderPage.previousIndex }'/>">上一页</a>
				</c:when>
				<c:otherwise>
		       		上一页
		    	</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${orderPage.nextIndex>orderPage.startIndex}">
					<a href="<c:url value='/order/viewOrders/${orderPage.nextIndex}'/>">下一页</a>
				</c:when>
				<c:otherwise>
       				下一页
      			</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${orderPage.lastIndex eq orderPage.startIndex}">
       				最后一页
      			</c:when>
				<c:otherwise>
					<a href="<c:url value='/order/viewOrders/${orderPage.lastIndex}'/>">最后一页</a>
				</c:otherwise>
			</c:choose>
			 	每页显示${orderPage.pageSize}条记录 
			 	当前第${orderPage.currentPage }/${orderPage.pageCount}页
  		</c:if>
<!-- 	<table class="table table-striped table-condensed"> -->
<!-- 		<tr> -->
<%-- 			<th><spring:message code="label.order.showDetail" /></th> --%>
<%-- 			<th><spring:message code="label.order.number" /></th> --%>
<%-- 			<th><spring:message code="label.order.customer" /></th> --%>
<%-- 			<th><spring:message code="label.order.enteredDate" /></th> --%>
<%-- 			<th><spring:message code="label.order.requiredDate" /></th> --%>
<%-- 			<th><spring:message code="label.order.totalAmount" /></th> --%>
<%-- 			<th><spring:message code="label.order.status" /></th> --%>
<!-- 		</tr> -->
<%-- 		<c:forEach items="${obf.orders}" var="order"> --%>
<!-- 			<tr> -->
<!-- 				<td><a class="accordion-toggle" data-toggle="collapse" -->
<%-- 					data-parent="#line${order.id}" href="#line${order.id}"> <spring:message --%>
<%-- 							code="label.order.showDetail" /> --%>
<!-- 				</a></td> -->
<%-- 				<td><a href="<c:url value='/order/viewOrder/${order.id}'/>"> --%>
<%-- 						${order.prefix}${order.id} </a></td> --%>
<%-- 				<td>${order.customer}</td> --%>
<%-- 				<td><fmt:formatDate value="${order.enteredDate}" type="date" --%>
<%-- 						pattern="yyyy-MM-dd" /></td> --%>
<%-- 				<td><fmt:formatDate value="${order.requiredDate}" type="date" --%>
<%-- 						pattern="yyyy-MM-dd" /></td> --%>
<%-- 				<td>${order.totalAmount}</td> --%>
<%-- 				<td>${order.status}</td> --%>
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td></td> -->
				
<!-- 				<td colspan="6"> -->
<%-- 					<div id="line${order.id}" class="collapse"> --%>
<!-- 						<table class="table table-striped table-condensed"> -->
<!-- 							<tr> -->
<%-- 								<th><spring:message code="label.order.line" /></th> --%>
<%-- 								<th><spring:message code="label.order.lineItem" /></th> --%>
<%-- 								<th><spring:message code="label.order.lineQuantity" /></th> --%>
<%-- 								<th><spring:message code="label.order.lineTotalAmount" /></th> --%>
<!-- 							</tr> -->
<%-- 							<c:forEach items="${order.orderLines}" var="orderLine"> --%>
<!-- 								<tr> -->
<%-- 									<td>${orderLine.line}</td> --%>
<%-- 									<td>${orderLine.lineItem}</td> --%>
<%-- 									<td>${orderLine.lineQuantity}</td> --%>
<%-- 									<td>${orderLine.totalAmount}</td> --%>
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
<!-- 						</table> -->
<!-- 					</div> -->
<!-- 				</td> -->
<!-- 			</tr> -->

<%-- 		</c:forEach> --%>
<!-- 	</table> -->
</body>
</html>