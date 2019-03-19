<%@ page language="java" import="java.util.*, java.sql.*"
	pageEncoding="utf-8"%>
<%@ page import="org.home.entity.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>管理员主页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="./res/css/bootstrap.min.css">
<script src="./res/jquery-3.2.1/jquery-3.2.1.min.js"></script>
<script src="./res/js/bootstrap.min.js"></script>

<style type="text/css">
.container {
	display: flex;
	margin-top: 73px;
	margin-left: 38px;
}

.navbar-brand {
	letter-spacing: 5px;
}

.span {
	font-size: large;
}

.side-nav>li {
	margin-bottom: 40px;
	margin-right: 40px;
}

.main {
	margin-left: 10px;
}

.my-form {
	display: flex;
}

.btn {
	background-color: #337ab7;
	color: white;
}

.table {
	margin: 20px;
	width: 96%;
	max-width: 100%;
	margin-bottom: 20px;
	background-color: #f8f8f8;
	margin: 0 auto;
	border-radius: 10px;
}
.form-wrap{
 margin-top: 70px;
}
</style>
</head>

<body>

	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="adminAddTea.jsp">数学类课程作业提交系统</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="adminAddTea.jsp"><span
					class="glyphicon glyphicon-log-user"></span>管理员</a></li>
			<li><a href="login.jsp"><span
					class="glyphicon glyphicon-log-out"></span>退出</a></li>
		</ul>
	</div>
	</nav>
	<div class="main">
		<ul id="myTab" class="nav nav-pills side-nav">
			<li><a href="admin.jsp" >学生</a></li>
			<li><a href="adminTea.jsp" >老师</a></li>
			<li><a href="adminAddStu.jsp">添加学生</a></li>
			<li class="active"><a href="adminAddTea.jsp">添加老师</a></li>
		</ul>
		<div>
			<div>
				<form class="form-horizontal form-wrap" role="form" action="addTeaServlet"
					method="post">
					<div class="form-group">
						<label for="firstname" class="col-sm-4 control-label">教师ID</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="firstname"
								placeholder="请输入教师ID" name="teacher_id">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-4 control-label">教师姓名</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="lastname"
								placeholder="请输入教师姓名" name="teacher_name">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-4 control-label">密码</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="lastname"
								placeholder="请输入密码" name="teacher_password">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-4">
							<button type="submit" class="btn btn-default my-btn">添加该教师信息</button>
						</div>
					</div>
					<h4 class="col-sm-offset-4 col-sm-4 message">${message}</h4>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
