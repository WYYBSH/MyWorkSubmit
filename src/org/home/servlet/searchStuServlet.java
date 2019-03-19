package org.home.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.home.dao.HomeworkState;
import org.home.entity.HWState;

import java.util.ArrayList;
import java.util.List;

public class searchStuServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String student_class= request.getParameter("class");
		String homework_id= request.getParameter("homework_id");
		int id = Integer.parseInt(homework_id);
		HWState myhwstate = new HWState(id);
		
		List<String> students =HomeworkState.serchStu(student_class);
		List<HWState> hws = HomeworkState.searchHW(myhwstate);
		
		request.setAttribute("students", students);
		request.setAttribute("hws", hws);
		
		
		request.getRequestDispatcher("StuHomCompletion.jsp").forward(request, response);
	}

	

}
