package org.home.entity;

public class Student {
	public Student(String student_name) {
		super();
		this.student_name = student_name;
	}

	private String student_name;

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
}
