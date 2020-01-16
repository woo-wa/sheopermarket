package com.dev.shop.model.user.dto;

public class UserVO {

	private String userid;
	private String name;
	private String email;
	private String passwd;
	private int phone;
	private String authority;
	private int enabled;
	public UserVO() {
		super();
	}

	public UserVO(String id, String passwd) {
		this.userid = id;
		this.passwd = passwd;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", name=" + name + ", email=" + email + ", passwd=" + passwd + ", phone="
				+ phone + ", authority=" + authority + ", enabled=" + enabled + "]";
	}
	
	
	
	

}
