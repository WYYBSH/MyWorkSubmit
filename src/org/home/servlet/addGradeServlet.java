package org.home.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.home.dao.HomeworkState;
import org.home.entity.HWState;

public class addGradeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		String grade = request.getParameter("grade");
		String student_id = request.getParameter("student_id");
		String student_class= request.getParameter("class");
		String homework_id= request.getParameter("homework_id");
		int id = Integer.parseInt(homework_id);
		
		HWState myhwstate = new HWState(id);
		
		List<String> students =HomeworkState.serchStu(student_class);
		List<HWState> hws = HomeworkState.searchHW(myhwstate);
		
		int result = HomeworkState.addGrade(grade,id,student_id);
		System.out.println(grade);
		System.out.println("Ñ§ÉúID---->"+student_id);
		
		request.setAttribute("students", students);
		request.setAttribute("hws", hws);
		getServletContext().getRequestDispatcher("/StuHomCompletion.jsp").forward(request, response);
	}

	

}
