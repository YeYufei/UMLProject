package cn.edu.ahut.action.system_manage;

import java.sql.Timestamp;
import java.util.Date;

import cn.edu.ahut.base.action.BaseActionSupport;
import cn.edu.ahut.service.admin_manage.SectionService;
import cn.edu.ahut.service.system_manage.UserService;
import cn.edu.ahut.util.Constants;
import cn.edu.ahut.util.LogUtil;
import cn.edu.ahut.util.StringUtil;
import cn.edu.ahut.util.exception.BizException;
import cn.edu.ahut.vo.UserInfoVO;
import cn.edu.ahut.vo.UserVO;

/**
 * UserAction
 * 
 * @author UML小组
 * 
 */
public class UserAction extends BaseActionSupport {

	private static final long serialVersionUID = 4795147622620740907L;

	/**
	 * UserService引用
	 */
	private UserService service;
	
	/**
	 * SectionService引用
	 */
	private SectionService sectionService;
	
	/**
	 *用户基本信息
	 */
	private UserVO userVO;

	/**
	 * 用户详细信息
	 */
	private UserInfoVO userInfoVO;

	/**
	 * 验证码
	 */
	private String randCode;
	
	/**
	 * 用户登录
	 */
	public void login() {
		LogUtil.info("用户登录开始");
		if (session.getAttribute(Constants.VALIDATE_KEY).equals(randCode)) {
		if (!StringUtil.isNullOrEmpty(userVO.getUsername().trim())
				&& !StringUtil.isNullOrEmpty(userVO.getUserpwd().trim())) {
			//设置用户登录时间和登录IP
			userVO.setIp(request.getRemoteAddr());
			userVO.setTime(new Timestamp(new Date().getTime()));
			//调用业务层方法
			UserVO user = service.login(userVO);
			if (user != null) {
				session.setAttribute(Constants.USER_KEY, user);
				session.setAttribute("user", user);
				write(Constants.MSG_SUCCESS);
			} else {
				// 用户名和密码错误
				addError(Constants.MSG_ERROR_USERNAME_PASSWORD);
			}
		} else {
			// 用户名和密码不能为空
			addError(Constants.MSG_ERROR_USERNAME_PASSWORD_NULL);
		}
		 }else {
		 //验证码输入错误
		 addError(Constants.MSG_ERROR_RANDCODE);
		 }
		isInvalid();
		LogUtil.info("用户登录结束");
	}

	/**
	 * 用户注销
	 */
	public void logout() {
		LogUtil.info("用户注销开始");
		//更新用户在线时长
//		UserVO user = (UserVO) session.getAttribute(Constants.USER_KEY);
//	    UserInfoVO userInfo	= user.getUserInfoVO();
//	    long onlineTime = new Date().getTime() - userInfo.getLoginTime().getTime();
//	    int onlineHour = (int) (onlineTime/3600000);
//	    userInfo.setOnlineTime(onlineHour+userInfo.getOnlineTime());
//		service.updateOnlineTime(userInfo);
//		//移除在线列表
//		Map<String, UserVO> onLineMap = (Map<String, UserVO>) session.getAttribute("onLineMap");
//		onLineMap.remove(user.getUsername());
		
		session.removeAttribute(Constants.USER_KEY);
		session.removeAttribute("user");
		session.invalidate();
		write(Constants.MSG_SUCCESS);
		isInvalid();
		LogUtil.info("用户注销结束");
	}

	/**
	 * 验证注册的用户名
	 */
	public void checkUsername() {
		LogUtil.info("检查用户是否存在开始");
		if (!StringUtil.isNullOrEmpty(userVO.getUsername())) {
			UserVO user = service.queryUserByName(userVO);
			if (null != user) {
				// 用户名已经存在
				writeJson(getText(Constants.MSG_ERROR_USERNAME_EXIST), false);
				return;
			} else {
				write(Constants.MSG_SUCCESS);
			}
		} else {
			// 用户名不能为空
			writeJson(Constants.MSG_ERROR_USERNAME_EMPTY, false);
			return;
		}
		isInvalid();
		LogUtil.info("检查用户是否存在结束");
	}

	/**
	 * 校验验证码
	 */
	public void checkRandCode() {
		LogUtil.info("后台检验验证码开始");
		String randCode_1 = (String) session
				.getAttribute(Constants.VALIDATE_KEY_1);
		if (!randCode_1.equals(randCode)) {
			writeJson(getText(Constants.MSG_ERROR_RANDCODE_WRONG), false);
		} else {
			write(Constants.MSG_SUCCESS);
		}
		isInvalid();
		LogUtil.info("后台检验验证码结束");
	}

	/**
	 * 用户注册
	 */
	public void register() {
		LogUtil.info("用户注册开始");
		String ip = request.getRemoteAddr();
		userVO.setIp(ip);
		try {
			UserVO vo = service.register(userVO);
			session.setAttribute(Constants.USER_KEY, vo);
			session.setAttribute("user", vo);
		} catch (BizException e) {
			writeJson(e.getMessage(), false);
		} catch (Exception e) {
			writeJson(getText(Constants.SYSTEM_ERROR), false);
		}
		write(Constants.MSG_SUCCESS);
		isInvalid();
		LogUtil.info("用户注册结束");
	}

