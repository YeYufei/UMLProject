package cn.edu.ahut.service.system_manage.impl;

import java.sql.Timestamp;
import java.util.Date;

import cn.edu.ahut.base.service.BaseServiceImpl;
import cn.edu.ahut.dao.system_manage.UserDao;
import cn.edu.ahut.service.system_manage.UserService;
import cn.edu.ahut.util.exception.BizException;
import cn.edu.ahut.vo.UserInfoVO;
import cn.edu.ahut.vo.UserVO;

/**
 * UserServiceImpl
 * 
 * @author UML小组
 * 
 */
public class UserServiceImpl extends BaseServiceImpl implements UserService {

	/**
	 * UserDao引用
	 */
	private UserDao userDao;

	/**
	 * 取得dao引用
	 * 
	 * @return
	 */
	public UserDao getUserDao() {
		return userDao;
	}

	/**
	 * 设置dao引用
	 * 
	 * @param userDao
	 */
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * 用户登录
	 */
	public UserVO login(UserVO userVO) {
		//String[] questions = { "", "无安全问题", "我父亲的姓名", "我母亲的姓名", "我父亲的生日",
		//		"我母亲的生日", "我最爱的人是谁", "我喜欢的运动", "我的大学名称" };
		UserVO user = userDao.queryUserVO(userVO);
		if(user!=null){
			//num为前台传过来的的问题序号
			//int num =Integer.parseInt(userVO.getQuestion().trim());
			/*if (num!=1 && questions[num].equals(user.getQuestion())
					&& userVO.getAnswer().equals(user.getAnswer())) {
				user = null;
			}else{*/
				UserInfoVO  userInfoVO =  userDao.queryUserInfoVO(user);
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
			}
		//}
		return user;
	}

	/**
	 * 验证用户名是否已经存在
	 * 
	 * @param userVO
	 * @return
	 */
	public UserVO queryUserByName(UserVO userVO) {
		UserVO user = null;
		user = userDao.queryUserByName(userVO);
		return user;
	}

	/**
	 * 用户注册
	 */
	@Override
	public UserVO register(UserVO userVO) throws BizException {
		UserVO tempVO =  userDao.queryUserByName(userVO);
		if (tempVO!= null) {
			throw new BizException("该用户名已经被注册");
		} else {
			userDao.insertUserVO(userVO);
			tempVO =  userDao.queryUserByName(userVO);
			int uid  = tempVO.getId();//初始化UID
			String sysLevel = "01";//初始化系统级别
			String userTitle = "01";//初始化用户头衔
			int scores = 50;//初始化积分
			Timestamp now = new Timestamp(new Date().getTime());
			Timestamp loginTime  = now;//初始化登录时间
			Timestamp regTime = now;//初始化注册时间
			String ip = userVO.getIp();//初始化登录IP
			String status = "01";//初始化用户状态
			String sysrole = "03";//初始化用户角色
			UserInfoVO userInfoVO = new UserInfoVO(uid,sysLevel,userTitle,scores,regTime,loginTime,ip,status,sysrole);
			userInfoVO.setImage("images/system_image/default_image_boy.gif");
			userDao.insertUserInfoVO(userInfoVO);
			userInfoVO = userDao.queryUserInfoVO(tempVO);
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
			tempVO.setUserInfoVO(userInfoVO);
			return tempVO;
		}
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
	 * 根据用户ID查询用户详细信息
	 * @param vo
	 * @return
	 */
	public UserInfoVO queryUserInfoVO(UserVO vo){
		return userDao.queryUserInfoVO(vo);
	}
	
	/**
	 * 根据ID查询用户基本信息
	 * @param vo
	 * @return
	 */
	public UserVO queryUserVOById(UserVO vo){
		return userDao.queryUserVOById(vo);
	}
}
