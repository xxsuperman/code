package com.zs.pms.vo;

public class QueryLogin {
	private String loginname;
	private String password;
	private String chkcode;
	public String getChkcode() {
		return chkcode;
	}
	public void setChkcode(String chkcode) {
		this.chkcode = chkcode;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
