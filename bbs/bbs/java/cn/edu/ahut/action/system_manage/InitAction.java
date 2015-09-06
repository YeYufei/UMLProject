package cn.edu.ahut.action.system_manage;

import java.util.List;

import cn.edu.ahut.base.action.BaseActionSupport;
import cn.edu.ahut.service.admin_manage.NoticeService;
import cn.edu.ahut.service.admin_manage.SectionService;
import cn.edu.ahut.service.system_manage.ImageService;
import cn.edu.ahut.service.system_manage.TopicService;
import cn.edu.ahut.service.system_manage.UserService;
import cn.edu.ahut.util.LogUtil;
import cn.edu.ahut.util.StringUtil;
import cn.edu.ahut.vo.ImageVO;
import cn.edu.ahut.vo.NoticeVO;
import cn.edu.ahut.vo.ReplyVO;
import cn.edu.ahut.vo.SectionVO;
import cn.edu.ahut.vo.SubSectionVO;
import cn.edu.ahut.vo.TopicVO;
import cn.edu.ahut.vo.UserVO;

/**
 * 系统页面初始化Action
 * @author UML小组
 *
 */
public class InitAction extends BaseActionSupport {
	private static final long serialVersionUID = -143050769679831976L;
	
	/**
	 * sectionService对象
	 */
	private SectionService sectionService;
	/**
	 * noticeService对象
	 */
	private NoticeService noticeService;
	/**
	 * topicService对象
	 */
	private TopicService topicService;
	/**
	 * userService对象
	 */
	private UserService userService;
	
	
	private ImageService imageService;
	
	public ImageService getImageService() {
		return imageService;
	}

	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}

	/**
	 * noticeVO对象
	 */
	private NoticeVO noticeVO;
	
	/**
	 * 取得noticeVO对象
	 * @return
	 */
	public NoticeVO getNoticeVO() {
		return noticeVO;
	}

	/**
	 * 设置noticeVO对象
	 * @param noticeVO
	 */
	public void setNoticeVO(NoticeVO noticeVO) {
		this.noticeVO = noticeVO;
	}

	/**
	 * 取得NoticeService对象
	 * @return
	 */
	public NoticeService getNoticeService() {
		return noticeService;
	}

	/**
	 * 设置NoticeService对象
	 * @param noticeService
	 */
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	/**
	 * 取得TopicService对象
	 * @return
	 */
	public TopicService getTopicService() {
		return topicService;
	}
	/**
	 * 设置TopicService对象
	 * @param topicService
	 */
	public void setTopicService(TopicService topicService) {
		this.topicService = topicService;
	}

	/**
	 * 取得UserService对象
	 * @return
	 */
	public UserService getUserService() {
		return userService;
	}
	/**
	 * 设置UserService对象
	 * @param userService
	 */
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/**
	 * 取得sectionService对象
	 * @return
	 */
	public SectionService getSectionService() {
		return sectionService;
	}

	/**
	 * 设置sectionService对象
	 * @param sectionService
	 */
	public void setSectionService(SectionService sectionService) {
		this.sectionService = sectionService;
	}

	/**
	 * 页面初始化
	 * @return
	 */
	public String init(){
		LogUtil.info("初始化主页面开始");
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
		session.setAttribute("sections", sections);
		//把公告信息带过去
		List<NoticeVO> notices = noticeService.queryLatest5NoticeVO();
		size =  notices.size();
		if(size==0){
			notices = null;
		}
		session.setAttribute("notices", notices);
		
		//父板块列表
		List<SectionVO> allSections =  sectionService.queryAllSectionVO();
		//得到每个父板块下面的所有子版块
		for(int i=0,size_1=allSections.size();i<size_1;i++){
			SectionVO tempSectionVO = allSections.get(i);
			List<SubSectionVO> subSectionList = sectionService.querySubSectionVOBySid(tempSectionVO);
			//设置子版块的一些信息
			for(int j=0,size_2=subSectionList.size();j<size_2;j++){
				SubSectionVO tempSubSectionVO = subSectionList.get(j);
				//设置主题数和文章数
				SubSectionVO tempVO_1 = topicService.queryTopicNum(tempSubSectionVO);
				SubSectionVO tempVO_2 = topicService.queryArticleNum(tempSubSectionVO);
				tempSubSectionVO.setTopicNum(tempVO_1.getTopicNum());
				tempSubSectionVO.setArticleNum(tempVO_2.getArticleNum());
				
				//设置最新主题
				TopicVO tempVO = topicService.queryLatestTopicVO(tempSubSectionVO);
				tempSubSectionVO.setTopicVO(tempVO);
				
				//得到每个子版快的版主信息
				if(!StringUtil.isNullOrEmpty(tempSubSectionVO.getManagerId())){
					UserVO tempUserVO = new UserVO();
					int id = Integer.parseInt(tempSubSectionVO.getManagerId());
					tempUserVO.setId(id);
					tempUserVO =  userService.queryUserVOById(tempUserVO);
					tempSubSectionVO.setManager(tempUserVO);
					subSectionList.set(j, tempSubSectionVO);
				}
			}
			tempSectionVO.setSubSectionList(subSectionList);
			allSections.set(i, tempSectionVO);
		}
		request.setAttribute("allSections", allSections);
		
		//查询最新的10条主题和回复
		List<TopicVO> latestTopicVOList = topicService.queryLatest10TopicVO();
		List<ReplyVO> latestReplyVOList = topicService.queryLatest10ReplyVO();
		request.setAttribute("latestTopicVOList", latestTopicVOList);
		request.setAttribute("latestReplyVOList", latestReplyVOList);
		
		
		//查询社区最新图片
		List<ImageVO> imageList = imageService.queryImageVO();
		if(imageList.size()==0){
			imageList = null;
		}
		request.setAttribute("imageList", imageList);
		
		LogUtil.info("初始化主页面结束");
		//
		return "init";
	}
	
	/**
	 * 查看公告详细信息
	 * @return
	 */
	public String viewDetailNotice(){
		NoticeVO tempVO = noticeService.queryNoticeVO(noticeVO);
		request.setAttribute("noticeVO", tempVO);
		return "viewDetailNotice";
	}
	
}
