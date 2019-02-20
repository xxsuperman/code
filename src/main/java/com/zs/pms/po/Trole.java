package com.zs.pms.po;

import java.io.Serializable;

public class Trole implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7744514273436760998L;
	private int id;
	private String rname;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
