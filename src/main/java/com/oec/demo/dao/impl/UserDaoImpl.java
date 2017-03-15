package com.oec.demo.dao.impl;

import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oec.demo.dao.UserDao;
import com.oec.model.Paging;
import com.oec.model.Permission;
import com.oec.model.Role;
import com.oec.model.User;
import com.oec.utils.DbUtilsBaseDao;

/**
 * 
 * @author liujie
 * @version 1.0
 * @since 2017年2月7日 下午4:28:45
 */
@Repository
public class UserDaoImpl extends DbUtilsBaseDao implements UserDao {

	private Logger log = Logger.getLogger(UserDaoImpl.class);
	@Autowired
	public DataSource dataSource;

	@Override
	public DataSource getDataSource() {
		return this.dataSource;
	}

	public User findUserByUsername(String username) {
		String sql = "select username as username,password as password,role_id as roleId from t_user where username=?";
		String roles = "SELECT * FROM `t_role` tr left join t_user tu on tr.id=tu.role_id where tu.username=?";
		String per = "select tp.id,tp.permissionname as name from t_permission tp left join t_role_permission trp on tp.id=trp.permission_id left join t_role tr on trp.role_id=tr.id where tr.rolename=?";
		User user;
		try {
			user = (User) queryforBean(User.class, sql, new Object[] { username });
			Role role = (Role) queryforBean(Role.class, roles, new Object[] { user.getUsername() });
			List<Permission> perlist = queryForList(per, new Object[] { role.getName() });
			if (user != null) {
				Set<Role> set = new HashSet<Role>();
				role.setPermissionSet(perlist);
				set.add(role);
				user.setRoleSet(set);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return new User();
		}
		return user;
	}

	public String alipay(int mon) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertJK(User user, String ipstr) {
		String sql="insert t_monitor(login_name,ip,create_time) values(?,?,NOW())";
		try {
			return update(sql, new Object[]{user.getUsername(),ipstr});
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public Paging searchmonitor(int page, int rows) throws SQLException {
		int start = rows * (page - 1);
		String sql = "select login_name as loginName,ip as ip,date_format(create_time,'%y-%m-%d %h:%m:%s') as createTime from t_monitor order by create_time desc";
		List<Map<String, Object>> list1 = queryForList(sql);
		sql += "  limit " + start + "," + rows;
		List<Map<String, Object>> list = queryForList(sql);
		Paging pagelist = new Paging();
		pagelist.setRows(list);
		pagelist.setTotal(list1.size());
		return pagelist;
	}

}
