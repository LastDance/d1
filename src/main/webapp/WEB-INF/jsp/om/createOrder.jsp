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
		function addLine(rowID) {
			var itemCnt = $('#orderLinetable tr').length - 1 ;

			var newItem = '<tr id="order_line_' + itemCnt + '"">'
					+ '<td><input type="button" name="remove_line' + itemCnt
					+ '" value="rem' + itemCnt + '" /></td>'
					+ '<td><input type="text" name="orderLines['+ itemCnt + '].item' + '/>'
					+ '"</td>' + '<td><input type="text" name="orderLines['+ itemCnt + '].lineQuantity' + '/>'
					+ '"</td>'
					+ '<td><input type="text" name="orderLines['+ itemCnt + '].itemPrice' + '/>'
					+ '"</td>' + '<td><input type="text" name="orderLines['+ itemCnt + '].status'
					 + '"</td>' + '</tr>';
			if (itemCnt == 1) {
				$('#orderLinetableHeader').after(newItem);
			} else {
				$('#order_line_' + (itemCnt - 2)).after(newItem);
			}
		}
		function removeLine() {

		}
	</script>
	<h2>订单录入</h2>

	<form:form method="post" action="createOrder" commandName="order">

		<table class="table">
			<tr>
				<td><form:label path="customer">
						<spring:message code="label.order.customer" />
					</form:label></td>
				<td><form:input path="customer" /></td>
				<td><form:label path="custmerOrderNumber">
						<spring:message code="label.order.custmerOrderNumber" />
					</form:label></td>
				<td><form:input path="custmerOrderNumber" /></td>
			</tr>

			<tr>
				<td><form:label path="requiredDate">
						<spring:message code="label.order.requiredDate" />
					</form:label></td>
				<td><form:input path="requiredDate" class="datepicker" /></td>
				<td><form:label path="status">
						<spring:message code="label.order.status" />
					</form:label></td>
				<td><form:input path="status" /></td>
			</tr>
			<tr>
				<td><form:label path="enteredDate">
						<spring:message code="label.order.enteredDate" />
					</form:label></td>
				<td><form:input path="enteredDate" class="datepicker" /></td>
				<td><form:label path="enteredBy">
						<spring:message code="label.order.enteredBy" />
					</form:label></td>
				<td><form:input path="enteredBy" /></td>
			</tr>
			<tr>
				<td><form:label path="comment">
						<spring:message code="label.order.comment" />
					</form:label></td>
				<td colspan="3"><form:textarea path="comment" rows="3"
						style="width:50%" /></td>
			</tr>
		</table>

		<fieldset>
			<legend>
				<spring:message code="label.order.orderLine" />
			</legend>
			<input type="button" id="addOrderLine" onclick="addLine()"
				class="btn btn-info btn-mini"
				value="<spring:message code="label.order.addLine" />" />

			<table id='orderLinetable'
				class="table table-striped table-condensed">
				<tr id='orderLinetableHeader'>
					<th>action</th>
					<th><spring:message code="label.order.line_item" /></th>
					<th><spring:message code="label.order.line_quantity" /></th>
					<th><spring:message code="label.order.line_price" /></th>
					<th><spring:message code="label.order.line_status" /></th>
				</tr>
	<%-- 	 		<tr id="item_1">
					<td></td>
					<td><form:input path="orderLines[0].item"
							name="line_item1" /></td>
					<td><form:input path="orderLines[0].lineQuantity"
							name="line_item1" /></td>
					<td><form:input path="orderLines[0].itemPrice"
							name="line_item1" /></td>
					<td><form:input path="orderLines[0].status"
							name="line_item1" /></td>
				</tr>  --%>
 				<c:forEach items="${order.orderLines}" var="orderLine" varStatus="vs" >
					<tr id="order_line_${vs.index}"  >
						<td></td>
						<td><form:input path="orderLines[${vs.index}].item"
								name="line_item_${vs.index}" /></td>
						<td><form:input path="orderLines[${vs.index}].lineQuantity"
								name="line_item_${vs.index}" /></td>
						<td><form:input path="orderLines[${vs.index}].itemPrice"
								name="line_item_${vs.index}" /></td>
						<td><form:input path="orderLines[${vs.index}].status"
								name="line_item_${vs.index}" /></td>
					</tr>
				</c:forEach> 
			</table>
		</fieldset>
		<input type="submit" class="btn btn-primary"
			value="<spring:message code="label.order.create"/>" />
	</form:form>
</body>
</html>