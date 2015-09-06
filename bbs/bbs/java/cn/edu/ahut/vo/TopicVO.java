package cn.edu.ahut.vo;

import java.sql.Timestamp;


/**
 * 主题帖VO
 * @author UML小组
 *
 */
public class TopicVO extends BasePostVO{
	
	private static final long serialVersionUID = -2849950070576130787L;

	/**
	 * 主键ID
	 */
	private int id;
	
	/**
	 * 外键版块ID
	 */
	private int sid;
	
	/**
	 * 所在版块名称
	 */
	private String sName;
	
	/**
	 * 外键版块ID字符串
	 */
	private String sidStr;
	
	/**
	 * 帖子状态
	 */
	private String topicStatus;
	
	/**
	 * 点击数
	 */
	private	int clickNum;
	/**
	 * 回复数
	 */
	private int replyNum;
	
	
	/**
	 * 最后的回复时间
	 */
	private Timestamp lastReplyTime;
	
	/**
	 * 最后回帖
	 */
	private ReplyVO lastReplyVO;
	
	/**
	 * 取得最后回帖
	 * @return
	 */
	public ReplyVO getLastReplyVO() {
		return lastReplyVO;
	}

	/**
	 * 设置最后回帖
	 * @param lastReplyVO
	 */
	public void setLastReplyVO(ReplyVO lastReplyVO) {
		this.lastReplyVO = lastReplyVO;
	}

	/**	
	 * 取得最后的回复时间
	 * @return
	 */
	public Timestamp getLastReplyTime() {
		return lastReplyTime;
	}

	/**
	 * 设置最后的回复时间
	 * @param lastReplyTime
	 */
	public void setLastReplyTime(Timestamp lastReplyTime) {
		this.lastReplyTime = lastReplyTime;
	}

	/**
	 * 取得点击数
	 * @return
	 */
	public int getClickNum() {
		return clickNum;
	}

	/**
	 * 设置点击数
	 * @param clickNum
	 */
	public void setClickNum(int clickNum) {
		this.clickNum = clickNum;
	}

	/**
	 * 取得回复数
	 * @return
	 */
	public int getReplyNum() {
		return replyNum;
	}

	/**
	 * 设置回复数
	 * @param replyNum
	 */
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	/**
	 * 取得板块ID
	 * @return
	 */
	public int getSid() {
		return sid;
	}

	/**
	 * 设置版块ID
	 * @param sid
	 */
	public void setSid(int sid) {
		this.sid = sid;
	}

	/**
	 * 取得板块ID字符串
	 * @return
	 */
	public String getSidStr() {
		return sidStr;
	}

	/**
	 * 设置版块ID字符串
	 * @param sidStr
	 */
	public void setSidStr(String sidStr) {
		this.sidStr = sidStr;
	}

	/**
	 * 取得所在版块名称
	 * @return
	 */
	public String getsName() {
		return sName;
	}

	/**
	 * 设置所在版块名称
	 * @param sName
	 */
	public void setsName(String sName) {
		this.sName = sName;
	}
	
	/**
	 * 取得帖子状态
	 * @return
	 */
	public String getTopicStatus() {
		return topicStatus;
	}
	/**
	 * 设置帖子状态
	 * @param status
	 */
	public void setTopicStatus(String topicStatus) {
		this.topicStatus = topicStatus;
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
