package cn.edu.ahut.action.admin_manage;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import cn.edu.ahut.base.action.BaseActionSupport;
import cn.edu.ahut.base.vo.PageInfo;
import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.service.admin_manage.SectionService;
import cn.edu.ahut.service.admin_manage.UserService;
import cn.edu.ahut.util.Constants;
import cn.edu.ahut.util.LogUtil;
import cn.edu.ahut.util.StringUtil;
import cn.edu.ahut.vo.SectionVO;
import cn.edu.ahut.vo.SubSectionVO;
import cn.edu.ahut.vo.UserInfoVO;
import cn.edu.ahut.vo.UserVO;

/**
 * 后台管理UserAction
 * @author UML小组
 *
 */
public class UserAction extends BaseActionSupport {
	private static final long serialVersionUID = -2290654530049994274L;

	/**
	 * UserService引用
	 */
	private UserService service;
	
	/**
	 * sectionService引用
	 */
	private SectionService sectionService;
	
	/**
	 * 子版块对象
	 */
	private SubSectionVO subSectionVO;
	
	/**
	 * 取得子版块对象
	 * @return
	 */
	public SubSectionVO getSubSectionVO() {
		return subSectionVO;
	}

	/**
	 * 设置子版块对象
	 * @param subSectionVO
	 */
	public void setSubSectionVO(SubSectionVO subSectionVO) {
		this.subSectionVO = subSectionVO;
	}
	
	/**
	 * UserVO引用
	 */
	private UserVO userVO;

	/**
	 * 检索类型
	 */
	private String type;

	/**
	 * 取得检索类型
	 * @return
	 */
	public String getType() {
		return type;
	}

	/**
	 * 设置检索类型
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * 取得UserService引用
	 * @return
	 */
	public UserService getService() {
		return service;
	}

	/**
	 * 设置UserService引用
	 * @param service
	 */
	public void setService(UserService service) {
		this.service = service;
	}

	/**
	 * 取得UserVO引用
	 * @return
	 */
	public UserVO getUserVO() {
		return userVO;
	}

	/**
	 * 设置UserVO引用
	 * @param userVO
	 */
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	/**
	 *	取得SectionService引用
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

	
	/**
	 * 管理员登录
	 */
	public void adminLogin(){
		//记录日志
		LogUtil.info("后台管理员登录开始");
		//判断用户名是否为空
		if(StringUtil.isNullOrEmpty(userVO.getUsername().trim())){
			writeJson("用户名不能为空", false);
		}//判断密码是否为空
		else if(StringUtil.isNullOrEmpty(userVO.getUserpwd().trim())){
			writeJson("密码不能为空", false);
		}else{
			//设置用户登录时间和登录IP
			userVO.setIp(request.getRemoteAddr());
			userVO.setTime(new Timestamp(new Date().getTime()));
			//调用业务处的登录方法
			UserVO user =  service.adminLogin(userVO);
			//如果登录成功
			if(user!=null){
				session.setAttribute(Constants.ADMIN_KEY, user);
				session.setAttribute("admin", user);
				write(Constants.MSG_SUCCESS);
			}//如果登录不成功
			else{
				writeJson("用户名或者密码错误", false);
			}
		}
		isInvalid();
		LogUtil.info("后台管理员登录结束");
	}
	
	/**
	 * 管理员退出
	 */
	public void logout(){
		LogUtil.info("后台管理员退出开始");
		session.removeAttribute(Constants.ADMIN_KEY);
		session.removeAttribute("admin");
		session.invalidate();
		write(Constants.MSG_SUCCESS);
		isInvalid();
		LogUtil.info("后台管理员退出结束");
	}
	
