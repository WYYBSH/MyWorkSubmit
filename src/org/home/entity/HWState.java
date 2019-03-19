package org.home.entity;

public class HWState {
	private int homework_id;
	private String student_id;
	private String teacher_id;
	private Boolean upload_status;
	private Boolean correction_status;
	private String work_address;
	private String grade;
	
	public HWState(int homework_id) {
		//super();
		this.homework_id = homework_id;
	}
	public HWState(int homework_id, String student_id, String teacher_id, Boolean upload_status,
			Boolean correction_status, String work_address, String grade) {
		super();
		this.homework_id = homework_id;
		this.student_id = student_id;
		this.teacher_id = teacher_id;
		this.upload_status = upload_status;
		this.correction_status = correction_status;
		this.work_address = work_address;
		this.grade = grade;
	}
	
	public int getHomework_id() {
		return homework_id;
	}
	public void setHomework_id(int homework_id) {
		this.homework_id = homework_id;
	}
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public Boolean getUpload_status() {
		return upload_status;
	}
	public void setUpload_status(Boolean upload_status) {
		this.upload_status = upload_status;
	}
	public Boolean getCorrection_status() {
		return correction_status;
	}
	public void setCorrection_status(Boolean correction_status) {
		this.correction_status = correction_status;
	}
	public String getWork_address() {
		return work_address;
	}
	public void setWork_address(String work_address) {
		this.work_address = work_address;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
}
