package org.home.dao;

import java.sql.*;
import org.home.dao.*;
import org.home.entity.*;
import java.util.ArrayList;
import java.util.List;

public class HomeworkState {
	/* 根据班级找到学生姓名的list */
	public static List<String> serchStu(String student_class) {

		String sql = "select * from student where student_class = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<String> students = new ArrayList<>();

		Connection conn = MyDBUtil.connetDB();

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, student_class);
			rs = ps.executeQuery();

			while (rs.next()) {
				String student_name = rs.getString("student_name");
				System.out.println("name----->" + student_name);
				students.add(student_name);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBUtil.closeDB();
		}
		return students;
	}

	/* 根据学生班级找到学生ID的list */
	public static List<String> searchStuId(String student_class) {

		PreparedStatement ps = null;
		ResultSet rs = null;

		List<String> students = new ArrayList<>();
		Connection conn = MyDBUtil.connetDB();

		String sql = "select * from student where student_class = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, student_class);
			rs = ps.executeQuery();

			while (rs.next()) {
				String student_id = rs.getString("student_id");
				students.add(student_id);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBUtil.closeDB();
		}

		return students;
	}

	/* 找到全部班级list */
	public static List<String> searchStuAllId() {

		PreparedStatement ps = null;
		ResultSet rs = null;

		List<String> students = new ArrayList<>();
		Connection conn = MyDBUtil.connetDB();
		
		String sql = "select student_id from student";

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				String student_id = rs.getString("student_id");
				System.out.println("所有学生ID---->" + student_id);
				students.add(student_id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBUtil.closeDB();
		}

		return students;
	}

	/* 找到刚上传的作业ID */
	public static int searchHWId() {

		PreparedStatement ps = null;
		ResultSet rs = null;
		int id = -1;

		Connection conn = MyDBUtil.connetDB();
		String sql = "select max(id) from homework";

		try {
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();

			while (rs.next()) {
				id = rs.getInt("max(id)");
				System.out.println("找到的最大的id：" + id);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBUtil.closeDB();
		}

		return id;
	}

	/* 根据作业ID找到里面的相应的信息 */
	public static List<HWState> searchHW(HWState myhwstate) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		HWState hwstate = null;
		List<HWState> lists = new ArrayList<>();
		Connection conn = MyDBUtil.connetDB();

		String sql = "select * from homeworkstate where homework_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, myhwstate.getHomework_id());
			rs = ps.executeQuery();

			while (rs.next()) {
				int homework_id = rs.getInt("homework_id");
				String student_id = rs.getString("student_id");
				String teacher_id = rs.getString("teacher_id");
				Boolean upload_status = rs.getBoolean("upload_status");
				Boolean correction_status = rs.getBoolean("correction_status");
				String work_address = rs.getString("work_address");
				String grade = rs.getString("grade");

				hwstate = new HWState(homework_id, student_id, teacher_id, upload_status, correction_status,
						work_address, grade);
				System.out.println("ceshi" + hwstate);
				lists.add(hwstate);
			}
			return lists;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBUtil.closeDB();
		}
		return lists;
	}

	/* 更新分数 */
	public static int addGrade(String grade, int homework_id, String student_id) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;

		Connection conn = MyDBUtil.connetDB();
		String sql = "UPDATE homeworkstate SET grade=?,correction_status=? WHERE homework_id=? AND student_id=?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, grade);
			ps.setBoolean(2, true);
			ps.setInt(3, homework_id);
			ps.setString(4, student_id);
			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDBUtil.closeDB();
		}

		String message = null;

		if (result == 0) {
			message = "UPDATE FAIL";
		} else {
			message = "UPDATE SUCCESS";
		}
		return result;
	}

}
