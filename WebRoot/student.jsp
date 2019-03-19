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
	margin-left: 20px;
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

		String name = user.getUname();
		String student_class = "";
		String student_id = "";

		//根据姓名获取学生班级和ID
		ResultSet rs5 = st.executeQuery("select * from student where student_name='" + name + "' ");
		while (rs5.next()) {
			student_class = rs5.getString("student_class");//学生班级
			student_id = rs5.getString("student_id");//学生ID
		}
		request.getSession().setAttribute("student_class", student_class);
		request.getSession().setAttribute("student_id", student_id);
		rs5.last();

		//查询此学生的未完成作业
		List<Integer> list = new ArrayList<Integer>();
		ResultSet rs = st.executeQuery("select * from homeworkstate where student_id='" + student_id + "' and upload_status = false");
		while (rs.next()) {
			int id = rs.getInt("homework_id");
			
			list.add(id);
		}
		rs.last();
		//System.out.println("list：" + list);
		//查询此学生上传的作业
		List<Integer> list_upload = new ArrayList<Integer>();
		ResultSet rs_upload = st.executeQuery("select * from homeworkstate where student_id='" + student_id + "' and upload_status = true ");
		while (rs_upload.next()) {
			int id = rs_upload.getInt("homework_id");
			
			list_upload.add(id);
		}
		rs_upload.last();
		
		//查询此学生被批改完成的作业
		List<Integer> list_correction = new ArrayList<Integer>();
		ResultSet rsco = st.executeQuery("select * from homeworkstate where student_id='" + student_id + "' and correction_status = true ");
		while (rsco.next()) {
			int id_my = rsco.getInt("homework_id");
			list_correction.add(id_my);
		}
		rsco.last();
		//System.out.println("list：" + list);
	%>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="student.jsp">数学类课程作业提交系统</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="student.jsp"><span
					class="glyphicon glyphicon-log-user"></span><%=name%></a></li>
			<li><a href="login.jsp"><span
					class="glyphicon glyphicon-log-out"></span>退出</a></li>
		</ul>
	</div>
	</nav>
	<div class="main">
		<ul id="myTab" class="nav nav-pills side-nav">
			<li class="active"><a href="#home" data-toggle="tab">待完成的作业</a></li>
			<li><a href="#ios" data-toggle="tab">已完成的作业</a></li>
			<!-- <li><a href="#up" data-toggle="tab">上传作业</a></li> -->
			<li><a href="#jmeter" data-toggle="tab">完成批阅的作业</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="home">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>标题</th>
							<th>内容</th>
							<th>发布时间</th>
							<th>作业提交</th>
						</tr>
					</thead>

					<tbody>

						<%
							for (int i = 0; i < list.size(); i++) {
								int this_id = list.get(i);
								ResultSet rs6 = st.executeQuery("select * from homework where id='" + this_id + "' ");
								while (rs6.next()) {
						%>
						<tr>
							<td><%=rs6.getString("work_title")%></td>
							<td><%=rs6.getString("work_content")%></td>
							<td><%=rs6.getString("submission_date")%></td>
							<td>
								<form method="post" action="/MyWorkSubmit/UploadServlet"
									enctype="multipart/form-data" class="form-inline my-form"
									role="form">
									<input name="homework_id" type="hidden" value="<%=this_id%>">

									<input type="file" name="uploadFile" /> <input
										class="filesubmit btn" type="submit" value="上传作业" />
								</form>
							</td>
						</tr>
						<%
							}
								rs6.last();
							}
						%>

					</tbody>

				</table>
			</div>
			<div class="tab-pane fade" id="ios">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>标题</th>
							<th>内容</th>
							<th>发布时间</th>

						</tr>
					</thead>

					<tbody>

						<%
							for (int i = 0; i < list_upload.size(); i++) {
								int this_id = list_upload.get(i);
								ResultSet rs7 = st.executeQuery("select * from homework where id='" + this_id + "' ");
								while (rs7.next()) {
						%>
						<tr>
							<td><%=rs7.getString("work_title")%></td>
							<td><%=rs7.getString("work_content")%></td>
							<td><%=rs7.getString("submission_date")%></td>
							
						</tr>
						<%
							}
								rs7.last();
								
							}
						%>

					</tbody>

				</table>

			</div>

			<div class="tab-pane fade" id="jmeter">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>标题</th>
							<th>内容</th>
							<th>发布时间</th>

						</tr>
					</thead>
					<tbody>

						<%
							for (int i = 0; i < list_correction.size(); i++) {
								int this_id = list_correction.get(i);
								ResultSet rs8 = st.executeQuery("select * from homework where id='" + this_id + "' ");
								while (rs8.next()) {
						%>
						<tr>
							<td><%=rs8.getString("work_title")%></td>
							<td><%=rs8.getString("work_content")%></td>
							<td><%=rs8.getString("submission_date")%></td>
							
						</tr>
						<%
							}
								rs8.close();
								conn.close();
							}
						%>

					</tbody>


				</table>

			</div>
		</div>
	</div>
</body>
</html>
