<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="currentPage" content="managerUsers" />
<meta name="currentCategory" content="user" />
<title>用户管理 | DMS</title>
</head>
<body>
    <script>
        $(function() {
        });
    </script>

    <h2>用户浏览</h2>
    <br/>
    <c:if test="${not empty message}">
        <div class="alert alert-success fade in">
            <a class="close" data-dismiss="alert" href="#">&times;</a> <span>
                ${message} </span> <br />
        </div>
    </c:if>
    
    <fieldset> 
        <legend>${user.username} </legend>
        <table class='table table-striped table-condensed'>        
            <tr> 
                <td>电话</td> 
                <td>${user.telephone} </td>
            </tr>              
            <tr> 
                <td>电子邮件</td> 
                <td>${user.email} </td>
            </tr>
            <tr> 
                <td>QQ号码</td> 
                <td>${user.qqNbr} </td>
            </tr>   
        </table>
    </fieldset>
     
    <a class="btn btn-primary" href="<c:url value='/updateUser/${user.id}'/>">修改</a>
    <a class="btn btn-primary" href="<c:url value='/viewUsers'/>">返回</a>
   
</body>
</html>