<%@ page language="java" import="java.util.*, java.sql.*"
	pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<style type="text/css">
table {
	width: 800px;
	margin: auto;
	padding: 5px;
	font-size: 12px;
	border: 0px;
	background: #00CCFF;
}

tr {
	background: #fff;
}

td {
	padding: 5px;
}

#title {
	text-align: center;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档11</title>
</head>

<body>
	<%
		//连接MySQL数据库 
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String url = "jdbc:mysql://localhost:3306/worksubmit?characterEncoding=utf8&useSSL=false";
		String user = "root";
		String password = "123456";
		Connection conn = DriverManager.getConnection(url, user, password);
		Statement st = conn.createStatement();
	%>
	<table>
		<tr>
			<td width="174" id="title">标题</td>
			<td width="449" id="title">内容</td>
			<td width="161" id="title">时间</td>
		</tr>

		<%
			//把表格第二行的显示放到while循环中，就可以根据查询结果画出表格了。参数则放在<td>内的相应位置。
			ResultSet rs = st.executeQuery("SELECT * FROM homework ORDER BY id DESC LIMIT 10");
			while (rs.next()) {
		%>

		<tr>
			<td width="174"><%=rs.getString("teacher_id")%></td>
			<td width="449"><%=rs.getString("work_title")%></td>
			<td width="161"><%=rs.getString("work_content")%></td>
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
</body>
</html>