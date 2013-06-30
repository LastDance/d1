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

<title>订单录入| DMS</title>
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
	<script type="text/javascript">
		function addOrderLine() {
			alert("Hello World!");
		}
	</script>
	<h2>订单录入</h2>

	<form:form method="post" action="createOrder" commandName="order">

		<table>
			<tr>
				<td><form:label path="custmerOrderNumber">
						<spring:message code="label.order.custmerOrderNumber" />
					</form:label></td>
				<td><form:input path="custmerOrderNumber" /></td>
			</tr>
			<tr>
				<td><form:label path="customer">
						<spring:message code="label.order.customer" />
					</form:label></td>
				<td><form:input path="customer" /></td>
			</tr>
			<tr>
				<td><form:label path="requiredDate">
						<spring:message code="label.order.requiredDate" />
					</form:label></td>
				<td><form:input path="requiredDate" class="datepicker" /></td>
			</tr>

			<tr>
				<td><form:label path="status">
						<spring:message code="label.order.status" />
					</form:label></td>
				<td><form:input path="status" /></td>
			</tr>
			<tr>
				<td><form:label path="comment">
						<spring:message code="label.order.comment" />
					</form:label></td>
				<td><form:input path="comment" /></td>
			</tr>
			<tr>
				<td><form:label path="enteredDate" class="datepicker">
						<spring:message code="label.order.enteredDate" />
					</form:label></td>
				<td><form:input path="enteredDate" /></td>
			</tr>
			<tr>
				<td><form:label path="enteredBy">
						<spring:message code="label.order.enteredBy" />
					</form:label></td>
				<td><form:input path="enteredBy" /></td>
			</tr>
			<tr>
				<td><input type="button" id="addOrderLine"
					onclick="addOrderLine()"
					value="<spring:message code="label.order.addLine" />" /></td>
			</tr>
			<tr>
				<td>
					<div id="orderLine">
						<input type="text" id="item" />
						<!--  <input type="text" id="price" /> <input
							type="text" id="quantuty" /> -->
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"
					value="<spring:message code="label.order.create"/>" /></td>
			</tr>
		</table>
	</form:form>
</body>
</html>