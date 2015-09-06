package cn.edu.ahut.vo;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 用户基本信息VO
 * @author UML小组
 *
 */
public class UserVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -301912649949179396L;

	/**
	 * 主键ID
	 */
	private int id;
	
	/**
	 * 主键字符串，模糊查询时用到
	 */
	private String idStr;

	/**
	 * 用户名
	 */
	private String username;
	
	/**
	 * 用户密码
	 */
	private String userpwd;
	
	/**
	 * 旧密码
	 */
	private String oldPassword;
	
	/**
	 * 邮箱
	 */
	private String email;
	
	/**
	 * 用户IP
	 */
	private String ip;
	
	/**
	 * 用户时间
	 */
	private Timestamp time;
	
	/**
	 * 用户详细信息
	 */
	private UserInfoVO userInfoVO;
	
	/**
	 * 用户角色
	 */
	private String sysrole;
	
	/**
	 * 用户状态
	 */
	private String status;
	
	/**
	 * 板块名称
	 */
	private String sectionName;
	
	/**
	 * 取得板块名称
	 * @return
	 */
	public String getSectionName() {
		return sectionName;
	}

	/**
	 * 设置板块名称
	 * @param sectionName
	 */
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	/**
	 * 取得用户角色
	 * @return
	 */
	public String getSysrole() {
		return sysrole;
	}

	/**
	 * 设置用户角色
	 * @param sysrole
	 */
	public void setSysrole(String sysrole) {
		this.sysrole = sysrole;
	}

	/**
	 * 取得用户状态
	 * @return
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * 设置用户状态
	 * @param status
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * 取得主键字符串
	 * @return
	 */
	public String getIdStr() {
		return idStr;
	}

	/**
	 * 设置主键字符串
	 * @param idStr
	 */
	public void setIdStr(String idStr) {
		this.idStr = idStr;
	}
	
	/**
	 * 取得用户名
	 * @return
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * 设置用户名
	 * @param username
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * 取得用户密码
	 * @return
	 */
	public String getUserpwd() {
		return userpwd;
	}

	/**
	 * 设置用户密码
	 * @param userpwd
	 */
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	
	/**
	 * 取得旧密码
	 * @return
	 */
	public String getOldPassword() {
		return oldPassword;
	}
	
	/**
	 * 设置旧密码
	 * @param oldPassword
	 */
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
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

	/**
	 * 取得邮箱email
	 * @return
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * 设置邮箱email
	 * @param email
	 */
	public void setEmail(String email) {
		this.email = email;
	}


	/**
	 * 取得IP
	 * @return
	 */
	public String getIp() {
		return ip;
	}

	/**
	 * 设置IP
	 * @param ip
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	/**
	 * 取得用户时间
	 * @return
	 */
	public Timestamp getTime() {
		return time;
	}

	/**
	 * 设置用户时间
	 * @param time
	 */
	public void setTime(Timestamp time) {
		this.time = time;
	}
	
	/**
	 * 取得用户详细信息
	 * @return
	 */
	public UserInfoVO getUserInfoVO() {
		return userInfoVO;
	}

	/**
	 * 设置用户详细信息
	 * @param userInfoVO
	 */
	public void setUserInfoVO(UserInfoVO userInfoVO) {
		this.userInfoVO = userInfoVO;
	}
}
