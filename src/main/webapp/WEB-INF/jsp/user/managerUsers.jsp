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
 			
        	$(".operateView").hide();
        	$(".tableView").show();
        	
    		$("a.btn").click(function() {
    			$("#myModalLabel").text($(this).text());
    			$(".modal-body").html("	<fieldset> " 
    					+ "<legend> " + $(this).parent().parent().children('td:nth-child(1)').text() + "</legend>"
    					+ "<table class='table table-striped table-condensed'>"			
    					+ "<tr> <td>电话</td> <td>" + $(this).parent().parent().children('td:nth-child(2)').text() + "</td></tr>"   				
    					+ "<tr> <td>电子邮件</td> <td>" + $(this).parent().parent().children('td:nth-child(3)').text() + "</td></tr>"
    					+ "<tr> <td>QQ号码</td> <td>" + $(this).parent().parent().children('td:nth-child(4)').text() + "</td></tr>"	
    					+ "</table> </fieldset>");
    		});
    		
    		$(".addUser").click(function() {
    			$(".addView").show();
            	$(".tableView").hide();
    		//	$(".operateView").slideUp();
    		//	$(".tableView").slideDown();  			
    		});
    		
    		$("a.update").click(function() {
    			$(".updateView").show();
    			$(".tableView").hide();
    			var name = $(this).parent().parent().children('td:nth-child(1)').text();
    		});
    		
    		$(".cancle").click(function() {
    			$(".operateView").hide();
            	$(".tableView").show();
            	$("table input").val();
    		});
        });
    </script>

    <h2>用户管理</h2>
    <br/>
    <c:if test="${not empty message}">
        <div class="alert alert-success fade in">
            <a class="close" data-dismiss="alert" href="#">&times;</a> <span>
                ${message} </span> <br />
        </div>
    </c:if>
    <div class="tableView">
        <input type="button" class="btn btn-primary addUser" value="添加用户">   
        <table class='table table-striped table-condensed'>
            <tr>
                <th>用户名称</th>
                <th>电话</th>
                <th>电子邮件</th>
                <th>QQ</th>
                <th>操作</th>
            </tr>
            <c:forEach var="user" items="${users}">
        	    <tr>
        			<td>${user.username }</td>
        			<td>${user.telephone }</td>
        			<td>${user.email }</td>
        			<td>${user.qqNbr }</td>
                    <td>
                        <a href="#" class="update">修改</a>
                        &nbsp;&nbsp;
                        <a href="#" class="delete">删除</a>
                    </td>
        		</tr>
        	</c:forEach>
        </table>
    </div>
    
    <!-- Modal -->
    <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">用户信息</h3>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">关闭</button>
      </div>
    </div>  
    
    <!-- add User form-->
    <div class="operateView addView">
        <form:form method="post" action="create" commandName="user">
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
                    <td><form:label path="qqNbr"><spring:message code="label.qqNbr"/></form:label></td>
                    <td><form:input path="qqNbr" /></td>
                </tr>
                <tr>
                    <td><input class="btn btn-primary " type="submit" value="添加"/></td>
                    <td><input class="btn btn-primary cancle" type="button" value="取消"/></td>
                </tr>
            </table>  
        </form:form>
   </div>
   
   <!-- update User form -->
    <div class="operateView updateView">
    <form:form method="post" action="update" commandName="user">
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
                <td><form:label path="qqNbr"><spring:message code="label.qqNbr"/></form:label></td>
                <td><form:input path="qqNbr" /></td>
            </tr>
            <tr>
                <td><input class="btn btn-primary " type="submit" value="修改"/></td>
                <td><input class="btn btn-primary cancle" type="button" value="取消"/></td>
            </tr>
        </table>  
    </form:form>
   </div>
   
   
</body>
</html>