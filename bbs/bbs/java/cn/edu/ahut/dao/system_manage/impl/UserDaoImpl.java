package cn.edu.ahut.dao.system_manage.impl;

import cn.edu.ahut.base.dao.BaseDaoSupport;
import cn.edu.ahut.dao.system_manage.UserDao;
import cn.edu.ahut.vo.UserInfoVO;
import cn.edu.ahut.vo.UserVO;

/**
 * UserDaoImpl
 * @author UML小组
 *
 */
public class UserDaoImpl extends BaseDaoSupport implements UserDao {

	/**
	 * 用户登录
	 * @param userVO
	 * @return
	 */
	public UserVO queryUserVO(UserVO userVO) {
		return (UserVO) this.executeQueryForObject("system.query_userByNamePassword", userVO);
	}

	/**
	 * 添加用户userVO
	 * @param userVO
	 * @return
	 */
	public void insertUserVO(UserVO userVO) {
		this.executeInsert("system.insert_userVO", userVO);
	}

	/**
	 * 验证用户名是否已经存在
	 * @param userVO
	 * @return
	 */
	public UserVO queryUserByName(UserVO userVO) {
		return (UserVO) this.executeQueryForObject("system.query_userByName", userVO);
	}

	/**
	 * 添加userInfoVO
	 * @param vo
	 */
	public void insertUserInfoVO(UserInfoVO vo){
		this.executeInsert("system.insert_userInfoVO", vo);
	}
	
	/**
	 * 更新在线时长
	 * @param vo
	 */
	public void updateOnlineTime(UserInfoVO vo){
		this.executeUpdate("system.update_onlinetime", vo);
	}
	
	/**
	 * 更新登录时间和IP
	 * @param vo
	 */
	public void updateLoginTimeAndIp(UserInfoVO vo){
		this.executeUpdate("system.update_logintime_ip", vo);
	}
	/**
	 * 根据用户ID查询用户详细信息
	 * @param vo
	 * @return
	 */
	public UserInfoVO queryUserInfoVO(UserVO vo){
		return (UserInfoVO) this.executeQueryForObject("system.query_userInfoVO", vo);
	}
	
	/**
	 * 更新用户基本资料
	 * @param vo
	 */
	public void updateUserBasicInfo(UserInfoVO vo){
		this.executeUpdate("system.update_userInfo_basicInfo", vo);
	}
	
	/**
	 * 更新用户的联系方式
	 * @param vo
	 */
	public void updateUserConnectInfo(UserInfoVO vo){
		this.executeUpdate("system.update_userInfo_connectInfo", vo);
	}
	
	/**
	 * 更新用户的头像
	 * @param vo
	 */
	public void updateUserImage(UserInfoVO vo){
		this.executeUpdate("system.update_userInfo_image", vo);
	}
	
	/**
	 * 更新用户密码
	 * @param vo
	 */
	public void updateUserPassword(UserVO vo){
		this.executeUpdate("system.update_userVO_password", vo);
	}
	
	/**
	 * 根据ID查询用户基本信息
	 * @param vo
	 * @return
	 */
	public UserVO queryUserVOById(UserVO vo){
		return (UserVO) this.executeQueryForObject("system.query_userById", vo);
	}
}
