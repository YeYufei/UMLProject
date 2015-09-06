package cn.edu.ahut.dao.admin_manage.impl;

import cn.edu.ahut.base.dao.BaseDaoSupport;
import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.dao.admin_manage.UserDao;
import cn.edu.ahut.vo.UserInfoVO;
import cn.edu.ahut.vo.UserVO;

/**
 * 后台管理UserDaoImpl
 * @author UML小组
 */
public class UserDaoImpl extends BaseDaoSupport implements UserDao {

	/**
	 * 管理员登录
	 */
	public UserVO adminLogin(UserVO userVO) {
		return (UserVO) this.executeQueryForObject("admin.query_userByNamePassword", userVO);
	}

	/**
	 * 更新在线时长
	 * @param vo
	 */
	public void updateOnlineTime(UserInfoVO vo){
		this.executeUpdate("admin.update_onlinetime", vo);
	}
	
	/**
	 * 更新登录时间和IP
	 * @param vo
	 */
	public void updateLoginTimeAndIp(UserInfoVO vo){
		this.executeUpdate("admin.update_logintime_ip", vo);
	}
	/**
	 * 根据ID查找用户基本信息
	 * @param vo
	 * @return
	 */
	public UserVO queryUserVOById(UserVO vo){
		return (UserVO) this.executeQueryForObject("admin.query_userByID", vo);
	}
	
	/**
	 * 根据用户ID查询用户详细信息
	 * @param vo
	 * @return
	 */
	public UserInfoVO queryUserInfoVO(UserVO vo){
		return (UserInfoVO) this.executeQueryForObject("admin.query_userInfoVO", vo);
	}
	
	/**
	 * 更新用户基本资料
	 * @param vo
	 */
	public void updateUserBasicInfo(UserInfoVO vo){
		this.executeUpdate("admin.update_userInfo_basicInfo", vo);
	}
	
	/**
	 * 更新用户的联系方式
	 * @param vo
	 */
	public void updateUserConnectInfo(UserInfoVO vo){
		this.executeUpdate("admin.update_userInfo_connectInfo", vo);
	}
	
	/**
	 * 更新用户的头像
	 * @param vo
	 */
	public void updateUserImage(UserInfoVO vo){
		this.executeUpdate("admin.update_userInfo_image", vo);
	}
	
	/**
	 * 更新用户密码
	 * @param vo
	 */
	public void updateUserPassword(UserVO vo){
		this.executeUpdate("admin.update_userVO_password", vo);
	}
	/**
	 * 查询所有的管理员
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllManager(int offset,int length){
		return this.executeQueryForPage("admin.query_all_manager", offset, length);
	}

	/**
	 * 查询所有用户
	 */
	@Override
	public PageObject queryAllUserVO(int offset, int length) {
		return this.executeQueryForPage("admin.query_all_userVO", offset, length);
	}
	
	/**
	 * 查询所有的版主
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllSectionManager(int offset,int length){
		return this.executeQueryForPage("admin.query_all_section_manager",offset, length);
	}
	
	/**
	 * 查询所有的激活用户
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllActiveUserVO(int offset,int length){
		return this.executeQueryForPage("admin.query_all_active_userVO", offset, length);
	}
	
	/**
	 * 查询所有的禁言用户
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllNospeakUserVO(int offset,int length){
		return this.executeQueryForPage("admin.query_all_nospeak_userVO", offset, length);
	}
	
	/**
	 * 查询所有的锁定用户
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllLockedUserVO(int offset,int length){
		return this.executeQueryForPage("admin.query_all_locked_userVO", offset, length);
	}
	
	/**
	 * 激活用户
	 * @param vo
	 */
	public void doActiveUser(UserVO vo){
		this.executeUpdate("admin.update_doActive_user",vo);
	}
	
	/**
	 * 禁言用户
	 * @param vo
	 */
	public void forbidUser(UserVO vo){
		this.executeUpdate("admin.update_forbid_user",vo);
	}
	
	/**
	 * 锁定用户
	 * @param vo
	 */
	public void lockUser(UserVO vo){
		this.executeUpdate("admin.update_lock_user",vo);
	}
	
	/**
	 * 解除管理员
	 * @param vo
	 */
	public void deleteManager(UserVO vo){
		this.executeUpdate("admin.update_delete_manager", vo);
	}
	
	/**
	 * 添加管理员
	 * @param vo
	 */
	public void addManager(UserVO vo){
		this.executeUpdate("admin.update_add_manager", vo);
	}
	
	/**
	 * 添加版主
	 * @param vo
	 */
	public void addSectionManager(UserVO vo){
		this.executeUpdate("admin.update_add_section_manager", vo);
	}
	
	/**
	 * 删除版主
	 * @param vo
	 */
	public void deleteSectionManager(UserVO vo){
		this.executeUpdate("admin.update_delete_section_manager", vo);
	}
	/**
	 * 根据用户名模糊查询用户
	 */
	public PageObject queryUserByNameFuzzy(UserVO vo,int offset,int length){
		return this.executeQueryForPage("admin.query_userByName_fuzzy", vo, offset, length);
	}
	
	/**
	 * 根据ID模糊查询用户
	 */
	public PageObject queryUserByIdFuzzy(UserVO vo,int offset,int length){
		return this.executeQueryForPage("admin.query_userByID_fuzzy", vo, offset, length);
	}
}
