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
</style>
</head>

<body>
	<%
		Login users = (Login) session.getAttribute("login");
		
		//连接MySQL数据库 
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String url = "jdbc:mysql://localhost:3306/worksubmit?characterEncoding=utf8&useSSL=false";
		String user = "root";
		String password = "123456";
		Connection conn = DriverManager.getConnection(url, user, password);
		Statement st = conn.createStatement();
	%>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="teacher.jsp">数学类课程作业提交系统</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="teacher.jsp"><span
					class="glyphicon glyphicon-log-user"></span><%=users.getUname()%></a></li>
			<li><a href="login.jsp"><span
					class="glyphicon glyphicon-log-out"></span>退出</a></li>
		</ul>
	</div>
	</nav>
	<div class="content">
		<ul class="nav nav-pills side-nav">
			<li class="active"><a href="teacher.jsp">学生作业完成情况</a></li>
			<li><a href="teacherHomework.jsp">布置作业</a></li>
			<li><a href="teacherImport.jsp">导入班级学生信息</a></li>
			<li><a href="teacherAddSub.jsp">增加学科</a></li>
		</ul>
		<div>
			<table class="table table-hover">
				<tr>
					<td width="174" id="title">已布置作业</td>
					<td width="449" id="title">布置时间</td>
					<td width="449" id="title">布置的班级</td>
					<td width="449" id="title">完成情况</td>
					<!-- <td width="161" id="title">删除已发布作业</td> -->
				</tr>
				<%
					//设置老师的ID
					
					String name = users.getUname();
					String teacher_id = "";
					ResultSet rs2 = st.executeQuery("select * from teacher where teacher_name='"+name+"' ");
					while (rs2.next()) {
						teacher_id = rs2.getString("teacher_id");
					}
					request.getSession().setAttribute("teacher_id",teacher_id);
					rs2.close();
				%>
				<%-- <h4><%=session.getAttribute("teacher_id")%></h4> --%>
				<%
					//把表格第二行的显示放到while循环中，就可以根据查询结果画出表格了。参数则放在<td>内的相应位置。
					
					ResultSet rs = st.executeQuery("select * from homework where teacher_id='"+teacher_id+"' ");
					while (rs.next()) {
				%>
				
				<tr>
					<td width="174"><%=rs.getString("work_title")%></td>
					<td width="161"><%=rs.getString("submission_date")%></td>
					<td width="161"><%=rs.getString("class")%></td>
					<td width="161">
						<form method="post" action="searchStuServlet"
							class="form-inline my-form" role="form">
							<input value=<%=rs.getString("class")%> type="hidden" name="class">
							<input value=<%=rs.getInt("id")%> type="hidden" name="homework_id">
							<button type="submit" class="btn btn-default my-btn">点击查看</button>
						</form>
					</td>
					<!-- <td width="161">
						<form method="post" action=""
							class="form-inline my-form" role="form">
							<input name="id" type="hidden">
							<button type="submit" class="btn btn-default my-btn">删除</button>
						</form>
					</td> -->
				</tr>

				<%
					}
					//注意"}"的位置
				%>
			</table>

			<%
				rs.close();
				conn.close();
			%>
		</div>
	</div>
</body>
</html>
