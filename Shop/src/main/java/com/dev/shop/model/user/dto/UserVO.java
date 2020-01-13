package com.dev.shop.model.user.dto;

public class UserVO {

	private String id;
	private String name;
	private String email;
	private String passwd;
	private int phone;
	private String role;
	
	public UserVO() {
		super();
	}

	public UserVO(String id, String passwd) {
		this.id = id;
		this.passwd = passwd;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", name=" + name + ", email=" + email + ", passwd=" + passwd
				+ ", phone=" + phone + ", role=" + role + "]";
	}

}
