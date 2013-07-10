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

<c:if test="${not empty message}">
    <div class="alert alert-success fade in">
        <a class="close" data-dismiss="alert" href="#">&times;</a> <span>
            ${message} </span> <br />
    </div>
</c:if> 

    <h2>用户浏览</h2>
    <table class='table table-striped table-condensed'>
        <tr>
            <th>用户名称</th>
            <th>电话</th>
            <th>电子邮件</th>
            <th>QQ</th>
        </tr>
        <c:forEach var="user" items="${userPage.items}">
		    <tr>
				<td><a href="<c:url value='/viewUser/${user.id}'/>" class="detailView">${user.username }</a></td>
				<td>${user.telephone }</td>
				<td>${user.email }</td>
				<td>${user.qqNbr }</td>
			</tr>
		</c:forEach>
    </table>
   
    <c:if test="${!empty userPage}">
        <div class="pagination pagination-centered pagination-large">
            <ul>
                <c:if test="${userPage.firstPage ne '0'}">
                    <li><a
                        href="<c:url value='/viewUsers/${userPage.firstPage }'/>">&laquo;</a></li>
                </c:if>
                <c:if test="${userPage.previousPage ne '0'}">
                    <li><a
                        href="<c:url value='/viewUsers/${userPage.previousPage }'/>">&lsaquo;</a></li>
                </c:if>
                <c:if test="${userPage.page1 ne '0'}">
                    <li
                        class="<c:if test="${userPage.page1 eq userPage.currentPage}">active</c:if>">
                        <a href="<c:url value='/viewUsers/${userPage.page1 }'/>">${userPage.page1
                            }</a>
                    </li>
                </c:if>
                <c:if test="${userPage.page2 ne '0'}">
                    <li
                        class="<c:if test="${userPage.page2 eq userPage.currentPage}">active</c:if>">
                        <a href="<c:url value='/viewUsers/${userPage.page2 }'/>">${userPage.page2
                            }</a>
                    </li>
                </c:if>
                <c:if test="${userPage.page3 ne '0'}">
                    <li
                        class="<c:if test="${userPage.page3 eq userPage.currentPage}">active</c:if>">
                        <a href="<c:url value='/viewUsers/${userPage.page3 }'/>">${userPage.page3
                            }</a>
                    </li>
                </c:if>
                <c:if test="${userPage.page4 ne '0'}">
                    <li
                        class="<c:if test="${userPage.page4 eq userPage.currentPage}">active</c:if>">
                        <a href="<c:url value='/viewUsers/${userPage.page4 }'/>">${userPage.page4
                            }</a>
                    </li>
                </c:if>
                <c:if test="${userPage.page5 ne '0'}">
                    <li
                        class="<c:if test="${userPage.page5 eq userPage.currentPage}">active</c:if>">
                        <a href="<c:url value='/viewUsers/${userPage.page5 }'/>">${userPage.page5
                            }</a>
                    </li>
                </c:if>
                <c:if test="${userPage.nextPage ne '0'}">
                    <li><a href="<c:url value='/viewUsers/${userPage.nextPage }'/>">&rsaquo;</a></li>
                </c:if>
                <c:if test="${userPage.lastPage ne '0'}">
                    <li><a
                        href="<c:url value='/viewUsers/${userPage.lastPage }'/>">&raquo;</a></li>
                </c:if>
            </ul>
        </div>
    </c:if>  
</body>
</html>