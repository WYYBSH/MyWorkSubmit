<%@ page language="java" import="java.util.*,java.sql.*, java.util.*"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'StuHomCompletion.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="./res/css/bootstrap.min.css">
<script src="./res/jquery-3.2.1/jquery-3.2.1.min.js"></script>
<script src="./res/js/bootstrap.min.js"></script>
</head>
<style>


</style>
<body>

	<a href="teacher.jsp">返回上一级<<< </a>
	<%
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		String student_class = request.getParameter("class");//班级
		String homework_id = request.getParameter("homework_id");//作业ID
	%>
	<h1><%=student_class%>作业完成情况</h1>
	<%-- <h1><%=homework_id%></h1> --%>
	<%-- <h1><%=request.getAttribute("students")%></h1> --%>

	<table class="table table-hover">
		<tr>
			<td width="174">姓名</td>
			<td width="174">是否上传</td>
			<td width="174">是否批改</td>
			<td width="161">分数</td>
			<td width="161">设置分数</td>
			<td width="161">上传文件地址</td>
		</tr>

		<%-- <c:forEach var="item" items="${students}">
			<tr>
				<td width="174">${item}</td>
			</tr>
		</c:forEach> --%>
		<c:forEach var="item" items="${hws}">
			<tr>
				<td width="174">${item.student_id}</td>
				<td width="174">${item.upload_status}</td>
				<td width="174">${item.correction_status}</td>
				<td width="174">${item.grade}</td>

				<td width="374">
					<div class="content-form">
						<form method="post" action="addGradeServlet"
							class="form-horizontal my-form" role="form">
							<div class="form-group">
								<div class="col-sm-3">
									<input type="text" id="uname" name="grade"
										class="form-control well" placeholder="作业分数" />
								</div>
							</div>
							<input value="${item.student_id}" type="hidden" name="student_id">
							<input value=<%=student_class%> type="hidden" name="class">
							<input value=<%=homework_id%> type="hidden" name="homework_id">
							<button type="submit" class="btn btn-default my-btn">设置</button>
						</form>
					</div>

				</td>
				<td width="174">${item.work_address}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
