package org.home.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.home.dao.MyDBUtil;

public class delTeaServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		//System.out.println("IDºÅ"+id);
		String sql = "DELETE FROM teacher WHERE id = ?";
		PreparedStatement ps = null;
		Connection conn = MyDBUtil.connetDB();
		int result = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBUtil.closeDB();
		}
		String messageStu = null;
		if (result == 0) {
			messageStu = "É¾³ýÊ§°Ü";
		} else {
			messageStu = "É¾³ý³É¹¦";
		}
		//request.setAttribute("messageStu", messageStu);
		getServletContext().getRequestDispatcher("/adminTea.jsp").forward(request, response);
	}

}
