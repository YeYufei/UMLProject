package cn.edu.ahut.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 日期工具类
 * @author UML小组
 *
 */
public class DateUtil {
    public static final String DATE_FORMAT_YYYYMMDD = "yyyy-MM-dd";
    public static final String DATE_FORMAT_TIME_R = "yyyy-MM-dd HH:mm";
    public static final String DATE_FORMAT_TIME_T = "yyyy-MM-dd HH:mm:ss";
	public static final String DB_TIME_PATTERN = "yyyyMMddHHmmss";
    private static final int INT_YEAR = 999;
    private static Map<Integer, Long> periods = null;
    
    /**
     * 格式化日期格式
     * @param argDate
     * @param argFormat
     * @return 格式化后的日期字符串
     */
    public static String formatDate(Date argDate, String argFormat) {
        if (argDate == null) {
            return "";
        }

        SimpleDateFormat sdfFrom = null;
        String strResult = null;

        try {
            sdfFrom = new SimpleDateFormat(argFormat);
            strResult = sdfFrom.format(argDate).toString();
        } catch (Exception e) {
            strResult = "";
        } finally {
            sdfFrom = null;
        }
        
        return strResult;
    }


    /**
     * 把字符串格式化成日期
     * @param argDateStr
     * @return 格式化的日期
     */
    public static Date formatStringToDate(String argDateStr) {
        return formatStringToDate(argDateStr, null);
    }
    
    /**
     * 把字符串格式化成日期
     * @param argDateStr
     * @param argFormat
     * @return
     */
    public static Date formatStringToDate(String argDateStr, String argFormat) {
        if (argDateStr == null ||argDateStr.trim().length() < 1) {
            return null;
        }
        
        SimpleDateFormat sdfFormat = null;
        Date result = null;
        
        try {
            String strFormat = argFormat;
            if (StringUtil.isNullOrEmpty(strFormat)) {
                strFormat = DATE_FORMAT_YYYYMMDD;
                if (argDateStr.length() > 16) {
                    strFormat = DATE_FORMAT_TIME_T;
                } else if (argDateStr.length() > 10) {
                    strFormat = DATE_FORMAT_TIME_R;
                }
            }
            sdfFormat = new SimpleDateFormat(strFormat);
            result = sdfFormat.parse(argDateStr);
        } catch (Exception e) {
            result = null;
        } finally {
            sdfFormat = null;
        }
        
        return result;
    }

    /**
     * 根据特定的日期返回当天的星期数
     * @param date
     * @return
     */
    public  static String getDayOfWeek(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		String dayOfWeek = "";
		int weekday = c.get(Calendar.DAY_OF_WEEK);
		switch (weekday) {
			case 1:
	             dayOfWeek = "星期日";
	             break;
            case 2:            
                dayOfWeek = "星期一";
                break;
            case 3:
                dayOfWeek = "星期二";
                break;
            case 4:
                dayOfWeek = "星期三";
                break;
            case 5:
                dayOfWeek = "星期四";
                break;
            case 6:
                dayOfWeek = "星期五";
                break;
            case 7:
                dayOfWeek = "星期六";
                break;
        }
        return dayOfWeek;
    }
    
    /**
     * 比较两个日期的大小
     * @param argDate1
     * @param argDate2
     * @param argFormat
     * @return 
     */
    public static int compare(Date argDate1, Date argDate2, String argFormat) {
    	if (argDate1 == null && argDate2 == null) {
    		return 0;
    	}
    	if (argDate1 == null) {
    		return -1;
    	}
    	if (argDate2 == null) {
    		return 1;
    	}
    	
    	String strDate1 = formatDate(argDate1, argFormat);
    	String strDate2 = formatDate(argDate2, argFormat);
    	
    	return strDate1.compareTo(strDate2);
    } 

    /**
     * 返回参数月的天数
     * @param argMonth
     * @return
     */
    public static long getMonthPeriod(int argMonth) {
    	initPeriod();
    	return periods.get(argMonth);
    }
    
