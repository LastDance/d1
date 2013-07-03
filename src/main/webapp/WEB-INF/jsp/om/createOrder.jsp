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
		function addLine() {
			var itemCnt = $('#orderLinetable tr').length - 1;

			var newItem = '<tr id="order_line_' + itemCnt + '"">'
					+ '<td><input type="button" onclick="removeLine('
					+ itemCnt
					+ ')" class="btn btn-danger btn-mini" name="remove_line'
					+ itemCnt
					+ '" value="删除此条" /></td>'
					+ '<td><input type="text" id="item'+ itemCnt + '" name="orderLines['+ itemCnt + '].item"' + '/></td>'
					+ '<td><input type="text" id="lineQuantity'+ itemCnt + '" name="orderLines['+ itemCnt + '].lineQuantity"' + '/></td>'
					+ '<td><input type="text" id="itemPrice'+ itemCnt +'" name="orderLines['+ itemCnt + '].itemPrice"' + '/></td>'
					+ '<td><input type="text" id="status'+ itemCnt +'" name="orderLines['+ itemCnt + '].status"' + '/></td>'
					+ '<td><input type="text" id="comment'+ itemCnt +'" name="orderLines['+ itemCnt + '].comment"' + '/></td>'
					+ '</tr>';
			$('#order_line_' + (itemCnt - 1)).after(newItem);
		}
		function removeLine(rowID) {
			$('#order_line_' + rowID).hide();
			$('#item' + rowID).val("####order_line_deleted###");
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


			<table id='orderLinetable'
				class="table table-striped table-condensed">
				<tr id='orderLinetableHeader'>
					<th><input type="button" id="addOrderLine" onclick="addLine()"
						class="btn btn-info btn-mini"
						value="<spring:message code="label.order.addLine" />" /></th>
					<th><spring:message code="label.order.line_item" /></th>
					<th><spring:message code="label.order.line_quantity" /></th>
					<th><spring:message code="label.order.line_price" /></th>
					<th><spring:message code="label.order.line_status" /></th>
					<th><spring:message code="label.order.line_comment" /></th>
				</tr>
				<c:forEach items="${order.orderLines}" var="orderLine"
					varStatus="vs">
					<tr id="order_line_${vs.index}">
						<td></td>
						<td><form:input path="orderLines[${vs.index}].item"
								name="item${vs.index}" /></td>
						<td><form:input path="orderLines[${vs.index}].lineQuantity"
								name="lineQuantity${vs.index}" /></td>
						<td><form:input path="orderLines[${vs.index}].itemPrice"
								name="itemPrice${vs.index}" /></td>
						<td><form:input path="orderLines[${vs.index}].status"
								name="status${vs.index}" /></td>
						<td><form:input path="orderLines[${vs.index}].comment"
								name="comment${vs.index}" /></td>
					</tr>
				</c:forEach>
			</table>
		</fieldset>
		<input type="submit" class="btn btn-primary"
			value="<spring:message code="label.order.create"/>" />
	</form:form>
</body>
</html>