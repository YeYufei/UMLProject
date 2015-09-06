package cn.edu.ahut.action.admin_manage;

import cn.edu.ahut.base.action.BaseActionSupport;
import cn.edu.ahut.base.vo.PageInfo;
import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.service.admin_manage.NoticeService;
import cn.edu.ahut.util.Constants;
import cn.edu.ahut.util.LogUtil;
import cn.edu.ahut.vo.NoticeVO;
import cn.edu.ahut.vo.UserVO;

/**
 * 公告管理NoticeAction
 * @author UML小组
 *
 */
public class NoticeAction extends BaseActionSupport {

	private static final long serialVersionUID = -1280271169186690987L;

	/**
	 * NoticeService引用
	 */
	private NoticeService service;
	
	/**
	 * NoticeVO对象引用
	 */
	private NoticeVO noticeVO;
	
	/**
	 * 当前页码
	 */
	private String currentPage;
	
	/**
	 * 取得NoticeService引用
	 * @return
	 */
	public NoticeService getService() {
		return service;
	}

	/**
	 * 设置NoticeService引用
	 * @param service
	 */
	public void setService(NoticeService service) {
		this.service = service;
	}


	/**
	 * 取得NoticeVO对象引用
	 * @return
	 */
	public NoticeVO getNoticeVO() {
		return noticeVO;
	}

	/**
	 * 设置NoticeVO对象引用
	 * @param noticeVO
	 */
	public void setNoticeVO(NoticeVO noticeVO) {
		this.noticeVO = noticeVO;
	}
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
	 * 取得全部公告
	 * @return
	 */
	public String queryAllNotice(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("查询全部公告开始");
			//设置每页的最大数目
			int length = 8;
			//获得当前页数
			int currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//得到每页的开始基数
			int offset = (currentPage-1)*length;
			PageObject notices = service.queryAllNoticeVO(offset, length);
			PageInfo pageInfo = new PageInfo();
			//设置当前页
			pageInfo.setCurrentPage(currentPage);
			//设置当前页条数
			pageInfo.setCurrentItemNums(notices.getItems().size());
			//设置每页条数
			pageInfo.setItemNums(length);
			//计算总页数
			int allPages = 0;
			int totalCount = notices.getTotalCount();
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
			//设置总页数
			pageInfo.setAllPages(allPages);
			request.setAttribute("notices", notices);
			request.setAttribute("pageInfo", pageInfo);
			LogUtil.info("查询全部公告结束");
			return "getAllNotice";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 删除公告
	 * @return
	 */
	public String deleteNotice(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("删除公告开始");
			currentPage = request.getParameter("currentPage");
			service.deleteNoticeVO(noticeVO);
			LogUtil.info("删除公告结束");
			return "deleteNotice";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 查看公告
	 * @return
	 */
	public String viewNotice(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("查看公告开始");
			NoticeVO vo = service.queryNoticeVO(noticeVO);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("noticeVO", vo);
			LogUtil.info("查看公告结束");
			return "viewNotice";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 添加公告
	 * @return
	 */
	public void addNotice(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("添加公告开始");
			service.insertNoticeVO(noticeVO);
			write(Constants.MSG_SUCCESS);
			LogUtil.info("添加公告结束");
		}else{
			writeJson("您已经退出了登录", false);
		}
	}
	
	/**
	 * 修改公告
	 * @return
	 */
	public String editNotice(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("修改公告开始");
			noticeVO = service.queryNoticeVO(noticeVO);
			request.setAttribute("noticeVO", noticeVO);
			request.setAttribute("currentPage", currentPage);
			LogUtil.info("修改公告结束");
			return "editNotice";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 提交修改
	 */
	public void confirmEditNotice(){
		UserVO user = (UserVO) session.getAttribute(Constants.ADMIN_KEY);
		if(user!=null){
			LogUtil.info("提交修改开始");
			service.updateNoticeVO(noticeVO);
			write(Constants.MSG_SUCCESS);
			LogUtil.info("提交修改结束");
		}else{
			writeJson("您已经退出了登录", false);
		}
	}
}
