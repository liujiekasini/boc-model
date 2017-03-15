package com.oec.demo.service.impl;



import java.util.ArrayList;
import java.util.List;

import org.ansj.splitWord.analysis.ToAnalysis;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oec.boc.daemon.analysis.BocAnalysis;
import com.oec.boc.daemon.analysis.WordResourceService;
import com.oec.boc.daemon.analysis.bean.BocParseInfo;
import com.oec.boc.daemon.analysis.impl.BocAnalysisImpl;
import com.oec.boc.daemon.analysis.impl.WordResourceServiceImpl;
import com.oec.boc.daemon.bean.OntologyInfo;
import com.oec.boc.daemon.controller.BocDaemonController;
import com.oec.demo.dao.AnaysisDao;
import com.oec.demo.service.AnaysisService;
import com.oec.model.Paging;
import com.oec.utils.ReadPropertity;

@Service
public class AnaysisServiceImpl implements AnaysisService {
	Logger log=Logger.getLogger(this.getClass());
	@Autowired
	private AnaysisDao anaysisDao;

	public boolean companyNameYZ(String getshortname, String getlongname) {
		return anaysisDao.companyNameYZ(getshortname, getlongname);
	}

	public int insertcompany(String getshortname, String getlongname) {
		return anaysisDao.insertcompany(getshortname, getlongname);
	}

	public boolean errorwordYZ(String geterrorword) {
		return anaysisDao.errorwordYZ(geterrorword);
	}

	public int insertword(String managerContent) {
		return anaysisDao.insertword(managerContent);
	}

	public Paging searchCompany(int page, int rows, String searchCompany) {
		return anaysisDao.searchCompany(page, rows, searchCompany);
	}

	public Paging searchCompany1(int page, int rows, String searchCompany) {
		return anaysisDao.searchCompany1(page, rows, searchCompany);
	}
	public Paging startanaysis(String type,String title, String content) {
//			try {
//				InputStream is = anaysisDao.getAmbiguityDic();
//				if(is!=null){
//					Forest forest = Library.makeForest(is);
//					log.info("使用自定义词典");
//				}else{
//					Forest forest = UserDefineLibrary.ambiguityForest;
//					log.info("使用默认歧义词典");
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//				log.info("数据库加载词典失败");
//			}
			Paging page = new Paging();
			BocDaemonController controller = new BocDaemonController();
			switch(Integer.parseInt(type)){
			case 1:{
				BocAnalysis analysis = new BocAnalysisImpl();
				String projectCode = ReadPropertity.getProperty("oec.project");
				String rootOntoId = ReadPropertity.getProperty("oec.ontoId");
				int ontoLevel = -1;
				List<String> usefulOntoIds = new ArrayList<String>();
				String dataMiningType = "beta";
				List<OntologyInfo> bocInfos = analysis.analysisOntologyInfos(projectCode, dataMiningType, rootOntoId, ontoLevel,
						usefulOntoIds, content);
//				OecDaemonUtils.closeConnection();
				page.setRows(bocInfos);
				page.setTotal(bocInfos.size());
			}break;
			case 2:{
				
				BocAnalysis analysis = new BocAnalysisImpl();
				String projectCode = ReadPropertity.getProperty("oec.project");
				String rootOntoId = ReadPropertity.getProperty("oec.ontoId");
				int ontoLevel = -1;
				List<String> usefulOntoIds = new ArrayList<String>();
				String keywords="";
				String dataMiningType = "beta";
				List<BocParseInfo> bocInfos = analysis.analysisBocParseInfos(projectCode, dataMiningType, rootOntoId, ontoLevel,
						usefulOntoIds, title, keywords, content);
//				OecDaemonUtils.closeConnection();
				page.setRows(bocInfos);
				page.setTotal(bocInfos.size());
			};break;
			case 3:break;
			}
			return page;
	}
	public int insertRelate(String relateContent,String convertContent,String relation_nation) {
		return anaysisDao.insertRelate(relateContent,convertContent,relation_nation);
	}

	public int insertStop(String stopContent,String stopType) {
		return anaysisDao.insertStop(stopContent,stopType);
	}

	public Paging search_M(int page, int rows, String searchCompany) {
		return anaysisDao.search_M(page,rows,searchCompany);
	}

	public Paging search_R(int page, int rows, String searchCompany) {
		return anaysisDao.search_R(page,rows,searchCompany);
	}
	public Paging search_T(int page, int rows, String searchCompany) {
		return anaysisDao.search_T(page,rows,searchCompany);
	}

	public int zhuce(String username, String password, String tele, String address) {
		return anaysisDao.zhuce(username,password,tele,address);
	}

	public int loadDIC() {
		BocDaemonController controller = new BocDaemonController();
		//复制自定义词典公司
	   WordResourceService  wordr=new WordResourceServiceImpl();
	   //加载公司词汇
	   wordr.reloadRecCompanyNames();
	   //加载人名词汇
	   wordr.reloadRecPersonNames();
	   //加载停用词
	   wordr.reloadRecStopWords();
	   //加载关系词汇
	   wordr.reloadRecRelationWords();
	   	//加载所有词汇
	   wordr.reloadRecRelationWords();
	   ToAnalysis.parse("");
		return 1;
	}

	public int loadOEC() {
		BocDaemonController controller = new BocDaemonController();
		String projectCode = ReadPropertity.getProperty("oec.project");
		String dataMiningType = "beta";
		/**
		 * oec模型资源
		 */
		boolean flg = controller.loadModelResource(projectCode, dataMiningType);
		System.out.println("加载模型："+flg);
		return flg==true?1:0;
	}

	public int udpatecompany(int id, String shortName, String fullName, int validFlg) {
		return anaysisDao.udpatecompany(id,shortName,fullName,validFlg);
	}

	public int remove(int id) {
		return anaysisDao.remove(id);
	}

	public int updatemanager(int id, String name, int validFlg) {
		return anaysisDao.updatemanager(id,name,validFlg);
	}

	public int removemanager(int id) {
		return anaysisDao.remonvemanager(id);
	}

	public int removerelate(int id) {
		return anaysisDao.removerelate(id);
	}

	public int updaterelate(int id, String realWord, String convertWord, String wordNature, int validFlg) {
		return anaysisDao.updaterelate(id,realWord,convertWord,wordNature,validFlg);
	}

	public int udpatestop(int id, String word, String wordType, int validFlg) {
		return anaysisDao.updatestop(id,word,wordType,validFlg);
	}

	public int removestop(int id) {
		return anaysisDao.removestop(id);
	}

}
