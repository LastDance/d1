<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="currentPage" content="viewUsers" />
<meta name="currentCategory" content="user" />
<title>用户浏览 | DMS</title>
</head>
<body>
    <script>
        $(function() {    		
    		
        });
    </script>

    <h2>用户浏览</h2>
    <table class='table table-striped table-condensed'>
        <tr>
            <th>用户名称</th>
            <th>电话</th>
            <th>电子邮件</th>
            <th>QQ</th>
        </tr>
        <c:forEach var="user" items="${users}">
		    <tr>
				<td><a href="<c:url value='/viewUser/${user.id}'/>" class="detailView">${user.username }</a></td>
				<td>${user.telephone }</td>
				<td>${user.email }</td>
				<td>${user.qqNbr }</td>
			</tr>
		</c:forEach>
    </table>
     
</body>
</html>