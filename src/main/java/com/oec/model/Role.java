package com.oec.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 * @author liujie
 * @version 1.0
 * @since 2017年2月7日 下午4:28:12
 */
public class Role implements Serializable {
	private Integer id;
	private String name;
	private List<Permission> permissionSet = new ArrayList<Permission>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Permission> getPermissionSet() {
		return permissionSet;
	}

	public void setPermissionSet(List<Permission> permissionSet) {
		this.permissionSet = permissionSet;
	}

}
