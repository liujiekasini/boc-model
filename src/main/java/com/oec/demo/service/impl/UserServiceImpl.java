package com.oec.demo.service.impl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oec.demo.dao.UserDao;
import com.oec.demo.service.UserService;
import com.oec.deom.redis.utils.RedisUtil;
import com.oec.model.Paging;
import com.oec.model.User;

/**
 * 
 * @author liujie
 * @version 1.0
 * @since 2017年2月7日 下午4:28:29
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userdao;
	@Autowired
	private RedisUtil redisUtil;

	public User findUserByUsername(String username) {
		return userdao.findUserByUsername(username);
	}

	public String alioay(int mon) {
		// User user = userdao.findUserByUsername("tom");
		// System.out.println(user.toString());
		// 测试redis
		boolean str = redisUtil.set("testkey1", "测试插入成功了没有");
		boolean str1 = redisUtil.set("testkey2", "测试插入成功了没有");
		boolean str2 = redisUtil.set("testkey3", "测试插入成功了没有");
		boolean str3 = redisUtil.set("testkey4", "测试插入成功了没有");
		boolean str4 = redisUtil.set("testkey5", "测试插入成功了没有");
		System.out.println(str);
		return "redis ke yong";
	}

	public int insertJK(User user, String ipstr) {
			return userdao.insertJK(user,ipstr);
		
	}

	public Paging searchmonitor(int page, int rows) {
		try {
			return userdao.searchmonitor(page,rows);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}
