package com.oracle.web.bean;

import java.io.IOException;
import java.net.URLEncoder;
import sun.misc.BASE64Encoder;
public class FileUtils {
  
	 /**
	 * 下载文件时，针对不同浏览器，进行附件名的编码
	 * 
	10 * @param filename
	11 * 下载文件名
	12 * @param agent
	13 * 客户端浏览器
	14 * @return 编码后的下载附件名 
	15 * @throws IOException
	16 */
	 public static String encodeDownloadFilename(String filename, String agent)
   throws IOException {
	 if (agent.contains("Firefox")) { // 火狐浏览器
	 filename = "=?UTF-8?B?" + new BASE64Encoder().encode(filename.getBytes("utf-8"))
	 + "?=";
	 filename = filename.replaceAll("\r\n", "");
	 } else { // IE及其他浏览器
	 filename = URLEncoder.encode(filename, "utf-8");
	 filename = filename.replace("+"," ");
	 }
	 return filename;
	}
	 
}
