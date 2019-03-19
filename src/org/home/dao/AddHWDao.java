package org.home.dao;

import java.sql.Connection;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.home.entity.AddHW;
import org.home.entity.AddHWSate;

public class AddHWDao {
	/*插入homework表*/
	public static int addHW(AddHW hw) {
		
		String sql = "INSERT INTO homework (teacher_id,work_title,work_content,submission_date,subject,class) VALUES (?,?,?,?,?,?)";
		PreparedStatement ps = null;
		Connection conn = MyDBUtil.connetDB();
		int result = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, hw.getTeacher_id());
			ps.setString(2, hw.getWork_title());
			ps.setString(3, hw.getWork_content());
			ps.setString(4, hw.getSubmission_date());
			ps.setString(5, hw.getSubject());
			ps.setString(6, hw.getMyclass());
			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBUtil.closeDB();
		}
		String message = null;
		if (result == 0) {
			message = "插入失败";
			return 0;
		} else {
			message = "插入成功";
			return 1;
		}
	};
	/*插入homeworkstate表*/
	public static int addHWState(AddHWSate hw) {
		String sql = "INSERT INTO homeworkstate (homework_id,student_id,teacher_id,upload_status,correction_status,work_address,grade) VALUES (?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		Connection conn = MyDBUtil.connetDB();
		int result = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, hw.getHomework_id());
			ps.setString(2, hw.getStudent_id());
			ps.setString(3, hw.getTeacher_id());
			ps.setBoolean(4, hw.getUpload_status());
			ps.setBoolean(5, hw.getCorrection_status());
			ps.setString(6, hw.getWork_address());
			ps.setString(7, hw.getGrade());

			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBUtil.closeDB();
		}
		String message = null;
		if (result == 0) {
			message = "插入失败";
			return 0;
		} else {
			message = "插入成功";
			return 1;
		}
	}
}