	private static void initPeriod() {
		Calendar cal = Calendar.getInstance();
		if (periods != null && periods.get(INT_YEAR).equals(cal.get(Calendar.YEAR))) {
			return;
		}
		periods = new HashMap<Integer, Long>();
		// now year
		periods.put(INT_YEAR, Long.valueOf(cal.get(Calendar.YEAR)));
		
		Calendar calNext = Calendar.getInstance();
		
		// JANUARY
		cal.set(Calendar.MONTH, Calendar.JANUARY);
		// FEBRUARY
		calNext.set(Calendar.MONTH, Calendar.FEBRUARY);
		long lngDay = calNext.getTimeInMillis() - cal.getTimeInMillis();
		// MONTH: JANUARY
		periods.put(Calendar.JANUARY, lngDay);
		
		// MARCH
		cal.set(Calendar.MONTH, Calendar.MARCH);
		lngDay = cal.getTimeInMillis() - calNext.getTimeInMillis();
		// MONTH: FEBRUARY
		periods.put(Calendar.FEBRUARY, lngDay);
		
		// APRIL
		calNext.set(Calendar.MONTH, Calendar.APRIL);
		lngDay = calNext.getTimeInMillis() - cal.getTimeInMillis();
		// MONTH: MARCH
		periods.put(Calendar.MARCH, lngDay);
		
		// MAY
		cal.set(Calendar.MONTH, Calendar.MAY);
		lngDay = cal.getTimeInMillis() - calNext.getTimeInMillis();
		// MONTH: APRIL
		periods.put(Calendar.APRIL, lngDay);
		
		// JUNE
		calNext.set(Calendar.MONTH, Calendar.JUNE);
		lngDay = calNext.getTimeInMillis() - cal.getTimeInMillis();
		// MONTH: MAY
		periods.put(Calendar.MAY, lngDay);
		
		// JULY
		cal.set(Calendar.MONTH, Calendar.JULY);
		lngDay = cal.getTimeInMillis() - calNext.getTimeInMillis();
		// MONTH: JUNE
		periods.put(Calendar.JUNE, lngDay);
		
		// AUGUST
		calNext.set(Calendar.MONTH, Calendar.AUGUST);
		lngDay = calNext.getTimeInMillis() - cal.getTimeInMillis();
		// MONTH: JULY
		periods.put(Calendar.JULY, lngDay);
		
		// SEPTEMBER
		cal.set(Calendar.MONTH, Calendar.SEPTEMBER);
		lngDay = cal.getTimeInMillis() - calNext.getTimeInMillis();
		// MONTH: AUGUST
		periods.put(Calendar.AUGUST, lngDay);
		
		// OCTOBER
		calNext.set(Calendar.MONTH, Calendar.OCTOBER);
		lngDay = calNext.getTimeInMillis() - cal.getTimeInMillis();
		// MONTH: SEPTEMBER
		periods.put(Calendar.SEPTEMBER, lngDay);
		
		// NOVEMBER
		cal.set(Calendar.MONTH, Calendar.NOVEMBER);
		lngDay = cal.getTimeInMillis() - calNext.getTimeInMillis();
		// MONTH: OCTOBER
		periods.put(Calendar.OCTOBER, lngDay);
		
		// DECEMBER
		calNext.set(Calendar.MONTH, Calendar.DECEMBER);
		lngDay = calNext.getTimeInMillis() - cal.getTimeInMillis();
		// MONTH: NOVEMBER
		periods.put(Calendar.NOVEMBER, lngDay);
		
		// next year JANUARY
		cal.set(Calendar.MONTH, Calendar.JANUARY);
		cal.add(Calendar.YEAR, 1);
		lngDay = cal.getTimeInMillis() - calNext.getTimeInMillis();
		// MONTH: NOVEMBER
		periods.put(Calendar.NOVEMBER, lngDay);
	}
	
}
