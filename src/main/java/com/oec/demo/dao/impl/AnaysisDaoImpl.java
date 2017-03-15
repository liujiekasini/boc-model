package com.oec.demo.dao.impl;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.oec.demo.dao.AnaysisDao;
import com.oec.model.Paging;
import com.oec.model.RecCompanyName;
import com.oec.model.RecPersonName;
import com.oec.model.RecRelationWord;
import com.oec.model.RecStopWord;

/**
 * @author liujie
 * @version 1.0
 * @since 2017骞�2鏈�23鏃� 涓婂崍11:22:28
 */
@Repository
public class AnaysisDaoImpl implements AnaysisDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public boolean companyNameYZ(String getshortname, String getlongname) {
		String sql = "select * from rec_company_name where short_name=? and full_name=?";
		List<Map<String, Object>> count = jdbcTemplate.queryForList(sql, new Object[] { getshortname, getlongname });
		if (count.size() > 0) {
			return true;
		}
		return false;
	}

	// rec_company_name琛�
	public int insertcompany(String getshortname, String getlongname) {
		if (companyNameYZ(getshortname, getlongname)) {
			return -1;
		}
		String sql = "insert into rec_company_name(short_name,full_name,create_time) values(?,?,NOW())";
		int count = 0;
		try {
			if(getshortname.contains("#")){
				String[] strs=getshortname.split("#");
				for(String str:strs){
					count+=jdbcTemplate.update(sql,new Object[]{str,getlongname});
				}
			}else{
			count = jdbcTemplate.update(sql, new Object[] { getshortname, getlongname });
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
			count=0;
		}
		return count;
	}

	public boolean errorwordYZ(String geterrorword) {
		String sql = "select * from rec_person_name where name=?";
		List<Map<String, Object>> count = jdbcTemplate.queryForList(sql, new Object[] { geterrorword });
		if (count.size() > 0) {
			return true;
		}
		return false;
	}

	// rec_company_name琛�
	public int insertword(String managerContent) {
		if (errorwordYZ(managerContent)) {
			return -1;
		}
		String sql = "insert into rec_person_name(name,create_time) values(?,NOW())";
		int count=0;
		try {
			if(managerContent.contains("#")){
				String[] strs=managerContent.split("#");
				for(String str:strs){
					
					count+=jdbcTemplate.update(sql,new Object[]{str});
				}
			}else{
				count = jdbcTemplate.update(sql, new Object[] { managerContent });
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
			count=0;
		}
		return count;
	}

	public Paging searchCompany(int page, int rows, String searchCompany) {
		int start = rows * (page - 1);
		String sql = "select id as id,short_name as shortName,full_name as fullName,valid_flg as validFlg,date_format(create_time,'%y-%m-%d %h:%m:%s') as createTime from rec_company_name";
		if (!searchCompany.equals("")) {
			sql += " where short_name like '%" + searchCompany + "%' or full_name like '%" + searchCompany + "%'";
		}
		sql+=" order by create_time desc";
		String count=jdbcTemplate.queryForObject("select count(1) from rec_company_name", java.lang.String.class);
		sql += "  limit " + start + "," + rows;
		List<RecCompanyName> list = jdbcTemplate.query(sql,new BeanPropertyRowMapper(RecCompanyName.class));
		Paging pagelist = new Paging();
		pagelist.setRows(list);
		pagelist.setTotal(Integer.parseInt(count));
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

	public Paging startanaysis(String title, String content) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * 鎻掑叆鍏崇郴
	 */
	public int insertRelate(String relateContent,String convertContent,String relation_nation) {
		if (yanZhengGX(relateContent)) {
			return -1;
		}
		String sql = "insert into rec_relation_word(real_word,convert_word,word_nature,create_time) values(?,?,?,NOW())";
		int count = 0;
		try {
			if(relateContent.contains("#") && convertContent.contains("#")){
				String[] strs=relateContent.split("#");
				String[] strscon=convertContent.split("#");
				for(int i=0; i<strs.length;i++){
					count+=jdbcTemplate.update(sql,new Object[]{strs[i],strscon[i],relation_nation});
				}
			}else{
				count = jdbcTemplate.update(sql, new Object[] {relateContent,convertContent,relation_nation });
			}
		} catch (DataAccessException e) {
			e.printStackTrace();
			count=0;
		}
		return count;
	}
	public boolean yanZhengGX(String name){
		String sql="select real_word from rec_relation_word where real_word=?";
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql,new Object[]{name});
		if(list.size()>0){
			return true;
		}return false;
	}

	public int insertStop(String stopContent,String stopType) {
		if (yanZhengStop(stopContent)) {
			return -1;
		}
		String sql = "insert into rec_stop_word(word,word_type,create_time) values(?,?,NOW())";
		int count = 0;
		try {
		if(stopContent.contains("#")){
			String[] strs=stopContent.split("#");
			for(String str:strs){
				count+=jdbcTemplate.update(sql,new Object[]{str,stopType});
			}
		}else{
			count = jdbcTemplate.update(sql, new Object[] {stopContent,stopType });
		}
		} catch (DataAccessException e) {
			e.printStackTrace();
			count=0;
		}
		return count;
	}
	public boolean yanZhengStop(String name){
		String sql="select word from rec_stop_word where word=?";
		List<Map<String,Object>> list=jdbcTemplate.queryForList(sql,new Object[]{name});
		if(list.size()>0){
			return true;
		}return false;
	}

	public Paging search_M(int page, int rows, String searchCompany) {
		int start = rows * (page - 1);
		String sql = "select id as id, name as name,valid_flg as validFlg,date_format(create_time,'%y-%m-%d %h:%m:%s') as createTime from rec_person_name";
		if (!searchCompany.equals("")) {
			sql += " where name like '%" + searchCompany.trim() + "%'";
		}
		sql+=" order by create_time desc";
		String count=jdbcTemplate.queryForObject("select count(1) from rec_person_name", java.lang.String.class);
		sql += "  limit " + start + "," + rows;
		List<RecPersonName> list = jdbcTemplate.query(sql,new BeanPropertyRowMapper(RecPersonName.class));
		Paging pagelist = new Paging();
		pagelist.setRows(list);
		pagelist.setTotal(Integer.parseInt(count));
		return pagelist;
	}
	public Paging search_R(int page, int rows, String searchCompany) {
		int start = rows * (page - 1);
		String sql = "select id as id,real_word as realWord,convert_word as convertWord,word_nature as wordNature,valid_flg as validFlg,date_format(create_time,'%y-%m-%d %h:%m:%s') as createTime from rec_relation_word";
		if (!searchCompany.equals("")) {
			sql += " where real_word like '%" + searchCompany.trim() + "%' or convert_word like '%"+searchCompany.trim()+"%'";
		}
		sql+=" order by create_time desc";
		String count=jdbcTemplate.queryForObject("select count(1) from rec_relation_word", java.lang.String.class);
		sql += "  limit " + start + "," + rows;
		List<RecRelationWord> list = jdbcTemplate.query(sql,new BeanPropertyRowMapper(RecRelationWord.class));
		Paging pagelist = new Paging();
		pagelist.setRows(list);
		pagelist.setTotal(Integer.parseInt(count));
		return pagelist;
	}
	public Paging search_T(int page, int rows, String searchCompany) {
		int start = rows * (page - 1);
		String sql = "select id as id, word as word,word_type as wordType,valid_flg as validFlg,date_format(create_time,'%y-%m-%d %h:%m:%s') as createTime from rec_stop_word";
		if (!searchCompany.equals("")) {
			sql += " where word like '%" + searchCompany.trim() + "%'";
		}
		sql+=" order by create_time desc";
		String count=jdbcTemplate.queryForObject("select count(1) from rec_stop_word", java.lang.String.class);

		sql += "  limit " + start + "," + rows;
		List<RecStopWord> list = jdbcTemplate.query(sql,new BeanPropertyRowMapper(RecStopWord.class));
		Paging pagelist = new Paging();
		pagelist.setRows(list);
		pagelist.setTotal(Integer.parseInt(count));
		return pagelist;
	}
	private boolean  yanZhengZC(String  username,String tele){
		String sql="select * from t_user where username =? and tele = ?";
		List<Map<String,Object>> map=jdbcTemplate.queryForList(sql,new Object[]{username,tele});
		if(map!=null && map.size()>0){
			return true;
		}return false;
	}
	public int zhuce(String username, String password, String tele, String address) {
		if(yanZhengZC(username,tele)){
				return -1;
		}
		/**
		 * 注册时候默认注册普通权限
		 */
		String sql="insert into t_user(username,password,tele,address,role_id) values (?,?,?,?,3)";
		return jdbcTemplate.update(sql,new Object[]{username,password,tele,address});
	}

	public List<String> getCompanyList() {
		String sql="select short_name,full_name from rec_company_name";
		List<Map<String,Object>> olist=jdbcTemplate.queryForList(sql);
		List<String> strlist=new ArrayList<String>();
		if(olist!=null && olist.size()!=0){
			for(Map<String,Object> map:olist){
				strlist.add(map.get("short_name")+","+map.get("fule_name"));
			}
		}
		return strlist;
	}

	public InputStream getAmbiguityDic() throws UnsupportedEncodingException {
		InputStream in = null;
		String sql = "select short_name,full_name from rec_company_name ";
			List<Map<String, Object>> wordlist =jdbcTemplate.queryForList(sql);
			if (wordlist != null && wordlist.size() != 0) {
				StringBuffer buf = new StringBuffer();
				for (Map<String, Object> wordmap : wordlist) {
					buf.append("\r\n" + wordmap.get("short_name"));
					buf.append("\r\n" + wordmap.get("full_name"));
				}
				String words = buf.toString();
				if (StringUtils.isNotBlank(words)) {
					in = new ByteArrayInputStream(words.getBytes("UTF-8"));
				}
			}
		return in;
	}

	public int udpatecompany(int id, String shortName, String fullName, int validFlg) {
		String sql="update rec_company_name set short_name=?,full_name=?,valid_flg=?,create_time=NOW() where id=?";
		return jdbcTemplate.update(sql,new Object[]{shortName,fullName,validFlg,id});
	}

	public int remove(int id) {
		String slq="delete from rec_company_name where id=?";
		return jdbcTemplate.update(slq,new Object[]{id});
	}

	public int updatemanager(int id, String name, int validFlg) {
		String sql="update rec_person_name set name=?,valid_flg=?,create_time=NOW() where id=?";
		return jdbcTemplate.update(sql,new Object[]{name,validFlg,id});
	}

	public int remonvemanager(int id) {
		String slq="delete from rec_person_name where id=?";
		return jdbcTemplate.update(slq,new Object[]{id});
	}

	public int removerelate(int id) {
		String slq="delete from rec_relation_word where id=?";
		return jdbcTemplate.update(slq,new Object[]{id});
	}

	public int updaterelate(int id, String realWord, String convertWord, String wordNature, int validFlg) {
		String sql="update rec_relation_word set real_word=?,convert_word=?,word_nature=?,valid_flg=?,create_time=NOW() where id=?";
		return jdbcTemplate.update(sql,new Object[]{realWord,convertWord,wordNature,validFlg,id});
	}

	public int updatestop(int id, String word, String wordType, int validFlg) {
		String sql="update rec_stop_word set word=?,word_type=?,valid_flg=?,create_time=NOW() where id=?";
		return jdbcTemplate.update(sql,new Object[]{word,wordType,validFlg,id});
	}

	public int removestop(int id) {
		String slq="delete from rec_stop_word where id=?";
		return jdbcTemplate.update(slq,new Object[]{id});
	}

}
