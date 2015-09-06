package cn.edu.ahut.action.admin_manage;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import cn.edu.ahut.base.action.BaseActionSupport;
import cn.edu.ahut.base.vo.PageInfo;
import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.service.admin_manage.SectionService;
import cn.edu.ahut.util.Constants;
import cn.edu.ahut.util.LogUtil;
import cn.edu.ahut.util.exception.BizException;
import cn.edu.ahut.vo.SectionVO;
import cn.edu.ahut.vo.SubSectionVO;
import cn.edu.ahut.vo.UserVO;

/**
 * 板块管理SectionAction
 * @author UML小组
 *
 */
public class SectionAction extends BaseActionSupport {
	private static final long serialVersionUID = 5964237717383699343L;

	/**
	 * Service引用
	 */
	private SectionService service;
	
	/**
	 * SectionVO对象
	 */
	private SectionVO sectionVO;
	
	/**
	 * SubSectionVO对象
	 */
	private SubSectionVO subSectionVO;
	
	/**
	 * 当前页码
	 */
	private String currentPage;
	
	/**
	 * 取得当前页码
	 * @return
	 */
	public String getCurrentPage() {
		return currentPage;
	}

	/**
	 * 设置当前页码
	 * @param currentPage
	 */
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	

	/**
	 * 取得父板块对象
	 * @return
	 */
	public SectionVO getSectionVO() {
		return sectionVO;
	}

	/**
	 * 设置父板块对象
	 * @param sectionVO
	 */
	public void setSectionVO(SectionVO sectionVO) {
		this.sectionVO = sectionVO;
	}

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
	 * 取得Service引用
	 * @return
	 */
	public SectionService getService() {
		return service;
	}

	/**
	 * 设置Service引用
	 * @param service
	 */
	public void setService(SectionService service) {
		this.service = service;
	}
	/***************************************************************
	 * 父板块管理开始
	 ****************************************************************/
	
