package com.oec.model;

public class RecStopWord {

	private int id;
	private String word;
	private String wordType;
	private int validFlg;
	private String createTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getWordType() {
		return wordType;
	}
	public void setWordType(String wordType) {
		this.wordType = wordType;
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
