package cn.edu.ahut.service.admin_manage;

import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.vo.UserInfoVO;
import cn.edu.ahut.vo.UserVO;

/**
 * 后台管理UserService
 * @author UML小组
 *
 */
public interface UserService {

	/**
	 * 管理员登录
	 * @param userVO
	 * @return
	 */
	public UserVO adminLogin(UserVO userVO);
	
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
	public void updateUserPassword(UserVO vo,UserVO tempVO);
	
	/**
	 * 根据ID查找用户基本信息
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
	 * 更新在线时长
	 * @param vo
	 */
	public void updateOnlineTime(UserInfoVO vo);
	
	/**
	 * 查询所有的管理员
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllManager(int offset,int length);
	
	/**
	 * 查询所有的用户
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllUserVO(int offset,int length);
	
	/**
	 * 查询所有的版主
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllSectionManager(int offset,int length);
	
	/**
	 * 查询所有的激活用户
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllActiveUserVO(int offset,int length);
	
	/**
	 * 查询所有的禁言用户
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllNospeakUserVO(int offset,int length);
	
	/**
	 * 查询所有的锁定用户
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllLockedUserVO(int offset,int length);

	/**
	 * 激活用户
	 * @param vo
	 */
	public void doActiveUser(UserVO vo);
	
	/**
	 * 禁言用户
	 * @param vo
	 */
	public void forbidUser(UserVO vo);
	
	/**
	 * 锁定用户
	 * @param vo
	 */
	public void lockUser(UserVO vo);
	
	/**
	 * 解除管理员
	 * @param vo
	 */
	public void deleteManager(UserVO vo);
	
	/**
	 * 添加管理员
	 * @param vo
	 */
	public void addManager(UserVO vo);
	
	/**
	 * 添加版主
	 * @param vo
	 */
	public void addSectionManager(UserVO vo);
	
	/**
	 * 删除版主
	 * @param vo
	 */
	public void deleteSectionManager(UserVO vo);
	
	/**
	 * 根据用户名模糊查询用户
	 */
	public PageObject queryUserByNameFuzzy(UserVO vo,int offset,int length);
	
	/**
	 * 根据ID模糊查询用户
	 */
	public PageObject queryUserByIdFuzzy(UserVO vo,int offset,int length);
	
}
