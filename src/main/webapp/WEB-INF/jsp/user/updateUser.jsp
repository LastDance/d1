<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="currentPage" content="userManagement"/>
<meta name="currentCategory" content="user"/>

    <title>用户管理 | DMS</title>
</head>
<body>
 
<script>
    $(function() {          
    });
</script>
 
 
<h2>用户修改</h2>
 
<c:if test="${not empty message}">
    <div class="alert alert-success fade in">
        <a class="close" data-dismiss="alert" href="#">&times;</a> <span>
            ${message} </span> <br />
    </div>
</c:if> 
 
<form:form method="post" action="updateUserAct" commandName="user">
<input type="hidden" name="id" value=${user.id }>
<input type="hidden" name="username" value=${user.username }>
    <fieldset>
        <legend>${user.username} </legend>
    <table>
        <tr>
            <td><form:label path="password"><spring:message code="label.password"/></form:label></td>
            <td><form:input path="password" /></td>
        </tr>
        <tr>
            <td><form:label path="email"><spring:message code="label.email"/></form:label></td>
            <td><form:input path="email" /></td>
        </tr>
        <tr>
            <td><form:label path="telephone"><spring:message code="label.telephone"/></form:label></td>
            <td><form:input path="telephone" /></td>
        </tr>
            <tr>
            <td><form:label path="qqNbr"><spring:message code="label.qqNbr"/></form:label></td>
            <td><form:input path="qqNbr" /></td>
        </tr>
        <tr>
            <td>
                <input type="submit" class="btn btn-primary" value="提交"/>
            </td>
            <td>
                <a href="<c:url value='/viewUser/${user.id}'/>" class="btn">取消</a>
            </td>
        </tr>
    </table>  
    </fieldset>
</form:form>
</body>
</html>