package org.home.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.*;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.home.dao.AddHWDao;
import org.home.dao.HomeworkState;
import org.home.dao.LoginDao;
import org.home.dao.MyDBUtil;
import org.home.entity.AddHW;
import org.home.entity.AddHWSate;
import org.home.entity.Login;

public class InputWorkInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		String work_title = request.getParameter("work_title");
		String work_content = request.getParameter("work_content");
		String student_class = request.getParameter("class");
		String subject = request.getParameter("subject");
		String teacher_id = request.getParameter("teacherid");

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateNowStr = sdf.format(date);

		
		/*System.out.println("题目：" + work_title);
		System.out.println("内容：" + work_content);
		System.out.println("格式化后的日期：" + dateNowStr);
		System.out.println("班级：" + student_class);
		System.out.println("ID号码：" + teacher_id);*/
		Boolean upload_status = false;
		Boolean correction_status = false;
		String work_address = "";
		String grade = "";

		AddHW hw = new AddHW(teacher_id, work_title, work_content, dateNowStr, student_class, subject);
		int result = AddHWDao.addHW(hw);
		int homework_id = HomeworkState.searchHWId();
		List<String> students_id =HomeworkState.searchStuId(student_class);
		List<String> all_id =HomeworkState.searchStuAllId();
		
		System.out.println("allID：" + all_id);
		System.out.println("students_id：" + students_id);
		System.out.println("班级：" + student_class);
		
		if (result == 1) {
			if(student_class.equals( "全部班级")){
				
				for(int x = 0; x < all_id.size(); x++) {
					String student_id=all_id.get(x);
					/*System.out.println("插入的state内容的学生ID：" + student_id);*/
					AddHWSate hws = new AddHWSate(homework_id, student_id,teacher_id,upload_status,correction_status,work_address,grade);
					int result2 = AddHWDao.addHWState(hws);
			      }
			}else{
				for(int x = 0; x < students_id.size(); x++) {
					String student_id=students_id.get(x);
					/*System.out.println("插入的state内容的学生ID：" + student_id);*/
					AddHWSate hws = new AddHWSate(homework_id, student_id,teacher_id,upload_status,correction_status,work_address,grade);
					int result3 = AddHWDao.addHWState(hws);
			      }
			}	
		}

		
		
		
		
		// request.setAttribute("message", message);
		getServletContext().getRequestDispatcher("/teacherHomework.jsp").forward(request, response);
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
