package cn.edu.ahut.vo;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 帖子基类
 * @author UML小组
 *
 */
public class BasePostVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -200528175165693379L;

	/**
	 * 主键ID
	 */
	private int id;
	
	/**
	 * 主键ID字符串
	 */
	private String idStr;

	/**
	 * 用户ID
	 */
	private int uid;
	
	/**
	 * 用户ID字符串
	 */
	private String uidStr;
	
	/**
	 * 用户对象
	 */
	private UserVO userVO;
	
	/**
	 * 主题帖标题
	 */
	private String title;
	
	/**
	 * 主题帖内容
	 */
	private String content;
	
	/**
	 * 发布时间
	 */
	private Timestamp sendTime;
	
	/**
	 * 发布时间字符串
	 */
	private String sendTimeStr;
	
	/**
	 * 更新时间
	 */
	private Timestamp updateTime;
	
	/**
	 * 更新时间字符串
	 */
	private String updateTimeStr;
	
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

	/**
	 * 取得主键ID字符串
	 * @return
	 */
	public String getIdStr() {
		return idStr;
	}

	/**
	 * 设置主键ID字符串
	 * @param idStr
	 */
	public void setIdStr(String idStr) {
		this.idStr = idStr;
	}
	/**
	 * 取得帖子标题
	 * @return
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * 设置帖子标题
	 * @param title
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * 取得帖子内容
	 * @return
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 设置帖子内容
	 * @param content
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 取得发布时间
	 * @return
	 */
	public Timestamp getSendTime() {
		return sendTime;
	}

	/**
	 * 设置发布时间
	 * @param sendTime
	 */
	public void setSendTime(Timestamp sendTime) {
		this.sendTime = sendTime;
	}

	/**
	 * 取得发布时间字符串
	 * @return
	 */
	public String getSendTimeStr() {
		return sendTimeStr;
	}

	/**
	 * 设置发布时间字符串
	 * @param sendTimeStr
	 */
	public void setSendTimeStr(String sendTimeStr) {
		this.sendTimeStr = sendTimeStr;
	}
	/**
	 * 取得更新时间
	 * @return
	 */
	public Timestamp getUpdateTime() {
		return updateTime;
	}

	/**
	 * 设置更新时间
	 * @param updateTime
	 */
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * 取得更新时间字符串
	 * @return
	 */
	public String getUpdateTimeStr() {
		return updateTimeStr;
	}

	/**
	 * 设置更新时间字符串
	 * @param updateTimeStr
	 */
	public void setUpdateTimeStr(String updateTimeStr) {
		this.updateTimeStr = updateTimeStr;
	}
	
	/**
	 * 取得用户ID
	 * @return
	 */
	public int getUid() {
		return uid;
	}

	/**
	 * 设置用户ID
	 * @param uid
	 */
	public void setUid(int uid) {
		this.uid = uid;
	}

	/**
	 * 取得用户ID字符串
	 * @return
	 */
	public String getUidStr() {
		return uidStr;
	}

	/**
	 * 设置用户ID字符串
	 * @param uidStr
	 */
	public void setUidStr(String uidStr) {
		this.uidStr = uidStr;
	}
	
	/**
	 * 取得用户对象
	 * @return
	 */
	public UserVO getUserVO() {
		return userVO;
	}

	/**
	 * 设置用户对象
	 * @param userVO
	 */
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
}
