<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<head>
<title></title>
<decorator:usePage id="thePage" />
<%
	String pageName = thePage.getProperty("meta.currentPage");
%>
<%
	String pageCategory = thePage.getProperty("meta.currentCategory");
%>
<!-- Bootstrap -->
<link href="<c:url value='/css/bootstrap.css'/>" rel="stylesheet" />
<link href="<c:url value='/css/datepicker.css'/>" rel="stylesheet" />
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
</head>
<body>
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="<c:url value='/js/bootstrap.js'/>"></script>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<button type="button" class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="brand" style="color: #FFF"
					href="<c:url value='/welcome'/>">DMS</a>
				<div class="nav-collapse collapse">
					<p class="navbar-text pull-right">
						<a href="" class="navbar-link"><%=session.getAttribute("user")%></a>
						<a href="<c:url value='/logoff'/>" class="navbar-link">登出</a>
					</p>
					<%-- 				<ul class="nav">
						<li <%if (pageCategory.equals("welcome")) {%> class="active" <%}%>><a
							href="<c:url value='/welcome'/>">首页</a></li>
						<li <%if (pageCategory.equals("user")) {%> class="active" <%}%>><a
							href="<c:url value='/user'/>">用户</a></li>
					</ul>
 --%>
					<ul class="nav">
						<li
							class="dropdown <%if (pageCategory.equals("user")) {%>active<%}%>"><a
							href="#" class="dropdown-toggle" data-toggle="dropdown"
							data-hover="dropdown" data-delay="1000" data-close-others="false">
								用户管理<b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1" href="<c:url value='/createUser'/>">新增</a></li>
								<li><a tabindex="-1" href="<c:url value='/viewUsers'/>">浏览</a></li>
							</ul></li>
						<li
							class="dropdown <%if (pageCategory.equals("OM")) {%>active<%}%>"><a
							href="#" class="dropdown-toggle" data-toggle="dropdown"
							data-hover="dropdown" data-delay="1000" data-close-others="false">
								订单管理<b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1"
									href="<c:url value='/order/create'/>">录入</a></li>
								<li><a tabindex="-1" href="<c:url value='/order/list/1'/>">总览</a></li>
								<li><a tabindex="-1" href="#">审核</a></li>
							</ul></li>
					</ul>


				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span2">
				<div class="well sidebar-nav">
					<ul class="nav nav-list">
						<li class="nav-header">快捷访问</li>
						<li <%if (pageName.equals("welcome")) {%> class="active" <%}%>><a
							href="<c:url value='/welcome'/>">首页</a></li>
						<li <%if (pageName.equals("userManagement")) {%> class="active"
							<%}%>><a href="<c:url value='/user'/>">用户管理</a></li>
						<li <%if (pageName.equals("createOrder")) {%> class="active" <%}%>><a
							href="<c:url value='/order/create'/>">订单录入</a></li>
							<li <%if (pageName.equals("viewOrders")) {%> class="active" <%}%>><a
							href="<c:url value='/order/list/1'/>">订单总览</a></li>
						<li <%if (pageName.equals("underwork")) {%> class="active" <%}%>><a
							href="<c:url value='/underwork'/>">研发中...</a></li>
					</ul>
				</div>
				<!--/.well -->
			</div>
			<!--/span-->
			<div class="span9">
				<decorator:body />
			</div>
			<!--/span-->
		</div>
		<!--/row-->

		<hr />

		<div style="text-align: center">
			<p>© DSystem 2013</p>
		</div>
	</div>
	<!--/.fluid-container-->

</body>
</html>