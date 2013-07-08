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
    		
    		$("a.detailView").click(function() {
    			$(".modal-body").html("	<fieldset> " 
    					+ "<legend> " + $(this).text() + "</legend>"
    					+ "<table class='table table-striped table-condensed'>"			
    					+ "<tr> <td>电话</td> <td>" + $(this).parent().parent().children('td:nth-child(2)').text() + "</td></tr>"   				
    					+ "<tr> <td>电子邮件</td> <td>" + $(this).parent().parent().children('td:nth-child(3)').text() + "</td></tr>"
    					+ "<tr> <td>QQ号码</td> <td>" + $(this).parent().parent().children('td:nth-child(4)').text() + "</td></tr>"	
    					+ "</table> </fieldset>");
    		});
    		
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
				<td><a href="#myModal" data-toggle="modal" class="detailView">${user.username }</a></td>
				<td>${user.telephone }</td>
				<td>${user.email }</td>
				<td>${user.qqNbr }</td>
			</tr>
		</c:forEach>
    </table>
    
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
</body>
</html>