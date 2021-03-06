<%@ page language="java" import="java.util.*,java.sql.*"
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

<title>学生主页面</title>

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
.side-nav>li {
	margin-bottom: 40px;
	margin-right: 40px;
}

.container {
	display: flex;
	margin-top: 73px;
	margin-left: 38px;
}

.navbar {
	margin-bottom: 25px;
}

.navbar-brand {
	letter-spacing: 5px;
}

.span {
	font-size: large;
}

.content {
	margin-left: 10px;
}

.my-btn:hover {
	background-color: #337ab7;
	color: white;
}

.my-form {
	margin-top: 88px;
}

.message {
	color: #337ab7;
}
</style>
</head>
<body>
	<%
		Login user = (Login) session.getAttribute("login");

		//连接MySQL数据库 
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String url = "jdbc:mysql://localhost:3306/worksubmit?useSSL=false";
		String usr = "root";
		String password = "123456";
		Connection conn = DriverManager.getConnection(url, usr, password);
		Statement st = conn.createStatement();
	%>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="teacherImport.jsp">数学类课程作业提交系统</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="teacherImport.jsp"><span class="glyphicon glyphicon-log-user"></span><%=user.getUname()%></a></li>
			<li><a href="login.jsp"><span class="glyphicon glyphicon-log-out"></span>退出</a></li>
		</ul>
	</div>
	</nav>
	<div class="content">
		<ul class="nav nav-pills side-nav">
			<li><a href="teacher.jsp">学生作业完成情况</a></li>
			<li><a href="teacherHomework.jsp">布置作业</a></li>
			<li class="active"><a href="teacherImport.jsp">导入班级学生信息</a></li>
			<li><a href="teacherAddSub.jsp">增加学科</a></li>
		</ul>
		<div class="my-form">
			<form class="form-horizontal" role="form"
				action="InputWorkInfoServlet" method="post">
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">学号</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="firstname"
							placeholder="请输入学号" name="student_id">
					</div>
				</div>
				<div class="form-group">
					<label for="lastname" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="lastname"
							placeholder="请输入姓名" name="username">
					</div>
				</div>
				<div class="form-group">
					<label for="lastname" class="col-sm-2 control-label">选择班级</label>
					<div class="col-sm-4">
						<select class="form-control" name="student_class">
							<%
								//把表格第二行的显示放到while循环中，就可以根据查询结果画出表格了。参数则放在<td>内的相应位置。
								ResultSet rs = st.executeQuery("SELECT * FROM class");
								while (rs.next()) {
							%>
							<option><%=rs.getString("class_name")%></option>
							<%
								}
							%>
							<%
								rs.close();
							%>
						</select>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-4">
						<button type="submit" class="btn btn-default my-btn">添加该学生信息</button>
					</div>
				</div>
				<h5 class="col-sm-offset-2 col-sm-4 message">默认登陆密码为：123456</h5>
				<h4 class="col-sm-offset-2 col-sm-4 message">${message}</h4>
				
			</form>
		</div>
	</div>
</body>
</html>
