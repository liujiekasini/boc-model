package com.oec.demo.service;

import com.oec.model.Paging;
import com.oec.model.User;

/**
 * 
 * @author liujie
 * @version 1.0
 * @since 2017骞�2鏈�7鏃� 涓嬪崍4:28:38
 */
public interface UserService {
	User findUserByUsername(String username);

	String alioay(int mon);

	int insertJK(User user, String ipstr);

	Paging searchmonitor(int page, int rows);
}