	/**
	 * 更新用户基本资料
	 */
	public void updateUserBasicInfo() {
		LogUtil.info("更新用户基本资料开始");
		UserVO tempVO = (UserVO) session.getAttribute(Constants.USER_KEY);
		if (tempVO != null) {
			UserInfoVO tempUserInfo = tempVO.getUserInfoVO();
			userInfoVO.setUid(tempUserInfo.getUid());
			service.updateUserBasicInfo(userInfoVO);
			UserInfoVO vo = service.queryUserInfoVO(tempVO);
			tempVO.setUserInfoVO(vo);
			session.setAttribute(Constants.USER_KEY, tempVO);
			write(Constants.MSG_SUCCESS);
		} else {
			writeJson("您已经退出了登录，请您重新登录", false);
		}
		isInvalid();
		LogUtil.info("更新用户基本资料结束");
	}

	/**
	 * 更新用户联系方式
	 */
	public void updateUserConnectInfo() {
		LogUtil.info("更新用户联系方式开始");
		UserVO tempVO = (UserVO) session.getAttribute(Constants.USER_KEY);
		if (tempVO != null) {
			UserInfoVO tempUserInfo = tempVO.getUserInfoVO();
			userInfoVO.setUid(tempUserInfo.getUid());
			service.updateUserConnectInfo(userInfoVO);
			UserInfoVO vo = service.queryUserInfoVO(tempVO);
			tempVO.setUserInfoVO(vo);
			session.setAttribute(Constants.USER_KEY, tempVO);
			write(Constants.MSG_SUCCESS);
		} else {
			writeJson("您已经退出了登录，请您重新登录", false);
		}
		isInvalid();
		LogUtil.info("更新用户联系方式结束");
	}

	/**
	 * 更新头像
	 */
	public void updateUserImage() {
		LogUtil.info("更新用户头像开始");
		UserVO tempVO = (UserVO) session.getAttribute(Constants.USER_KEY);
		if (tempVO != null) {
			UserInfoVO tempUserInfo = tempVO.getUserInfoVO();
			userInfoVO.setUid(tempUserInfo.getUid());
			service.updateUserImage(userInfoVO);
			UserInfoVO vo = service.queryUserInfoVO(tempVO);
			tempVO.setUserInfoVO(vo);
			session.setAttribute(Constants.USER_KEY, tempVO);
			session.setAttribute("user", tempVO);
			write(Constants.MSG_SUCCESS);
		} else {
			writeJson("您已经退出了登录，请您重新登录", false);
		}
		isInvalid();
		LogUtil.info("更新用户头像结束");
	}


	/**
	 * 更新用户密码
	 */
	public void updateUserPassword() {
		LogUtil.info("更新用户联系方式开始");
		UserVO tempVO = (UserVO) session.getAttribute(Constants.USER_KEY);
		if (tempVO != null && userVO != null) {
			try {
				service.updateUserPassword(userVO, tempVO);
			} catch (BizException e) {
				writeJson(e.getMessage(), false);
			}
			UserInfoVO vo = service.queryUserInfoVO(tempVO);
			tempVO.setUserInfoVO(vo);
			session.setAttribute(Constants.USER_KEY, tempVO);
			write(Constants.MSG_SUCCESS);
		} else {
			writeJson("您已经退出了登录，请您重新登录", false);
		}
		isInvalid();
		LogUtil.info("更新用户联系方式结束");
	}

	/**
	 * 取得service引用
	 * 
	 * @return
	 */
	public UserService getService() {
		return service;
	}

	/**
	 * 设置service引用
	 * 
	 * @param service
	 */
	public void setService(UserService service) {
		this.service = service;
	}

	/**
	 * 取得vo对象
	 * 
	 * @return
	 */
	public UserVO getUserVO() {
		return userVO;
	}

	/**
	 * 设置vo对象
	 * 
	 * @param userVO
	 */
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	/**
	 * 取得用户详细信息
	 * 
	 * @return
	 */
	public UserInfoVO getUserInfoVO() {
		return userInfoVO;
	}

	/**
	 * 设置用户详细信息
	 * 
	 * @param userInfoVO
	 */
	public void setUserInfoVO(UserInfoVO userInfoVO) {
		this.userInfoVO = userInfoVO;
	}

	/**
	 * 取得验证码
	 * 
	 * @return
	 */
	public String getRandCode() {
		return randCode;
	}

	/**
	 * 设置验证码
	 * 
	 * @param randCode
	 */
	public void setRandCode(String randCode) {
		this.randCode = randCode;
	}

	/**
	 * 取得SectionService引用
	 * @return
	 */
	public SectionService getSectionService() {
		return sectionService;
	}

	/**
	 * 设置SectionService引用
	 * @param sectionService
	 */
	public void setSectionService(SectionService sectionService) {
		this.sectionService = sectionService;
	}

}
