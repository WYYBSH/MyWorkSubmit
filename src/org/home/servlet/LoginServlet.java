package org.home.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.home.dao.*;
import org.home.entity.*;

public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("username");
		String pwd = request.getParameter("password");
		String options = request.getParameter("optionsRadios");
		
		Login login = new Login(name, pwd, options);
		
		// 调用模型层登录功能
		// 设置session的值	
		
		int result = LoginDao.login(login);
		if (result > 0) {// 成功
			request.getSession().setAttribute("login", login);
			if(options.equals("teacher")){
				response.sendRedirect("teacher.jsp");
			}else if(options.equals("student")){
				response.sendRedirect("student.jsp");
			}else{
				response.sendRedirect("admin.jsp");
			}
		} else {// 登录失败
	        request.setAttribute("message", "密码或用户名错误，登陆失败！");
	        getServletContext().getRequestDispatcher("/index.jsp").forward(
	                request, response);
			//response.sendRedirect("index.jsp");
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
