package com.oec.utils;

import java.util.UUID;

/**
 * 编号工具类
 * 
 * @author huojinchao
 * @version 2015年3月19日 上午11:46:20
 */
public class OecCodeUtils {
	public static String[] chars = new String[] { "a", "b", "c", "d", "e", "f",
			"g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
			"t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5",
			"6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I",
			"J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
			"W", "X", "Y", "Z" };
	/**
	 * 返回32位uuid
	 * @return
	 */
	public static String getLongUuid() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	/**
	 * 返回8位uuid，主要用于本体，要素，概念分类的主键定义
	 * @return
	 */
	public static String getShortUuid() {
		StringBuffer shortBuffer = new StringBuffer();
		String uuid = UUID.randomUUID().toString().replace("-", "");
		for (int i = 0; i < 8; i++) {
			String str = uuid.substring(i * 4, i * 4 + 4);
			int x = Integer.parseInt(str, 16);
			shortBuffer.append(chars[x % 0x3E]);
		}
		return shortBuffer.toString();
	}

	public static void main(String[] args) {
		System.out.println("长32位uuid："+OecCodeUtils.getLongUuid());
		System.out.println("短8位uuid:"+OecCodeUtils.getShortUuid());
	}
}
