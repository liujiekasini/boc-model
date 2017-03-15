package com.oec.model;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @author liujie
 * @version 1.0
 * @since 2017年2月7日 下午4:28:00
 */
public class Paging implements Serializable {
	private static final long serialVersionUID = 7544274721272147458L;
	private int total;
	private List rows;

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}


	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}
}