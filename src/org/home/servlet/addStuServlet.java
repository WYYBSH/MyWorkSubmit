package org.home.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.home.dao.MyDBUtil;

public class addStuServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		String student_id = request.getParameter("student_id");
		String student_name = request.getParameter("student_name");
		String student_password = request.getParameter("student_password");
		String student_class = request.getParameter("student_class");
		
		System.out.println(student_class);

		String sql = "INSERT INTO student (student_id,student_name,student_password,student_class) VALUES (?,?,?,?)";
		PreparedStatement ps = null;
		Connection conn = MyDBUtil.connetDB();
		int result = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, student_id);
			ps.setString(2, student_name);
			ps.setString(3, student_password);
			ps.setString(4, student_class);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBUtil.closeDB();
		}
		String message = null;
		if (result == 0) {
			message = "添加失败";
		} else {
			message = "添加成功";
		}

		request.setAttribute("message", message);
		getServletContext().getRequestDispatcher("/adminAddStu.jsp").forward(request, response);
		
		/*System.out.println(message);
		System.out.println(student_id);
		System.out.println(student_name);
		System.out.println(student_password);
		System.out.println("class--->"+student_class);*/
		
		
	}
}
