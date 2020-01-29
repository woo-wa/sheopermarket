package com.dev.shop.model.address.vo;

public class AddressVO {
	private int addno;
	private String userid;
	private String recipient;
	private String code;
	private String addr1;
	private String addr2;
	private String phone;
	private String memo;
	private int def;
	
	public int getAddno() {
		return addno;
	}
	public void setAddno(int addno) {
		this.addno = addno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public int getDef() {
		return def;
	}
	public void setDef(int def) {
		this.def = def;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	@Override
	public String toString() {
		return "AddressVO [addno=" + addno + ", userid=" + userid + ", recipient=" + recipient + ", code=" + code
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", phone=" + phone + ", memo=" + memo + ", def=" + def
				+ "]";
	}
	
}
