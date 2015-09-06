package cn.edu.ahut.service.admin_manage.impl;

import cn.edu.ahut.base.service.BaseServiceImpl;
import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.dao.admin_manage.SectionDao;
import cn.edu.ahut.dao.admin_manage.UserDao;
import cn.edu.ahut.service.admin_manage.UserService;
import cn.edu.ahut.util.exception.BizException;
import cn.edu.ahut.vo.SubSectionVO;
import cn.edu.ahut.vo.UserInfoVO;
import cn.edu.ahut.vo.UserVO;

/**
 * 后台管理UserServiceImpl
 * @author UML小组
 */
public class UserServiceImpl extends BaseServiceImpl implements UserService {

	/**
	 * UserDao引用
	 */
	private UserDao userDao;
	
	/**
	 * SectionDao引用
	 */
	private SectionDao sectionDao;
	
	/**
	 * 取得SectionDao引用
	 * @return
	 */
	public SectionDao getSectionDao() {
		return sectionDao;
	}

	/**
	 * 设置SectionDao引用
	 * @param sectionDao
	 */
	public void setSectionDao(SectionDao sectionDao) {
		this.sectionDao = sectionDao;
	}

	/**
	 * 取得UserDao引用
	 * @return
	 */
	public UserDao getUserDao() {
		return userDao;
	}

	/**
	 * 设置UserDao引用
	 * @param userDao
	 */
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * 管理员登录
	 */
	public UserVO adminLogin(UserVO userVO) {
		UserVO user = userDao.adminLogin(userVO);
		if(user!=null){
			UserInfoVO  userInfoVO =  userDao.queryUserInfoVO(user);
			if(userInfoVO!=null && 
					("管理员".equals(userInfoVO.getSysrole())
			)){
				if(userInfoVO.getQuestion()==null){
					userInfoVO.setQuestion("");
				}if(userInfoVO.getAnswer()==null){
					userInfoVO.setAnswer("");
				}if(userInfoVO.getBirthday()==null){
					userInfoVO.setBirthday("");
				}if(userInfoVO.getAddress()==null){
					userInfoVO.setAddress("");
				}if(userInfoVO.getWebSite()==null){
					userInfoVO.setWebSite("");
				}if(userInfoVO.getUserSign()==null){
					userInfoVO.setUserSign("");
				}if(userInfoVO.getIntroduction()==null){
					userInfoVO.setIntroduction("");
				}if(userInfoVO.getPostSign()==null){
					userInfoVO.setPostSign("");
				}if(userInfoVO.getTelephone()==null){
					userInfoVO.setTelephone("");
				}if(userInfoVO.getMobile()==null){
					userInfoVO.setMobile("");
				}if(userInfoVO.getQq()==null){
					userInfoVO.setQq("");
				}/*if(userInfoVO.getMsn()==null){
					userInfoVO.setMsn("");
				}*/
				//设置用户登录时间和登录IP
				userInfoVO.setLoginIp(userVO.getIp());
				userInfoVO.setLoginTime(userVO.getTime());
				userDao.updateLoginTimeAndIp(userInfoVO);
				user.setUserInfoVO(userInfoVO);
			}else{
				user = null;
			}
		}
		return user;
	}

	/**
	 * 更新在线时长
	 * @param vo
	 */
	public void updateOnlineTime(UserInfoVO vo){
		userDao.updateOnlineTime(vo);
	}
	
	/**
	 * 更新用户基本资料
	 * @param vo
	 */
	public void updateUserBasicInfo(UserInfoVO vo){
		userDao.updateUserBasicInfo(vo);
	}
	
	/**
	 * 更新用户的联系方式
	 * @param vo
	 */
	public void updateUserConnectInfo(UserInfoVO vo){
		userDao.updateUserConnectInfo(vo);
	}
	
	/**
	 * 更新用户的头像
	 * @param vo
	 */
	public void updateUserImage(UserInfoVO vo){
		userDao.updateUserImage(vo);
	}
	
	/**
	 * 更新用户密码
	 * @param vo
	 */
	public void updateUserPassword(UserVO vo,UserVO tempVO) throws BizException{
		if(tempVO.getUserpwd().equals(vo.getOldPassword())){
			userDao.updateUserPassword(vo);
		}else{
			throw new BizException("旧密码输入的不正确");
		}
	}
	
	/**
	 * 根据ID查找用户基本信息
	 * @param vo
	 * @return
	 */
	public UserVO queryUserVOById(UserVO vo){
		return userDao.queryUserVOById(vo);
	}

	/**
	 * 根据用户ID查询用户详细信息
	 * @param vo
	 * @return
	 */
	public UserInfoVO queryUserInfoVO(UserVO vo){
		return userDao.queryUserInfoVO(vo);
	}
	
	/**
	 * 查询所有的管理员
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllManager(int offset,int length){
		return userDao.queryAllManager(offset, length);
	}
	
	/**
	 * 查询所有的用户
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllUserVO(int offset,int length){
		return userDao.queryAllUserVO(offset, length);
	}
	
	/**
	 * 查询所有的版主
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllSectionManager(int offset,int length){
		return userDao.queryAllSectionManager(offset, length);
	}
	
	/**
	 * 查询所有的激活用户
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllActiveUserVO(int offset,int length){
		return userDao.queryAllActiveUserVO(offset, length);
	}
	
	/**
	 * 查询所有的禁言用户
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllNospeakUserVO(int offset,int length){
		return userDao.queryAllNospeakUserVO(offset, length);
	}
	
	/**
	 * 查询所有的锁定用户
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllLockedUserVO(int offset,int length){
		return userDao.queryAllLockedUserVO(offset, length);
	}
	
	/**
	 * 激活用户
	 * @param vo
	 */
	public void doActiveUser(UserVO vo){
		userDao.doActiveUser(vo);
	}
	
	/**
	 * 禁言用户
	 * @param vo
	 */
	public void forbidUser(UserVO vo){
		userDao.forbidUser(vo);
	}
	
	/**
	 * 锁定用户
	 * @param vo
	 */
	public void lockUser(UserVO vo){
		userDao.lockUser(vo);
	}
	
	/**
	 * 解除管理员
	 * @param vo
	 */
	public void deleteManager(UserVO vo){
		userDao.deleteManager(vo);
	}
	
	/**
	 * 添加管理员
	 * @param vo
	 */
	public void addManager(UserVO vo){
		userDao.addManager(vo);
	}
	
	/**
	 * 添加版主
	 * @param vo
	 */
	public void addSectionManager(UserVO vo){
		userDao.addSectionManager(vo);
	}
	
	/**
	 * 删除版主
	 * @param vo
	 */
	public void deleteSectionManager(UserVO vo){
		SubSectionVO subSectionVO = sectionDao.querySubSectionVOByManager(vo);
		sectionDao.deleteSectionManager(subSectionVO);
		userDao.deleteSectionManager(vo);
	}
	
	/**
	 * 根据用户名模糊查询用户
	 */
	public PageObject queryUserByNameFuzzy(UserVO vo,int offset,int length){
		return userDao.queryUserByNameFuzzy(vo, offset, length);
	}
	
	/**
	 * 根据ID模糊查询用户
	 */
	public PageObject queryUserByIdFuzzy(UserVO vo,int offset,int length){
		return userDao.queryUserByIdFuzzy(vo, offset, length);
	}
	
}
