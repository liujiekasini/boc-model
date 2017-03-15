package com.oec.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.oec.model.Paging;

@Service
public class AnaysisService {
	private Logger log = Logger.getLogger(AnaysisService.class);

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public Paging startanaysis(String title, String content) {

		return null;
	}

	private boolean companyNameYZ(String getshortname, String getlongname) {
		String sql = "select * from company_name_new where short_name=? and full_name=?";
		List<Map<String, Object>> count = jdbcTemplate.queryForList(sql, new Object[] { getshortname, getlongname });
		if (count.size() > 0) {
			return true;
		}
		return false;
	}

	// company_name_new表
	public int insertcompany(String getshortname, String getlongname) {
		if (companyNameYZ(getshortname, getlongname)) {
			return -1;
		}
		String sql = "insert into company_name_new(short_name,full_name,create_time) values(?,?,NOW())";
		int count = 0;
		try {
			count = jdbcTemplate.update(sql, new Object[] { getshortname, getlongname });
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return count;
	}

	private boolean errorwordYZ(String geterrorword) {
		String sql = "select * from company_wrong where name=?";
		List<Map<String, Object>> count = jdbcTemplate.queryForList(sql, new Object[] { geterrorword });
		if (count.size() > 0) {
			return true;
		}
		return false;
	}

	// company_wrong表
	public int insertword(String geterrorword) {
		if (errorwordYZ(geterrorword)) {
			return -1;
		}
		String sql = "insert into company_wrong(name,create_time) values(?,NOW())";
		int count = jdbcTemplate.update(sql, new Object[] { geterrorword });
		return count;
	}

	public Paging searchCompany(int page, int rows, String searchCompany) {
		int start = rows * (page - 1);
		String sql = "select short_name as shortName,full_name as fullName,date_format(create_time,'%y-%m-%d %h:%m:%s') as createTime from company_name_new";
		if (!searchCompany.equals("")) {
			sql += " where short_name like '%" + searchCompany + "%' or full_name like '%" + searchCompany + "%'";
		}
		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql);
		sql += "  limit " + start + "," + rows;
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		Paging pagelist = new Paging();
		pagelist.setRows(list);
		pagelist.setTotal(list1.size());
		return pagelist;
	}

	public Paging searchCompany1(int page, int rows, String searchCompany) {
		int start = rows * (page - 1);
		String sql = "select name as name,date_format(create_time,'%y-%m-%d %h:%m:%s')  as createTime from company_wrong";
		if (!searchCompany.equals("")) {
			sql += " where name like '%" + searchCompany + "%'";
		}
		List<Map<String, Object>> list1 = jdbcTemplate.queryForList(sql);
		sql += "  limit " + start + "," + rows;
		List<Map<String, Object>> list = jdbcTemplate.queryForList(sql);
		Paging pagelist = new Paging();
		pagelist.setRows(list);
		pagelist.setTotal(list1.size());
		return pagelist;
	}
}
