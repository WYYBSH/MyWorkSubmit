package org.home.entity;

public class Login {
	private String uname;
	private String upwd;
	private String userRole;
	private String id;
	public String getUname() {
		return uname;
	}
	public Login(String uname, String upwd, String userRole, String id) {
		//super();
		this.uname = uname;
		this.upwd = upwd;
		this.userRole = userRole;
		this.id = id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public Login(String uname, String upwd, String userRole) {
		//super();
		this.uname = uname;
		this.upwd = upwd;
		this.userRole = userRole;
	}
}
