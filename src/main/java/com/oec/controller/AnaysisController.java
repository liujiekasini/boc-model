package com.oec.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oec.demo.service.AnaysisService;
import com.oec.model.Paging;
import com.oec.utils.ExcelParseReaderUtils;


@RequestMapping("/anaysis")
@Controller
public class AnaysisController {
	Logger logger = Logger.getLogger(AnaysisController.class);

	@Autowired
	private AnaysisService service;

	/**
	 * 企业模型调试
	 * @param title
	 * @param content
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@SuppressWarnings("rawtypes")
	@ResponseBody
	@RequestMapping(value = "/startanaysis", method = RequestMethod.POST)
	public Paging anaysis(@RequestParam(value = "type", defaultValue = "2", required = false) String type,
			@RequestParam(value = "title", defaultValue = "", required = false) String title,
			@RequestParam(value = "content", defaultValue = "", required = false) String content,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Paging bocInfos = service.startanaysis(type,title, content);
		return bocInfos;
	}
	/**
	 * 加载dic
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/loaddic", method = RequestMethod.POST)
	public int loadDIC(
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		return service.loadDIC();
	}
	/**
	 * 加载oec
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/loadOEC", method = RequestMethod.POST)
	public int loadOEC(
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		return service.loadOEC();
	}
	/**
	 * 注册用户功能
	 * @param company_short
	 * @param company_all
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/zhuce", method = RequestMethod.POST)
	public int zhuce(
			@RequestParam(value = "username", defaultValue = "", required = false) String username,
			@RequestParam(value = "password", defaultValue = "", required = false) String password,
			@RequestParam(value = "tele", defaultValue = "", required = false) String tele,
			@RequestParam(value = "address", defaultValue = "", required = false) String address,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int messge = service.zhuce(username, password,tele,address);
		return messge;
	}
	
	/**
	 * 鍏徃鍚嶇О寤烘ā 鎻掑叆绠�绉� 鍏ㄧО
	 * @param company_short
	 * @param company_all
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/insertcompany", method = RequestMethod.POST)
	public int insertcompany(
			@RequestParam(value = "company_short", defaultValue = "", required = false) String company_short,
			@RequestParam(value = "company_all", defaultValue = "", required = false) String company_all,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int messge = service.insertcompany(company_short, company_all);
		return messge;
	}
	/**
	 * 公司名称建模修改操作
	 * @param shortName
	 * @param fullName
	 * @param validFlg
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/udpatecompany", method = RequestMethod.POST)
	public int insertcompany(
			@RequestParam(value = "id", defaultValue = "", required = false) int id,
			@RequestParam(value = "shortName", defaultValue = "", required = false) String shortName,
			@RequestParam(value = "fullName", defaultValue = "", required = false) String fullName,
			@RequestParam(value = "validFlg", defaultValue = "", required = false) int validFlg,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int messge = service.udpatecompany(id,shortName, fullName,validFlg);
		return messge;
	}
	@ResponseBody
	@RequestMapping(value = "/removecompany", method = RequestMethod.POST)
	public int insertcompany(
			@RequestParam(value = "id", defaultValue = "", required = false) int id,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int messge = service.remove(id);
		return messge;
	}
	/**
	 * 鎼滅储鍏徃鍚嶇О   榛樿鏌ヨ鍏ㄩ儴
	 * @param page
	 * @param rows
	 * @param searchCompany
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/searchCompany", method = RequestMethod.POST)
	public Paging searchCompany(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "rows", defaultValue = "10", required = false) int rows,
			@RequestParam(value = "searchCompany", defaultValue = "", required = false) String searchCompany,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Paging message = service.searchCompany(page, rows, searchCompany);
		return message;
	}

	/**
	 * 楂樼浜哄悕鎻愪氦
	 * @param managerContent
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/insertword", method = RequestMethod.POST)
	public int insertword(
			@RequestParam(value = "managerContent", defaultValue = "", required = false) String managerContent,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int message = service.insertword(managerContent);
		return message;
	}
	/**
	 * 更改管理人员
	 * @param managerContent
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/udpatemanager", method = RequestMethod.POST)
	public int updatemanager(
			@RequestParam(value = "id", defaultValue = "", required = false) int id,
			@RequestParam(value = "name", defaultValue = "", required = false) String name,
			@RequestParam(value = "validFlg", defaultValue = "", required = false) int validFlg,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int message = service.updatemanager(id,name,validFlg);
		return message;
	}
	/**
	 * 删除管理人员
	 * @param managerContent
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/removemanager", method = RequestMethod.POST)
	public int removemanager(
			@RequestParam(value = "id", defaultValue = "", required = false) int id,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int message = service.removemanager(id);
		return message;
	}
	/**
	 * 鍏崇郴璇嶅缓妯℃彁浜�
	 * @param managerContent
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/insertRelate", method = RequestMethod.POST)
	public int insertRelate(
			@RequestParam(value = "relateContent", defaultValue = "", required = false) String relateContent,
			@RequestParam(value = "convertContent", defaultValue = "", required = false) String convertContent,
			@RequestParam(value = "relateType", defaultValue = "", required = false) String relation_nation,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int message = service.insertRelate(relateContent,convertContent,relation_nation);
		return message;
	}

	/**
	 * 鍋滅敤璇嶆彁浜�
	 * @param managerContent
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/insertStop", method = RequestMethod.POST)
	public int insertStop(
			@RequestParam(value = "stopContent", defaultValue = "", required = false) String stopContent,
			@RequestParam(value = "stopType", defaultValue = "1", required = false) String stopType,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int message = service.insertStop(stopContent,stopType);
		return message;
	}

	/**
	 * 鎼滅储绠＄悊浜哄悕
	 * @param page
	 * @param rows
	 * @param searchCompany
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/search_M", method = RequestMethod.POST)
	public Paging search_M(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "rows", defaultValue = "10", required = false) int rows,
			@RequestParam(value = "search_one_M", defaultValue = "", required = false) String searchCompany,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Paging message = service.search_M(page, rows, searchCompany);
		return message;
	}
	
	/**
	 * 鎼滅储鍏崇郴璇�
	 * @param page
	 * @param rows
	 * @param searchCompany
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/search_R", method = RequestMethod.POST)
	public Paging search_R(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "pageSize", defaultValue = "10", required = false) int rows,
			@RequestParam(value = "search_one_R", defaultValue = "", required = false) String searchCompany,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Paging message = service.search_R(page, rows, searchCompany);
		return message;
	}
	@ResponseBody
	@RequestMapping(value = "/removerelate", method = RequestMethod.POST)
	public int removerelate(
			@RequestParam(value = "id", defaultValue = "", required = false) int id,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int message = service.removerelate(id);
		return message;
	}
	@ResponseBody
	@RequestMapping(value = "/udpaterelate", method = RequestMethod.POST)
	public int updaterelate(
			@RequestParam(value = "id", defaultValue = "", required = false) int id,
			@RequestParam(value = "realWord", defaultValue = "", required = false) String realWord,
			@RequestParam(value = "convertWord", defaultValue = "", required = false) String convertWord,
			@RequestParam(value = "wordNature", defaultValue = "", required = false) String wordNature,
			@RequestParam(value = "validFlg", defaultValue = "1", required = false) int validFlg,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int message = service.updaterelate(id,realWord,convertWord,wordNature,validFlg);
		return message;
	}
	/**
	 * 鎼滅储鍋滅敤璇�
	 * @param page
	 * @param rows
	 * @param searchCompany
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "/search_T", method = RequestMethod.POST)
	public Paging search_T(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "pageSize", defaultValue = "10", required = false) int rows,
			@RequestParam(value = "search_one_T", defaultValue = "", required = false) String searchCompany,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Paging message = service.search_T(page, rows, searchCompany);
		return message;
	}
	@ResponseBody
	@RequestMapping(value = "/udpatestop", method = RequestMethod.POST)
	public int udpatestop(
			@RequestParam(value = "id", defaultValue = "", required = false) int id,
			@RequestParam(value = "word", defaultValue = "", required = false) String word,
			@RequestParam(value = "wordType", defaultValue = "", required = false) String wordType,
			@RequestParam(value = "validFlg", defaultValue = "1", required = false) int validFlg,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int message = service.udpatestop(id,word,wordType,validFlg);
		return message;
	}
	@ResponseBody
	@RequestMapping(value = "/removestop", method = RequestMethod.POST)
	public int removestop(
			@RequestParam(value = "id", defaultValue = "", required = false) int id,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int message = service.removestop(id);
		return message;
	}
	/**
	 * 涓婁紶excel鎺ユ敹
	 * @param page
	 * @param rows
	 * @param searchCompany
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@ResponseBody
	@RequestMapping(value = "uploadToRelation", produces = "text/plain;charset=UTF-8")
	public String uploadToRelation(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, HttpServletResponse response,String selectTypeId, HttpSession session)
					throws IOException {
		response.setHeader("Cache-Control", "no-cache");
		if(file==null){
			return "-1";
		}
		System.out.println(selectTypeId);
		InputStream input = file.getInputStream();
		String fileName = file.getOriginalFilename();
		int num=0;
		if (fileName.endsWith(".xls") || fileName.endsWith(".xlsx")) {
			List<List<String[]>> excelResult = ExcelParseReaderUtils.readXlsAndXlsx(fileName, input);
			if (excelResult != null && excelResult.size() != 0) {
				for(List<String[]> sheet:excelResult){
					for(String[] line:sheet){
							switch(Integer.parseInt(selectTypeId)){
							case 1:
								if(!line[0].equals("")&&!line[1].equals("")){
								 num+=service.insertcompany(line[1], line[0]);
								}
								break;
							case 2:
								if(!line[0].equals("")){
									num+=service.insertword(line[0]);
								}
								break;
							case 3:
								if(!line[0].equals("")&&!line[1].equals("")){
									num+=service.insertRelate(line[0],line[1],line[2]);
								}
								break;
							case 4:
								if(!line[0].equals("")&&line[1].equals("")){
									num+=service.insertStop(line[0],line[1]);
								}
								break;
							}
						}
					}
				}
			
		} else {
			return "-3";
		}
		return num+"";
	}
}