	/**
	 * 取得父板块列表
	 * @return
	 */
	public String queryAllSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("取得父板块列表开始");
			//设置每页的数目
			int length = 8;
			//获得当前页数
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//得到每页的开始基数
			int offset = (currentPage-1)*length;
			PageObject sections = service.queryAllSectionForPage(offset, length);
			PageInfo pageInfo = new PageInfo();
			//设置当前页
			pageInfo.setCurrentPage(currentPage);
			//设置当前页条数
			pageInfo.setCurrentItemNums(sections.getItems().size());
			//设置每页条数
			pageInfo.setItemNums(length);
			//计算总页数
			int allPages = 0;
			int totalCount = sections.getTotalCount();
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
			//设置总页数
			pageInfo.setAllPages(allPages);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("sections", sections);
			LogUtil.info("取得父板块列表结束");
			return "getAllSection";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 添加父板块
	 * @return
	 */
	public void addSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("添加父板块开始");
			sectionVO.setCreateUser(user.getUsername());
			sectionVO.setCreatetime(new Timestamp(new Date().getTime()));
			try {
				service.insertSectionVO(sectionVO);
			} catch (BizException e) {
				writeJson(e.getMessage(), false);
			}
			write(Constants.MSG_SUCCESS);
			LogUtil.info("添加父板块结束");
		}else{
			writeJson("您已经退出了登录", false);
		}
	}
	
	/**
	 * 查看父板块
	 * @return
	 */
	public String viewSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("查看父板块开始");
			SectionVO vo =service.querySectionVO(sectionVO);
			request.setAttribute("sectionVO", vo);
			request.setAttribute("currentPage", currentPage);
			LogUtil.info("查看父板块结束");
			return "viewSection";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 删除父板块
	 * @return
	 */
	public String deleteSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("删除父板块开始");
			currentPage = request.getParameter("currentPage");
			service.deleteSectionVO(sectionVO);
			LogUtil.info("删除父板块结束");
			return "deleteSection";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 修改父板块
	 * @return
	 */
	public String editSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("修改父板块开始");
			sectionVO = service.querySectionVO(sectionVO);
			request.setAttribute("sectionVO", sectionVO);
			request.setAttribute("currentPage", currentPage);
			LogUtil.info("修改父板块结束");
			return "editSection";
		}else{
			return "logout";
		}
	}
	

	/**
	 * 提交修改
	 */
	public void confirmEditSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("提交修改开始");
			service.updateSectionVO(sectionVO);
			write(Constants.MSG_SUCCESS);
			LogUtil.info("提交修改结束");
		}else{
			writeJson("您已经退出了登录", false);
		}
	}
	
	/***************************************************************
	 * 子版块管理开始
	 ****************************************************************/
	/**
	 * 取得子板块列表
	 * @return
	 */
	public String queryAllSubSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("取得子版块列表开始");
			//设置每页的数目
			int length = 8;
			//获得当前页数
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//得到每页的开始基数
			int offset = (currentPage-1)*length;
			PageObject subSections = service.queryAllSubSectionForPage(offset, length);
			PageInfo pageInfo = new PageInfo();
			//设置当前页
			pageInfo.setCurrentPage(currentPage);
			//设置当前页条数
			pageInfo.setCurrentItemNums(subSections.getItems().size());
			//设置每页条数
			pageInfo.setItemNums(length);
			//计算总页数
			int allPages = 0;
			int totalCount = subSections.getTotalCount();
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
			//设置总页数
			pageInfo.setAllPages(allPages);
			request.setAttribute("subSections", subSections);
			request.setAttribute("pageInfo", pageInfo);
			LogUtil.info("取得子版块列表结束");
			return "getAllSubSection";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 查看子板块
	 * @return
	 */
	public String viewSubSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("查看子版块开始");
			SubSectionVO vo =service.querySubSectionVO(subSectionVO);
			request.setAttribute("subSectionVO", vo);
			request.setAttribute("currentPage", currentPage);
			LogUtil.info("查看子版块结束");
			return "viewSubSection";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 删除子板块
	 * @return
	 */
	public String deleteSubSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("删除子板块开始");
			currentPage = request.getParameter("currentPage");
			service.deleteSubSectionVO(subSectionVO);
			LogUtil.info("删除子板块结束");
			return "deleteSubSection";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 转到子版块添加页面
	 * @return
	 */
	public String toAddSubSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			List<SectionVO> sections = service.queryAllSectionVO();
			request.setAttribute("sections", sections);
			return "toAddSubSection";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 添加子板块
	 * @return
	 */
	public void addSubSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("添加子板块开始");
			subSectionVO.setCreateUser(user.getUsername());
			subSectionVO.setCreatetime(new Timestamp(new Date().getTime()));
			try {
				service.insertSubSectionVO(subSectionVO);
			} catch (BizException e) {
				writeJson(e.getMessage(), false);
			}
			write(Constants.MSG_SUCCESS);
			LogUtil.info("添加子板块结束");
		}else{
			writeJson("您已经退出了登录", false);
		}
	}
	
	/**
	 * 修改子板块
	 * @return
	 */
	public String editSubSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("修改子板块开始");
			subSectionVO = service.querySubSectionVO(subSectionVO);
			request.setAttribute("subSectionVO", subSectionVO);
			request.setAttribute("currentPage", currentPage);
			List<SectionVO> sections = service.queryAllSectionVO();
			request.setAttribute("sections", sections);
			LogUtil.info("修改子板块结束");
			return "editSubSection";
		}else{
			return "logout";
		}
	}
	

	/**
	 * 提交修改
	 */
	public void confirmEditSubSection(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("提交修改开始");
			service.updateSubSectionVO(subSectionVO);
			write(Constants.MSG_SUCCESS);
			LogUtil.info("提交修改结束");
		}else{
			writeJson("您已经退出了登录", false);
		}
	}
	
	/**
	 * 根据父板块查询子版块
	 * @return
	 */
	public String querySubSectionBySid(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("查看子版块列表开始");
			//设置每页的数目
			int length = 8;
			//获得当前页数
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//得到每页的开始基数
			int offset = (currentPage-1)*length;
			PageObject subSections = service.querySubSectionVOBySid(sectionVO, offset, length);
			PageInfo pageInfo = new PageInfo();
			//设置当前页
			pageInfo.setCurrentPage(currentPage);
			//设置当前页条数
			pageInfo.setCurrentItemNums(subSections.getItems().size());
			//设置每页条数
			pageInfo.setItemNums(length);
			//计算总页数
			int allPages = 0;
			int totalCount = subSections.getTotalCount();
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
			//设置总页数
			pageInfo.setAllPages(allPages);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("subSections", subSections);
			LogUtil.info("查看子版块列表结束");
			return "getAllSubSectionBySid";
		}else{
			return "logout";
		}
	}
}
