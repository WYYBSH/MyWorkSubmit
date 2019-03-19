package org.home.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.home.dao.MyDBUtil;

public class addSubServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		String subject = request.getParameter("subject");
		
		
		System.out.println(subject);

		String sql = "INSERT INTO subject (subject_name) VALUES (?)";
		PreparedStatement ps = null;
		Connection conn = MyDBUtil.connetDB();
		int result = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, subject);
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
		getServletContext().getRequestDispatcher("/teacherAddSub.jsp").forward(request, response);
		
		/*System.out.println(message);
		System.out.println(student_id);
		System.out.println(student_name);
		System.out.println(student_password);
		System.out.println("class--->"+student_class);*/
		
	}

}
