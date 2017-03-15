package com.oec.model;

public class RecRelationWord {
	private int id;
	private String realWord;
	private String convertWord;
	private String wordNature;
	private int validFlg;
	private String createTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRealWord() {
		return realWord;
	}
	public void setRealWord(String realWord) {
		this.realWord = realWord;
	}
	public String getConvertWord() {
		return convertWord;
	}
	public void setConvertWord(String convertWord) {
		this.convertWord = convertWord;
	}
	public String getWordNature() {
		return wordNature;
	}
	public void setWordNature(String wordNature) {
		this.wordNature = wordNature;
	}
	public int getValidFlg() {
		return validFlg;
	}
	public void setValidFlg(int validFlg) {
		this.validFlg = validFlg;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}
