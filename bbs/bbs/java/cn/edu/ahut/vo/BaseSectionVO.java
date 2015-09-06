package cn.edu.ahut.vo;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 板块基类
 * @author UML小组
 *
 */
public class BaseSectionVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 41802619039165430L;

	/**
	 * 板块ID	主键
	 */
	private int id;
	
	/**
	 * 板块名称
	 */
	private String name;
	
	/**
	 * 板块简介
	 */
	private String profile;
	
	/**
	 * 创建时间
	 */
	private Timestamp createtime;
	
	/**
	 * 创建时间字符串
	 */
	private String createtimeStr;
	
	/**
	 * 更新时间
	 */
	private Timestamp updatetime;
	
	/**
	 * 更新时间字符串
	 */
	private Timestamp updatetimeStr;
	
	/**
	 * 创建人
	 */
	private String createUser;

	/**
	 * 取得创建人
	 * @return
	 */
	public String getCreateUser() {
		return createUser;
	}

	/**
	 * 设置创建人
	 * @param createUser
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	/**
	 * 取得创建时间字符串
	 * @return
	 */
	public String getCreatetimeStr() {
		return createtimeStr;
	}

	/**
	 * 设置创建时间字符串
	 * @param createtimeStr
	 */
	public void setCreatetimeStr(String createtimeStr) {
		this.createtimeStr = createtimeStr;
	}

	/**
	 * 取得创建时间
	 * @return
	 */
	public Timestamp getCreatetime() {
		return createtime;
	}

	/**
	 * 设置创建时间
	 * @param createtime
	 */
	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	/**
	 * 取得ID
	 * @return
	 */
	public int getId() {
		return id;
	}

	/**
	 * 设置ID
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * 取得板块名称
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * 设置板块名称
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 取得板块简介
	 * @return
	 */
	public String getProfile() {
		return profile;
	}

	/**
	 * 设置板块简介
	 * @param profile
	 */
	public void setProfile(String profile) {
		this.profile = profile;
	}

	/**
	 * 取得更新时间
	 * @return
	 */
	public Timestamp getUpdatetime() {
		return updatetime;
	}

	/**
	 * 设置更新时间
	 * @param updatetime
	 */
	public void setUpdatetime(Timestamp updatetime) {
		this.updatetime = updatetime;
	}

	/**
	 * 取得更新时间字符串
	 * @return
	 */
	public Timestamp getUpdatetimeStr() {
		return updatetimeStr;
	}

	/**
	 * 设置更新时间字符串
	 * @param updatetimeStr
	 */
	public void setUpdatetimeStr(Timestamp updatetimeStr) {
		this.updatetimeStr = updatetimeStr;
	}
}
