package cn.edu.ahut.service.system_manage;

import cn.edu.ahut.util.exception.BizException;
import cn.edu.ahut.vo.UserInfoVO;
import cn.edu.ahut.vo.UserVO;

/**
 * UserService
 * @author UML小组
 *
 */
public interface UserService {

	/**
	 * 用户登录
	 * @param userVO
	 * @return
	 */
	public UserVO login(UserVO userVO);
	
	/**
	 * 验证用户名是否已经存在
	 * @param userVO
	 * @return
	 */
	public UserVO queryUserByName(UserVO userVO);
	
	/**
	 * 用户注册
	 * @param userVO
	 * @return
	 * @throws BizException
	 */
	public UserVO register(UserVO userVO) throws BizException;
	
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
	 * 根据ID查询用户基本信息
	 * @param vo
	 * @return
	 */
	public UserVO queryUserVOById(UserVO vo);
}
