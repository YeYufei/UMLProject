package cn.edu.ahut.vo;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 用户详细信息
 * @author UML小组
 *
 */
public class UserInfoVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 973733593616386137L;

	/**主键ID*/
	private int id;
	
	/**外键-关联用户基本信息表*/
	private int uid;
	
	/**性别*/
	private String sex;
	
	/**生日*/
	private String birthday;
	
	/**电话*/
	private String telephone;
	
	/**手机*/
	private String mobile;
	
	/**QQ号码*/
	private String qq;
	
	/**MSN地址*/
	private String msn;
	
	/**用户头像 */
	private String image;
	
	/**真实姓名*/
	private String realname;
	
	/**地址*/
	private String address;
	
	/**个人主页*/
	private String webSite;
	
	/**个性签名*/
	private String userSign;
	
	/**个人简介*/
	private String introduction;
	
	/**帖子签名*/
	private String postSign;
	
	/**系统级别*/
	private String sysLevel;
	
	/**
	 * 用户角色
	 */
	private String sysrole;
	
	/**用户头衔*/
	private String userTitle;
	
	/**个人积分*/
	private int scores;
	
	/**注册时间*/
	private Timestamp regTime;
	
	/**注册时间字符串*/
	private String regTimeStr;
	
	/**最近一次的登录时间*/
	private Timestamp loginTime;
	
	/**最近一次的登录时间字符串*/
	private String loginTimeStr;
	
	/**最近一次的登录IP*/
	private String loginIp;
	
	/**用户状态*/
	private String status;
	
	/** 在线时长 */
	private int onlineTime;
	
	/**
	 * 安全问题
	 */
	private String question;
	
	/**
	 * 安全问题答案
	 */
	private String answer;
	
	/**
	 * 默认构造方法
	 */
	public UserInfoVO() {
		super();
	}

	/**
	 * 构造方法
	 * @param uid
	 * @param sysLevel
	 * @param userTitle
	 * @param scores
	 * @param regTime
	 * @param loginTime
	 * @param loginIp
	 * @param status
	 * @param sysrole
	 */
	public UserInfoVO(int uid, String sysLevel, String userTitle, int scores,
			Timestamp regTime, Timestamp loginTime, String loginIp,
			String status,String sysrole) {
		super();
		this.uid = uid;
		this.sysLevel = sysLevel;
		this.userTitle = userTitle;
		this.scores = scores;
		this.regTime = regTime;
		this.loginTime = loginTime;
		this.loginIp = loginIp;
		this.status = status;
		this.sysrole = sysrole;
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
	 * 取得外键UID
	 * @return
	 */
	public int getUid() {
		return uid;
	}
	/**
	 * 设置外键UID
	 * @param uid
	 */
	public void setUid(int uid) {
		this.uid = uid;
	}
	/**
	 * 取得性别
	 * @return
	 */
	public String getSex() {
		return sex;
	}
	/**
	 * 设置性别
	 * @param sex
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}
	/**
	 * 取得生日
	 * @return
	 */
	public String getBirthday() {
		return birthday;
	}
	/**
	 * 设置生日
	 * @param birthday
	 */
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	/**
	 * 取得电话
	 * @return
	 */
	public String getTelephone() {
		return telephone;
	}
	/**
	 * 设置电话
	 * @param telephone
	 */
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	/**
	 * 取得手机
	 * @return
	 */
	public String getMobile() {
		return mobile;
	}
	/**
	 * 设置手机
	 * @param mobile
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	/**
	 * 取得QQ
	 * @return
	 */
	public String getQq() {
		return qq;
	}
	/**
	 * 设置QQ
	 * @param qq
	 */
	public void setQq(String qq) {
		this.qq = qq;
	}
	/**
	 * 取得MSN
	 * @return
	 */
	public String getMsn() {
		return msn;
	}
	/**
	 * 设置MSN
	 * @param msn
	 */
	public void setMsn(String msn) {
		this.msn = msn;
	}
	
	/**
	 * 取得用户头像
	 * @return
	 */
	public String getImage() {
		return image;
	}

	/**
	 * 设置用户头像
	 * @param image
	 */
	public void setImage(String image) {
		this.image = image;
	}
	
	/**
	 * 取得真实姓名
	 * @return
	 */
	public String getRealname() {
		return realname;
	}
	
	/**
	 * 设置真实姓名
	 * @param realname
	 */
	public void setRealname(String realname) {
		this.realname = realname;
	}
	/**
	 * 取得地址
	 * @return
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * 设置地址
	 * @param address
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * 取得个人主页
	 * @return
	 */
	public String getWebSite() {
		return webSite;
	}
	/**
	 * 设置个人主页
	 * @param webSite
	 */
	public void setWebSite(String webSite) {
		this.webSite = webSite;
	}
	/**
	 * 取得个性签名
	 * @return
	 */
	public String getUserSign() {
		return userSign;
	}
	/**
	 * 设置个性签名
	 * @param userSign
	 */
	public void setUserSign(String userSign) {
		this.userSign = userSign;
	}
	/**
	 * 取得个人简介
	 * @return
	 */
	public String getIntroduction() {
		return introduction;
	}
	/**
	 * 设置个人简介
	 * @param introduction
	 */
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	/**
	 * 取得帖子签名
	 * @return
	 */
	public String getPostSign() {
		return postSign;
	}
	/**
	 * 设置帖子签名
	 * @param postSign
	 */
	public void setPostSign(String postSign) {
		this.postSign = postSign;
	}
	
	/**
	 * 取得系统级别
	 * @return
	 */
	public String getSysLevel() {
		return sysLevel;
	}
	/**
	 * 设置系统级别
	 * @param sysLevel
	 */
	public void setSysLevel(String sysLevel) {
		this.sysLevel = sysLevel;
	}
	/**
	 * 取得用户头衔
	 * @return
	 */
	public String getUserTitle() {
		return userTitle;
	}
	/**
	 * 设置用户头衔
	 * @param userTitle
	 */
	public void setUserTitle(String userTitle) {
		this.userTitle = userTitle;
	}
	/**
	 * 取得个人积分
	 * @return
	 */
	public int getScores() {
		return scores;
	}
	/**
	 * 设置个人积分
	 * @param scores
	 */
	public void setScores(int scores) {
		this.scores = scores;
	}
	/**
	 * 取得注册时间
	 * @return
	 */
	public Timestamp getRegTime() {
		return regTime;
	}
	/**
	 * 设置注册时间
	 * @param regTime
	 */
	public void setRegTime(Timestamp regTime) {
		this.regTime = regTime;
	}
	/**
	 * 取得登录时间
	 * @return
	 */
	public Timestamp getLoginTime() {
		return loginTime;
	}
	/**
	 * 设置登录时间
	 * @param loginTime
	 */
	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}
	/**
	 * 取得登录IP
	 * @return
	 */
	public String getLoginIp() {
		return loginIp;
	}
	/**
	 * 设置登录IP
	 * @param loginIp
	 */
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	/**
	 * 取得用户状态
	 * @return
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * 设置登录状态
	 * @param status
	 */
	public void setStatus(String status) {
		this.status = status;
	}


	/**
	 * 取得在线时长
	 * @return
	 */
	public int getOnlineTime() {
		return onlineTime;
	}

	/**
	 * 设置在线时长
	 * @param onlineTime
	 */
	public void setOnlineTime(int onlineTime) {
		this.onlineTime = onlineTime;
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

	public String getRegTimeStr() {
		return regTimeStr;
	}

	public void setRegTimeStr(String regTimeStr) {
		this.regTimeStr = regTimeStr;
	}

	public String getLoginTimeStr() {
		return loginTimeStr;
	}

	public void setLoginTimeStr(String loginTimeStr) {
		this.loginTimeStr = loginTimeStr;
	}
	
	/**
	 * 取得安全问题
	 * @return
	 */
	public String getQuestion() {
		return question;
	}

	/**
	 * 设置安全问题
	 * @param question
	 */
	public void setQuestion(String question) {
		this.question = question;
	}

	/**
	 * 取得安全问题答案
	 * @return
	 */
	public String getAnswer() {
		return answer;
	}

	/**
	 * 设置安全问题答案
	 * @param answer
	 */
	public void setAnswer(String answer) {
		this.answer = answer;
	}
}
