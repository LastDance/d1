<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="currentPage" content="userManagement"/>
<meta name="currentCategory" content="user"/>

    <title>Spring 3 MVC Series - System User Manager | DMS</title>
</head>
<body>
 
<h2>System User Manager</h2>
 
<form:form method="post" action="/user/create" commandName="sysUser">
 
    <table>
    <tr>
        <td><form:label path="username"><spring:message code="label.username"/></form:label></td>
        <td><form:input path="username" /></td> 
    </tr>
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
        <td colspan="2">
            <input type="submit" value="<spring:message code="label.addSysUser"/>"/>
        </td>
    </tr>
</table>  
</form:form>
 
     
<h3>Contacts</h3>
<c:if  test="${!empty sysUserList}">
<table class="data">
<tr>
    <th>username</th>
    <th>email</th>
    <th>telephone</th>
    <th>&nbsp;</th>
</tr>
<c:forEach items="${sysUserList}" var="sysUser">
    <tr>
        <td>${sysUser.username}</td>
        <td>${sysUser.email}</td>
        <td>${sysUser.telephone}</td>
        <td><a href="delete/${sysUser.id}">delete</a></td>
    </tr>
</c:forEach>
</table>
</c:if>
 
</body>
</html>