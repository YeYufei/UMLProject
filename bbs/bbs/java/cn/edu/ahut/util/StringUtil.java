package cn.edu.ahut.util;

import java.sql.Timestamp;

/**
 * 字符串工具类
 * @author UML小组
 *
 */

public class StringUtil {
	
	/**
	 *如果参数字符串为NULL，返回""，否则返回参数本身
	 * @param sIn
	 * @return
	 */
	public static String nvl(String sIn) {
		return (sIn == null) ? "" : sIn;
	}

	public static final int DIRECT_LEFT = 0;
	public static final int DIRECT_RIGHT = 1;

	/**
	 * 判断字符串是否为null或者为空字符串
	 * @param argCharSeq
	 * @return 是：true 否：false
	 */
	public static boolean isNullOrEmpty(CharSequence argCharSeq) {

		if ((argCharSeq == null) || (argCharSeq.toString().trim().length() < 1)) {
			return true;
		}

		return false;
	}

	/**
	 * 判断日期是否为null或者为空
	 * @param timestamp
	 * @return
	 */
	public static boolean isNullOrEmpty(Timestamp timestamp) {

		if ((timestamp == null) || (timestamp.toString().trim().length() < 1)) {
			return true;
		}

		return false;
	}

	/**
	 * 判断两字符串是不是相同
	 * @param argStr1
	 * @param argStr2
	 * @return
	 */
	public static boolean equalsString(String argStr1, String argStr2) {

		if ((argStr1 == null) && (argStr2 == null)) {
			return true;
		}
		if ((argStr1 == null) || (argStr2 == null)) {
			return false;
		}
		return argStr1.equals(argStr2);
	}

	/**
	 * 把字符串的首字母转换成小写
	 * @param argString
	 * @return
	 */
	public static String getFirstLowerCase(String argString) {

		if (isNullOrEmpty(argString)) {
			return "";
		}
		if (argString.length() < 2) {
			return argString.toLowerCase();
		}

		char ch = argString.charAt(0);
		ch = Character.toLowerCase(ch);

		return ch + argString.substring(1);
	}

	/**
	 * 把字符串的第一个字母转换成大写
	 * @param argString
	 * @return
	 */
	public static String getFirstUpperCase(String argString) {

		if (isNullOrEmpty(argString)) {
			return "";
		}
		if (argString.length() < 2) {
			return argString.toUpperCase();
		}

		char ch = argString.charAt(0);
		ch = Character.toUpperCase(ch);

		return ch + argString.substring(1);
	}

	/**
	 * 换行
	 * @param argSbf
	 */
	public static void appendLine(StringBuffer argSbf) {
		argSbf.append(System.getProperty("line.separator"));
	}

	/**
	 * 格式化字符串成参数指定的格式
	 * @param src
	 * @param argParams
	 * @return
	 */
	public static String formatMsg(String src, Object... argParams) {
		return String.format(src, argParams);
	}

	/**
	 * 得到字符串的长度
	 * @param src
	 * @param strChar
	 * @return
	 */
	public static int getCount(String src, String strChar) {
		int result = 0;

		int beginIndex = 0;
		int endIndex = src.indexOf(strChar, beginIndex);

		while (endIndex >= 0) {
			result++;
			beginIndex = endIndex + strChar.length();
			endIndex = src.indexOf(strChar, beginIndex);
		}

		return result;
	}
	
	/**
	 * 替换字符串
	 * @param src
	 * @param sFnd
	 * @param sRep
	 * @return
	 */
	public static String replaceStr(String src, String sFnd, String sRep) {
		if (src == null || "".equals(nvl(sFnd))) {
			return src;
		}

		String sTemp = "";
		int endIndex = 0;
		int beginIndex = 0;
		do {
			endIndex = src.indexOf(sFnd, beginIndex);
			if (endIndex >= 0) { // mean found it.
				sTemp = sTemp + src.substring(beginIndex, endIndex) + nvl(sRep);
				beginIndex = endIndex + sFnd.length();
			} else if (beginIndex >= 0) {
				sTemp = sTemp + src.substring(beginIndex);
				break;
			}
		} while (endIndex >= 0);

		return sTemp;
	}

	/**
	 * 比较两个字符串
	 * @param argStr1
	 * @param argStr2
	 * @return
	 */
	public static int compare(String argStr1, String argStr2) {
		if (argStr1 == null && argStr2 == null) {
			return 0;
		}
		if (argStr1 == null) {
			return -1;
		}
		if (argStr2 == null) {
			return 1;
		}

		return argStr1.compareTo(argStr2);
	}
	
	/**
	 * 
	 * @param strIn
	 * @param len
	 * @param direct
	 * @return
	 */
	public static String paddingSpaceForChar(String strIn, int len, int direct) {
		if (strIn == null) {
			return null;
		}
		int strInLen = getStrLength(strIn);
		if (strInLen == len) {
            return strIn;

        } else if (strInLen > len) {
            return chopStr(strIn, len);

        } else {
            StringBuffer sb = new StringBuffer((strIn == null ? "" : strIn));
            for (int i = 0; i < (len - strInLen); i++) {
                sb.append(" ");
            }
            return sb.toString();
        }
	}
	
	public static boolean isHalf(char c) {
		if (!(('\uFF61' <= c) && (c <= '\uFF9F'))
				&& !(('\u0020' <= c) && (c <= '\u007E'))) {
			return false;
		} else
			return true;
	}
	
	/**
	 * 返回字符串长度
	 * @param s
	 * @return
	 */
	public static int getStrLength(String s) {
		if (s == null) {
			return 0;
		}

		int len = 0;
		for (int i = 0; i < s.length(); i++) {
			if (isHalf(s.charAt(i))) {
				len += 1;
			} else {
				len += 2;
			}
		}
		return len;
	}
	
	
	public static String chopStr(String s, int byteLen) {
		if (byteLen < 0) {
			return "";
		}
		if (s == null) {
			return null;
		}

		int len = 0;
		for (int i = 0; i < s.length(); i++) {
			if (isHalf(s.charAt(i))) {
				len += 1;
			} else {
				len += 2;
			}
			if (len > byteLen) {
				return s.substring(0, i);
			}
		}
		return s;
	}
}
