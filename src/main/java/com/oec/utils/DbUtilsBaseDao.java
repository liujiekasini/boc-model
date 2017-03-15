package com.oec.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

public abstract class DbUtilsBaseDao<T> {

	public static final String MYSQL_SQL = "{0} limit {1},{2}"; //oracle
	
	public Map<String, Object> queryForMap(String sql, Object... objects)
			throws SQLException {
		Map<String, Object> map = new QueryRunner(getDataSource()).query(sql,
				new MapHandler(), objects);
		return map;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<String> queryForObjectList(String sql, Object... objects)
			throws SQLException {
		List<String> list = (List<String>) new QueryRunner(getDataSource())
				.query(sql, new ColumnListHandler(), objects);
		return list;
	}

	public List<Map<String, Object>> queryForList(String sql, Object... objects)
			throws SQLException {
		List<Map<String, Object>> list = new QueryRunner(getDataSource())
				.query(sql, new MapListHandler(), objects);
		return list;
	}

	public List<T> queryForListBean(Class<T> cls, String sql, Object... objects)
			throws SQLException {
		List<T> list = new QueryRunner(getDataSource()).query(sql,
				new BeanListHandler<T>(cls), objects);
		return list;
	}

	public List<T> queryForColumnList(Class<T> cls, String sql,
			Object... objects) throws SQLException {
		return new QueryRunner(getDataSource()).query(sql,
				new ColumnListHandler<T>(), objects);
	}

	public T queryforBean(Class<T> cls, String sql, Object... objects)
			throws SQLException {
		T t = new QueryRunner(getDataSource()).query(sql, new BeanHandler<T>(
				cls), objects);
		return t;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Integer queryForCount(String sql, Object... objects)
			throws SQLException {
		Object obj = new QueryRunner(getDataSource()).query(sql,
				new ScalarHandler(), objects);
		if (null == obj) {
			return 0;
		}
		Integer count = Integer.valueOf(""
				+ new QueryRunner(getDataSource()).query(sql,
						new ScalarHandler(), objects));
		return count;
	}

	public List<Map<String, Object>> queryForListByPage(String sql, int page,
			int rows, Object... objects) throws SQLException {
		// 转换分页sql
		List<Map<String, Object>> list = new QueryRunner(getDataSource())
				.query(sql, new MapListHandler(), objects);
		return list;
	}

	public List<T> queryForListBeanByPage(Class<T> cls, String sql, int page,
			int rows, Object... objects) throws SQLException {
		int startNum = (page-1) * rows;
		Object[] sqlParam = new String[3];
		sqlParam[0] = sql;
		sqlParam[1] = startNum+"";
		sqlParam[2] = rows+"";
		sql = MessageFormat.format(MYSQL_SQL, sqlParam);
		
		List<T> list = new QueryRunner(getDataSource()).query(sql,
				new BeanListHandler<T>(cls), objects);
		return list;
	}

	public int update(String sql, Object... objects) throws SQLException {
		return new QueryRunner(getDataSource()).update(sql, objects);
	}
	
	public Long insert(String sql,Object...objects) throws SQLException{
		Connection conn=null;
		try {
			conn=getDataSource().getConnection();
			PreparedStatement stmt= conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			new QueryRunner().fillStatement(stmt, objects);
			stmt.executeUpdate();
			ResultSet rs= stmt.getGeneratedKeys();
			if(rs.next()){
				return rs.getLong(1);
			}
			return null;
		} finally {
			if(conn!=null){
				conn.close();
			}
		}
	}
	
	public Long insert(Connection conn ,String sql,Object...objects) throws SQLException{
		PreparedStatement stmt= conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
		new QueryRunner().fillStatement(stmt, objects);
		stmt.executeUpdate();
		ResultSet rs= stmt.getGeneratedKeys();
		if(rs.next()){
			return rs.getLong(1);
		}
		return null;
	}

	public int update(Connection conn, String sql, Object... objects)
			throws SQLException {
		return new QueryRunner().update(conn, sql, objects);
	}

	public int[] batch(String sql, Object[][] params) throws SQLException {
		return new QueryRunner(getDataSource()).batch(sql, params);
	}

	public int[] batch(Connection conn, String sql, Object[][] params)
			throws SQLException {
		return new QueryRunner().batch(conn, sql, params);
	}

	public int[] updateBatch(Connection con, String sql, Object[][] params)
			throws SQLException {
		return new QueryRunner().batch(con, sql, params);
	}

	/**
	 * 根据字段名和表名创建id
	 * 
	 * @param field
	 * @param tableName
	 * @return
	 * @throws SQLException
	 */
	public String queryMaxId(String field, String tableName)
			throws SQLException {
		String sql = "select max(" + field + ") from " + tableName;
		List<String> list = this.queryForObjectList(sql);
		if (list.size() == 0 || list.get(0) == null)
			return null;
		else {
			// 初始用户处理
			if (list.get(0).toString().equalsIgnoreCase("admin"))
				return "DF10001";
			String id = list.get(0);
			int location = id.indexOf("1");
			String prex = id.substring(0, location);
			int num = Integer.parseInt(id.substring(location));
			return prex + (num + 1);
		}
	}

	public abstract DataSource getDataSource();
}
