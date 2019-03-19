<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>作业提交系统</title>
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
body {
	background-color: #f8f8f8;
}

.title {
	margin-bottom: 50px;
	letter-spacing: 20px;
	position: absolute;
	width: 100%;
	/* margin: 0 auto; */
	top: 50px;
	text-align: center;
}

.container {
	margin-top: 300px;
	text-align: center;
}

.form-horizontal {
	width: 350px;
	margin: auto;
}

.bottom {
	margin-top: 50px;
}
.role{
	display: flex;
}
.radio1{
	margin-right: 30px;
}
.warning{
	color: red;
}
</style>

</head>

<body>
	<h1 class="title">欢迎进入作业提交系统</h1>
	<div class="container">
		<form class="form-horizontal" role="form" method="post"
			action="LoginServlet">

			<div class="form-group">
				<label for="firstname" class="col-sm-2 control-label"> <span
					class="glyphicon glyphicon-user"></span>
				</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="firstname"
						placeholder="用户名" name="username">
				</div>
			</div>
			<div class="form-group">
				<label for="lastname" class="col-sm-2 control-label"> <span
					class="glyphicon glyphicon-lock"></span>
				</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="lastname"
						placeholder="密码" name="password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10 role">
					<div class="radio radio1">
						<label> <input type="radio" name="optionsRadios"
							id="optionsRadios1" value="teacher" checked> 教师
						</label>
					</div>
					<div class="radio radio1">
						<label> <input type="radio" name="optionsRadios"
							id="optionsRadios2" value="student">学生
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="optionsRadios"
							id="optionsRadios2" value="admin">管理员
						</label>
					</div>
				</div>
			</div>
			<div class="form-group bottom">
				<div class="col-sm-offset-2 col-sm-10">
					<button class="btn btn-lg btn-primary  btn-block" type="submit">
						<span>登陆</span>
					</button>
				</div>
			</div>
			<div class="form-group bottom">
				<div class="col-sm-offset-2 col-sm-10">
					<span class="warning">${message}</span>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
