package com.jrtcms.web.util;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

public class Encoder {

	/**
	 * 字符串转码
	 * @param baseString 基础字符串
	 * @return 以error_code为key的返回码，以result为key的
	 */
	public static Map<String, Object> isoToUtf8(String baseString) {
		Map<String, Object> respJson = new HashMap<String, Object>();
		respJson.put("error_code", FinalVar.JSON_SUCCESS);
		try {
			baseString = new String(baseString.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			respJson.put("error_code", FinalVar.JSON_ERROR);
			return respJson;
		}
		respJson.put("result", baseString);
		return respJson;
	}
}
