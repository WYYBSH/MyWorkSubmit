package org.home.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.home.dao.MyDBUtil;

public class addTeaServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		String teacher_id = request.getParameter("teacher_id");
		String teacher_name = request.getParameter("teacher_name");
		String teacher_password = request.getParameter("teacher_password");

		String sql = "INSERT INTO teacher (teacher_id,teacher_name,teacher_password) VALUES (?,?,?)";
		PreparedStatement ps = null;
		Connection conn = MyDBUtil.connetDB();
		int result = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, teacher_id);
			ps.setString(2, teacher_name);
			ps.setString(3, teacher_password);
			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBUtil.closeDB();
		}
		String message = null;
		if (result == 0) {
			message = "插入失败";
		} else {
			message = "插入成功";
		}

		request.setAttribute("message", message);
		getServletContext().getRequestDispatcher("/adminAddTea.jsp").forward(request, response);

		// System.out.println(message);
		// System.out.println(student_name);
		// System.out.println(student_class);
		// InputStuInfo stuinfo = new InputStuInfo(student_id, student_name,
		// student_class);
		// System.out.println(stuinfo.getStudent_id());
	}

}
