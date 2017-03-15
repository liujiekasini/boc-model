package com.oec.model;

import java.io.Serializable;

/**
 * 网络声量实体类（二维和三维柱形图 x坐标单独存取）
 * 
 * @author 作者：刘杰
 *
 * @version 创建时间：2016年9月8日 下午5:33:16
 */
public class OecCompany implements Serializable {

	private String shortName;
	private String fullName;
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

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "OecCompany [shortName=" + shortName + ", fullName=" + fullName + ", createTime=" + createTime + "]";
	}

}
