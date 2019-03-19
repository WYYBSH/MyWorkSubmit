package org.home.dao;

import java.sql.*;

import org.home.entity.*;

public class LoginDao {
	public static int login(Login login) {
		// 登录成功与否的标识
		int result = -1;
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		//System.out.println(login.getUserRole().equals("teacher"));
		try {
			Class.forName("com.mysql.jdbc.Driver");// 加载具体的驱动类
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/worksubmit?characterEncoding=utf8&useSSL=false", "root", "123456");
			String sql;
			if(login.getUserRole().equals("teacher")){
				sql = "select count(*) from teacher where teacher_name=? and teacher_password =?";
			}else if(login.getUserRole().equals("student")){
				sql = "select count(*) from student where student_name=? and student_password =?";
			}else{
				sql = "select count(*) from admin where admin_name=? and admin_password =?";
			}
			
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, login.getUname());
			pstmt.setString(2, login.getUpwd());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
			if (result > 0) {
				return 1;
			} else {
				return 0;// 用户名或密码错误
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("加载驱动失败！");
			return -1;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("连接数据库失败！");
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}