	/**--------------------用户管理开始---------------------------*/
	/**
	 * 查询所有管理员
	 */
	public String queryAllManager(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("取得管理员列表开始");
			//设置每页的数目
			int length = 8;
			//获得当前页数
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//得到每页的开始基数
			int offset = (currentPage-1)*length;
			PageObject users = service.queryAllManager(offset, length);
			PageInfo pageInfo = new PageInfo();
			//设置当前页
			pageInfo.setCurrentPage(currentPage);
			//设置当前页条数
			pageInfo.setCurrentItemNums(users.getItems().size());
			//设置每页条数
			pageInfo.setItemNums(length);
			//计算总页数
			int allPages = 0;
			int totalCount = users.getTotalCount();
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
			//设置总页数
			pageInfo.setAllPages(allPages);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("users", users);
			LogUtil.info("取得管理员列表结束");
			return "getAllManager";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 查询所有用户
	 */
	public String queryAllUser(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("取得用户列表开始");
			//设置每页的数目
			int length = 8;
			//获得当前页数
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//得到每页的开始基数
			int offset = (currentPage-1)*length;
			//调用业务处的查询方法
			PageObject users = service.queryAllUserVO(offset, length);
			//创建分页信息
			PageInfo pageInfo = new PageInfo();
			//设置当前页
			pageInfo.setCurrentPage(currentPage);
			//设置当前页条数
			pageInfo.setCurrentItemNums(users.getItems().size());
			//设置每页条数
			pageInfo.setItemNums(length);
			//计算总页数
			int allPages = 0;
			int totalCount = users.getTotalCount();
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
			//设置总页数
			pageInfo.setAllPages(allPages);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("users", users);
			//把板块信息带过去
			List<SectionVO> sections = sectionService.queryAllSectionVO();
			int size = sections.size();
			if(size == 0){
				sections = null;
			}else{
				for(int i =0;i<size;i++){
					SectionVO sectionVO = sections.get(i);
					List<SubSectionVO> subSections = sectionService.querySubSectionVOBySid(sectionVO);
					sectionVO.setSubSectionList(subSections);
					sections.set(i, sectionVO);
				}
			}
			request.setAttribute("sections", sections);
			LogUtil.info("取得用户列表结束");
			return "getAllUser";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 查询所有激活用户
	 */
	public String queryAllActiveUser(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("取得激活用户列表开始");
			//设置每页的数目
			int length = 8;
			//获得当前页数
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//得到每页的开始基数
			int offset = (currentPage-1)*length;
			//调用业务处的查询方法
			PageObject users = service.queryAllActiveUserVO(offset, length);
			//创建分页信息
			PageInfo pageInfo = new PageInfo();
			//设置当前页
			pageInfo.setCurrentPage(currentPage);
			//设置当前页条数
			pageInfo.setCurrentItemNums(users.getItems().size());
			//设置每页条数
			pageInfo.setItemNums(length);
			//计算总页数
			int allPages = 0;
			int totalCount = users.getTotalCount();
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
			//设置总页数
			pageInfo.setAllPages(allPages);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("users", users);
			//把板块信息带过去
			List<SectionVO> sections = sectionService.queryAllSectionVO();
			int size = sections.size();
			if(size == 0){
				sections = null;
			}else{
				for(int i =0;i<size;i++){
					SectionVO sectionVO = sections.get(i);
					List<SubSectionVO> subSections = sectionService.querySubSectionVOBySid(sectionVO);
					sectionVO.setSubSectionList(subSections);
					sections.set(i, sectionVO);
				}
			}
			request.setAttribute("sections", sections);
			LogUtil.info("取得激活用户列表结束");
			return "getAllUser";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 查询所有禁言用户
	 */
	public String queryAllNospeakUser(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("取得禁言用户列表开始");
			//设置每页的数目
			int length = 8;
			//获得当前页数
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//得到每页的开始基数
			int offset = (currentPage-1)*length;
			PageObject users = service.queryAllNospeakUserVO(offset, length);
			PageInfo pageInfo = new PageInfo();
			//设置当前页
			pageInfo.setCurrentPage(currentPage);
			//设置当前页条数
			pageInfo.setCurrentItemNums(users.getItems().size());
			//设置每页条数
			pageInfo.setItemNums(length);
			//计算总页数
			int allPages = 0;
			int totalCount = users.getTotalCount();
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
			//设置总页数
			pageInfo.setAllPages(allPages);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("users", users);
			LogUtil.info("取得禁言用户列表结束");
			return "getAllUser";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 查询所有锁定用户
	 */
	public String queryAllLockedUser(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("取得锁定用户列表开始");
			//设置每页的数目
			int length = 8;
			//获得当前页数
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//得到每页的开始基数
			int offset = (currentPage-1)*length;
			//调用业务层查询方法
			PageObject users = service.queryAllLockedUserVO(offset, length);
			PageInfo pageInfo = new PageInfo();
			//设置当前页
			pageInfo.setCurrentPage(currentPage);
			//设置当前页条数
			pageInfo.setCurrentItemNums(users.getItems().size());
			//设置每页条数
			pageInfo.setItemNums(length);
			//计算总页数
			int allPages = 0;
			int totalCount = users.getTotalCount();
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
			//设置总页数
			pageInfo.setAllPages(allPages);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("users", users);
			LogUtil.info("取得锁定用户列表结束");
			return "getAllUser";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 查看管理员
	 * @return
	 */
	public String viewManager(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("查看管理员开始");
			userVO= service.queryUserVOById(userVO);
			UserInfoVO info = service.queryUserInfoVO(userVO);
			userVO.setUserInfoVO(info);
			request.setAttribute("userVO", userVO);
			LogUtil.info("查看管理员结束");
			return "viewManager";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 查看用户
	 * @return
	 */
	public String viewUser(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			//记录日志
			LogUtil.info("查看用户开始");
			//调用业务层查询方法
			userVO = service.queryUserVOById(userVO);
			UserInfoVO info = service.queryUserInfoVO(userVO);
			userVO.setUserInfoVO(info);
			request.setAttribute("userVO", userVO);
			LogUtil.info("查看用户结束");
			return "viewUser";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 激活用户
	 */
	public void doActiveUser(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			//记录日志
			LogUtil.info("激活用户开始");
			//调用业务处激活方法
			service.doActiveUser(userVO);
			write(Constants.MSG_SUCCESS);
			LogUtil.info("激活用户结束");
		}else{
			writeJson("您已经退出登录，请重新登录", false);
		}
	}
	
	/**
	 * 禁言用户
	 */
	public void forbidUser(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("禁言用户开始");
			service.forbidUser(userVO);
			write(Constants.MSG_SUCCESS);
			LogUtil.info("禁言用户结束");
		}else{
			writeJson("您已经退出登录，请重新登录", false);
		}
	}
	
	/**
	 * 锁定用户
	 */
	public void lockUser(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("锁定用户开始");
			service.lockUser(userVO);
			write(Constants.MSG_SUCCESS);
			LogUtil.info("锁定用户结束");
		}else{
			writeJson("您已经退出登录，请重新登录", false);
		}
	}
	
	/**
	 * 解除管理员
	 */
	public void deleteManager(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			//记录日志
			LogUtil.info("解除管理员开始");
			//调用业务层方法
			service.deleteManager(userVO);
			write(Constants.MSG_SUCCESS);
			LogUtil.info("解除管理员结束");
		}else{
			writeJson("您已经退出登录，请重新登录", false);
		}
	}
	
	/**
	 * 设置管理员
	 */
	public void addManager(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			//记录日志
			LogUtil.info("添加管理员开始");
			//调用业务层方法
			service.addManager(userVO);
			write(Constants.MSG_SUCCESS);
			LogUtil.info("添加管理员结束");
		}else{
			writeJson("您已经退出登录，请重新登录", false);
		}
	}
	
	/**
	 * 检索用户（模糊查询）
	 */
	public String queryUser(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("检索用户开始");
			PageObject users = null;
			//设置每页的数目
			int length = 8;
			//获得当前页数
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//得到每页的开始基数
			int offset = (currentPage-1)*length;
			if("01".equals(type)){
				String username = userVO.getUsername();
				try {
					username ="%" + new String(username.getBytes("iso-8859-1"),"utf-8")+"%";
					userVO.setUsername(username);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				users = service.queryUserByNameFuzzy(userVO, offset, length);
			}else if("02".equals(type)){
				userVO.setIdStr("%"+userVO.getIdStr()+"%");
				users = service.queryUserByIdFuzzy(userVO, offset, length);
			}
			PageInfo pageInfo = new PageInfo();
			//设置当前页
			pageInfo.setCurrentPage(currentPage);
			//设置当前页条数
			pageInfo.setCurrentItemNums(users.getItems().size());
			//设置每页条数
			pageInfo.setItemNums(length);
			//计算总页数
			int allPages = 0;
			int totalCount = users.getTotalCount();
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
			//设置总页数
			pageInfo.setAllPages(allPages);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("users", users);
			LogUtil.info("检索用户结束");
			return "getAllUser";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 选择板块
	 * @return
	 */
	public String selectSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("选择板块开始");
			List<SectionVO> sections = sectionService.queryAllSectionVO();
			for(int i =0,size = sections.size();i<size;i++){
				SectionVO sectionVO = sections.get(i);
				List<SubSectionVO> subSections = sectionService.querySubSectionVOBySid(sectionVO);
				sectionVO.setSubSectionList(subSections);
				sections.set(i, sectionVO);
			}
			request.setAttribute("sections", sections);
			request.setAttribute("userVO", userVO);
			LogUtil.info("选择板块结束");
			return "selectSection";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 设置版主
	 */
	public void addSectionManager(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			//记录日志
			LogUtil.info("添加版主开始");
			//调用业务层方法
			service.addSectionManager(userVO);
			sectionService.addSectionManager(subSectionVO);
			write(Constants.MSG_SUCCESS);
			LogUtil.info("添加版主结束");
		}else{
			writeJson("您已经退出登录，请重新登录", false);
		}
	}
	
	/**
	 * 查询所有版主
	 */
	public String queryAllSectionManager(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("查询版主列表开始");
			//设置每页的数目
			int length = 8;
			//获得当前页数
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//得到每页的开始基数
			int offset = (currentPage-1)*length;
			PageObject users = service.queryAllSectionManager(offset, length);
			PageInfo pageInfo = new PageInfo();
			//设置当前页
			pageInfo.setCurrentPage(currentPage);
			//设置当前页条数
			pageInfo.setCurrentItemNums(users.getItems().size());
			//设置每页条数
			pageInfo.setItemNums(length);
			//计算总页数
			int allPages = 0;
			int totalCount = users.getTotalCount();
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
			//设置总页数
			pageInfo.setAllPages(allPages);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("users", users);
			LogUtil.info("查询版主列表结束");
			return "getAllSectionManager";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 解除版主
	 */
	public void deleteSectionManager(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("解除版主开始");
			service.deleteSectionManager(userVO);
			write(Constants.MSG_SUCCESS);
			LogUtil.info("解除版主结束");
		}else{
			writeJson("您已经退出登录，请重新登录", false);
		}
	}
}
