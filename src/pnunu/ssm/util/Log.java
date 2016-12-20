package pnunu.ssm.util;

import org.apache.log4j.Logger;

/** 
* @ClassName: Log 
* @Description: 日志打印
* @author Nunu
* @date 2016年12月10日 下午10:30:43  
*/
public class Log {

	static Logger log = Logger.getLogger(Log.class.getName());
	
    public static void logDebug(String message) {
			log.debug(message);
	}

	public static void logInfo(String message) {
			log.info(message);
	}
}
