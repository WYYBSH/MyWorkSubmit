package org.home.entity;

public class AddHW {
	private String teacher_id;
	private String work_title;
	private String work_content;
	private String submission_date;
	private String myclass;
	private String subject;
	private int pid;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getWork_title() {
		return work_title;
	}
	public void setWork_title(String work_title) {
		this.work_title = work_title;
	}
	public String getWork_content() {
		return work_content;
	}
	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}
	public String getSubmission_date() {
		return submission_date;
	}
	public void setSubmission_date(String submission_date) {
		this.submission_date = submission_date;
	}
	public String getMyclass() {
		return myclass;
	}
	public void setMyclass(String myclass) {
		this.myclass = myclass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public AddHW(String teacher_id, String work_title, String work_content, String submission_date, String myclass,
			String subject) {
		//super();
		this.teacher_id = teacher_id;
		this.work_title = work_title;
		this.work_content = work_content;
		this.submission_date = submission_date;
		this.myclass = myclass;
		this.subject = subject;
	}
	
}
