package cn.edu.ahut.vo;


/**
 * 回帖VO
 * @author UML小组
 *
 */
public class ReplyVO extends BasePostVO{
	private static final long serialVersionUID = 1209557448551796366L;

	/**
	 * 主键ID
	 */
	private int id;
	
	/**
	 * 主题帖ID
	 */
	private int tid;
	
	/**
	 * 主题帖ID字符串
	 */
	private String tidStr;
	
	/**
	 * 父亲ID
	 */
	private int parentId;
	
	/**
	 * 父亲ID字符串
	 */
	private String parentIdStr;
	
	/**
	 * 取得主题帖ID
	 * @return
	 */
	public int getTid() {
		return tid;
	}

	/**
	 * 设置主题帖ID
	 * @param tid
	 */
	public void setTid(int tid) {
		this.tid = tid;
	}

	/**
	 * 取得主题帖ID字符串
	 * @return
	 */
	public String getTidStr() {
		return tidStr;
	}

	/**
	 * 设置主题帖ID字符串
	 * @param tidStr
	 */
	public void setTidStr(String tidStr) {
		this.tidStr = tidStr;
	}

	/**
	 * 取得父亲ID
	 * @return
	 */
	public int getParentId() {
		return parentId;
	}

	/**
	 * 设置父亲ID
	 * @param parentId
	 */
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	/**
	 * 取得父亲ID字符串
	 * @return
	 */
	public String getParentIdStr() {
		return parentIdStr;
	}

	/**
	 * 设置父亲ID字符串
	 * @param parentIdStr
	 */
	public void setParentIdStr(String parentIdStr) {
		this.parentIdStr = parentIdStr;
	}
	
	/**
	 * 取得主键ID
	 * @return
	 */
	public int getId() {
		return id;
	}

	/**
	 * 设置主键ID
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}


}
