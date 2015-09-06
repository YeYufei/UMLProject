package cn.edu.ahut.util.exception;

public class BizException extends RuntimeException {

	private static final long serialVersionUID = 4338152847544945197L;
	
    /**
     * 构造函数
     * @param msg 信息ID
     */
	public BizException(String msg, Object...params) {
		
		super(msg);
	}
	
//   public BizException(String msg,String type, Object...params) {
//		
//		super(msg);
//	}
}
