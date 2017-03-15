package com.oec.demo.dao;

import java.sql.SQLException;

import com.oec.model.Paging;
import com.oec.model.User;

/**
 * 
 * @author liujie
 * @version 1.0
 * @since 2017年2月7日 下午4:28:52
 */
public interface UserDao {
	User findUserByUsername(String username);

	String alipay(int mon);

	int insertJK(User user, String ipstr);

	Paging searchmonitor(int page, int rows)throws SQLException ;
}
