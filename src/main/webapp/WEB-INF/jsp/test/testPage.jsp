<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.js"></script>

</head>
<body>
	<form:form method="post" commandName="orderControl">
		<form:select path="orderPrefix">
			<c:forEach items="${orderControl.orderStatusOptions}" var="orders">
				<option value="${orders.orderStatus}">${orders.orderStatus}</option>
			</c:forEach>
		</form:select>
	</form:form>

	<c:forEach items="${orderControl.orderStatusOptions}" var="orders">
		status: <c:out value="${orders.orderStatus}" />
	</c:forEach>
</body>
</html>