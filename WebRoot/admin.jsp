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

.form-wrap {
	margin-top: 70px;
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
			<a class="navbar-brand" href="admin.jsp">数学类课程作业提交系统</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="admin.jsp"><span
					class="glyphicon glyphicon-log-user"></span>管理员</a></li>
			<li><a href="login.jsp"><span
					class="glyphicon glyphicon-log-out"></span>退出</a></li>
		</ul>
	</div>
	</nav>
	<div class="main">
		<ul id="myTab" class="nav nav-pills side-nav">
			<li class="active"><a href="admin.jsp">学生</a></li>
			<li><a href="adminTea.jsp" >老师</a></li>
			<li><a href="adminAddStu.jsp" >添加学生</a></li>
			<li><a href="adminAddTea.jsp">添加老师</a></li>
		</ul>
		<div>
			<div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>学生ID</th>
							<th>学生姓名</th>
							<th>密码</th>
							<th>班級</th>
							<th>删除</th>
						</tr>
					</thead>

					<%
						//把表格第二行的显示放到while循环中，就可以根据查询结果画出表格了。参数则放在<td>内的相应位置。
						ResultSet rs = st.executeQuery("SELECT * FROM student");
						while (rs.next()) {
					%>
					<tbody>
						<tr>

							<td><%=rs.getString("student_id")%></td>
							<td><%=rs.getString("student_name")%></td>
							<td><%=rs.getString("student_password")%></td>
							<td><%=rs.getString("student_class")%></td>
							<td>
								<%
									String id = rs.getString("id");
								%>
								<form method="post" action="delStuServlet"
									class="form-inline my-form" role="form">
									<input name="id" type="hidden" value="<%=id%>">
									<button type="submit" class="btn btn-default my-btn">删除</button>
								</form>

							</td>
						</tr>
					</tbody>
					<%
						}
						//注意"}"的位置
					%>
				</table>
				<%
					rs.close();
				%>
			</div>
		</div>
</body>
</html>
