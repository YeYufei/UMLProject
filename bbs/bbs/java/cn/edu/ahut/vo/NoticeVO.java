package cn.edu.ahut.vo;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 论坛公告
 * @author UML小组
 *
 */
public class NoticeVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8517082213160518653L;

	/**
	 * 主键ID
	 */
	private int id;
	
	/**
	 * 公告标题
	 */
	private String title;
	
	/**
	 * 公告内容
	 */
	private String content;
	
	/**
	 * 公告发布人
	 */
	private String publisher;
	
	/**
	 * 公告发布时间
	 */
	private Timestamp publishtime;
	
	/**
	 * 公告发布时间字符串
	 */
	private String publishtimeStr;

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
	 * 取得公告标题
	 * @return
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * 设置公告标题
	 * @param title
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * 取得公告内容
	 * @return
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 设置公告内容
	 * @param content
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 取得公告发布人
	 * @return
	 */
	public String getPublisher() {
		return publisher;
	}

	/**
	 * 设置公告发布人
	 * @param publisher
	 */
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	/**
	 * 取得公告发布时间
	 * @return
	 */
	public Timestamp getPublishtime() {
		return publishtime;
	}

	/**
	 * 设置公告发布时间
	 * @param publishtime
	 */
	public void setPublishtime(Timestamp publishtime) {
		this.publishtime = publishtime;
	}
	
	/**
	 * 取得公告发布时间字符串
	 * @return
	 */
	public String getPublishtimeStr() {
		return publishtimeStr;
	}

	/**
	 * 设置公告发布时间字符串
	 * @param publishtimeStr
	 */
	public void setPublishtimeStr(String publishtimeStr) {
		this.publishtimeStr = publishtimeStr;
	}

}
