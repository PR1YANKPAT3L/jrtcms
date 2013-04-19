package com.jrtcms.web.util;


public class StrUtil {
	public static boolean isNull(Object AObject) {
		return (AObject == null);
	}
	public static boolean isEmpty(String AStr) {
		if (StrUtil.isNull(AStr)) {
			return true;
		} else {
			return (AStr.equals(""));
		}
	}
	public static boolean isEmpty(String AStr, Boolean ACompriseNull) {
		if (ACompriseNull) {
			return isEmpty(AStr);
		} else {
			return (!StrUtil.isNull(AStr) && AStr.equals(""));
		}
	}
	public static boolean isEqual(String AFirstStr, String ASecondStr,
			Boolean AIgnoreCase) {
		if (StrUtil.isNull(AFirstStr)) {
			return StrUtil.isNull(ASecondStr);
		} else if (StrUtil.isNull(ASecondStr)) {
			return false;
		} else if (AIgnoreCase) {
			return AFirstStr.toLowerCase().equals(ASecondStr.toLowerCase());
		} else {
			return AFirstStr.equals(ASecondStr);
		}
	}
	public static boolean isEqual(String AFirstStr, String ASecondStr) {
		return isEqual(AFirstStr, ASecondStr, true);
	}
   

}
