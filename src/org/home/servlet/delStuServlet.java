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

public class delStuServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		//System.out.println("ID��"+id);
		String sql = "DELETE FROM student WHERE id = ?";
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
			messageStu = "ɾ��ʧ��";
		} else {
			messageStu = "ɾ���ɹ�";
		}
		//request.setAttribute("messageStu", messageStu);
		getServletContext().getRequestDispatcher("/admin.jsp").forward(request, response);

	}

}
