package com.oec.model;

public class RecCompanyName {
	private int id;
	private String shortName;
	private String fullName;
	private int validFlg;
	private String createTime;
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getValidFlg() {
		return validFlg;
	}
	public void setValidFlg(int validFlg) {
		this.validFlg = validFlg;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
