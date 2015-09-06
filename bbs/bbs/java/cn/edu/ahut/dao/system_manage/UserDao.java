package cn.edu.ahut.dao.system_manage;

import cn.edu.ahut.vo.UserInfoVO;
import cn.edu.ahut.vo.UserVO;

/**
 * 
 * @author 李三来
 *
 */
public interface UserDao {
	
	/**
	 * 用户登录
	 * @param userVO
	 * @return
	 */
	public UserVO queryUserVO(UserVO userVO);
	
	/**
	 * 添加userVO
	 * @param userVO
	 * @return
	 */
	public void insertUserVO(UserVO userVO);
	
	/**
	 * 验证用户名是否已经存在
	 * @param userVO
	 * @return
	 */
	public UserVO queryUserByName(UserVO userVO);
	
	/**
	 * 添加userInfoVO
	 * @param vo
	 */
	public void insertUserInfoVO(UserInfoVO vo);
	
	/**
	 * 更新在线时长
	 * @param vo
	 */
	public void updateOnlineTime(UserInfoVO vo);
	
	/**
	 * 更新登录时间和IP
	 * @param vo
	 */
	public void updateLoginTimeAndIp(UserInfoVO vo);
	
	/**
	 * 根据ID查询用户基本信息
	 * @param vo
	 * @return
	 */
	public UserVO queryUserVOById(UserVO vo);
	
	/**
	 * 根据用户ID查询用户详细信息
	 * @param vo
	 * @return
	 */
	public UserInfoVO queryUserInfoVO(UserVO vo);
	
	/**
	 * 更新用户基本资料
	 * @param vo
	 */
	public void updateUserBasicInfo(UserInfoVO vo);
	
	/**
	 * 更新用户的联系方式
	 * @param vo
	 */
	public void updateUserConnectInfo(UserInfoVO vo);
	
	/**
	 * 更新用户的头像
	 * @param vo
	 */
	public void updateUserImage(UserInfoVO vo);
	
	/**
	 * 更新用户密码
	 * @param vo
	 */
	public void updateUserPassword(UserVO vo);
}
