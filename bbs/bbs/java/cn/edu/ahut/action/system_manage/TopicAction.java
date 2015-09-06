package cn.edu.ahut.action.system_manage;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.ahut.base.action.BaseActionSupport;
import cn.edu.ahut.base.vo.PageInfo;
import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.service.admin_manage.SectionService;
import cn.edu.ahut.service.system_manage.ImageService;
import cn.edu.ahut.service.system_manage.TopicService;
import cn.edu.ahut.service.system_manage.UserService;
import cn.edu.ahut.util.Constants;
import cn.edu.ahut.util.DateUtil;
import cn.edu.ahut.util.LogUtil;
import cn.edu.ahut.util.StringUtil;
import cn.edu.ahut.vo.ImageVO;
import cn.edu.ahut.vo.ReplyVO;
import cn.edu.ahut.vo.SubSectionVO;
import cn.edu.ahut.vo.TopicVO;
import cn.edu.ahut.vo.UserInfoVO;
import cn.edu.ahut.vo.UserVO;

/**
 * 主题帖TopicAction
 * @author UML小组
 *
 */
public class TopicAction extends BaseActionSupport {

	private static final long serialVersionUID = -8145118225603870397L;
	
	/**
	 * topicService对象
	 */
	private TopicService topicService;
	
	/**
	 * userService对象
	 */
	private UserService userService;
	
	/**
	 * sectionService对象
	 */
	private SectionService sectionService;
	
	/**
	 * 取得userService对象
	 * @return
	 */
	public UserService getUserService() {
		return userService;
	}

	/**
	 * 设置userService对象
	 * @param userService
	 */
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/**
	 * 主题帖对象
	 */
	private TopicVO topicVO;
	
	/**
	 * 回帖对象
	 */
	private ReplyVO replyVO;
	
	/**
	 * 取得回帖对象
	 * @return
	 */
	public ReplyVO getReplyVO() {
		return replyVO;
	}

	/**
	 * 设置回帖对象
	 * @param replyVO
	 */
	public void setReplyVO(ReplyVO replyVO) {
		this.replyVO = replyVO;
	}

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
	 * 取得主题帖对象
	 * @return
	 */
	public TopicVO getTopicVO() {
		return topicVO;
	}

	/**
	 * 设置主题帖对象
	 * @param topicVO
	 */
	public void setTopicVO(TopicVO topicVO) {
		this.topicVO = topicVO;
	}

	/**
	 * 取得topicService对象
	 * @return
	 */
	public TopicService getTopicService() {
		return topicService;
	}

	/**
	 * 设置topicService对象
	 * @param topicService
	 */
	public void setTopicService(TopicService topicService) {
		this.topicService = topicService;
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

	//图片上传部分
	/**
	 * 图片对象
	 */
	private File imgFile;
	
	/**
	 * 图片宽度
	 */
	private String imgWidth;
	
	/**
	 * 图片高度
	 */
	private String imgHeight;
	
	/**
	 * 图片对齐方式
	 */
	private String align;
	
	/**
	 * 图片标题
	 */
	private String imgTitle;
	
	public File getImgFile() {
		return imgFile;
	}

	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}

	public String getImgWidth() {
		return imgWidth;
	}

	public void setImgWidth(String imgWidth) {
		this.imgWidth = imgWidth;
	}

	public String getImgHeight() {
		return imgHeight;
	}

	public void setImgHeight(String imgHeight) {
		this.imgHeight = imgHeight;
	}

	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public String getImgTitle() {
		return imgTitle;
	}

	public void setImgTitle(String imgTitle) {
		this.imgTitle = imgTitle;
	}

	private int uid;
	
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
	
	private int tid;
	private int sid;
	private int currentPage;

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	private ImageService imageService;

	public ImageService getImageService() {
		return imageService;
	}

	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}

	/**
	 * 发帖
	 */
	@SuppressWarnings("unchecked")
	public String publishTopic(){
		UserVO user = (UserVO) session.getAttribute(Constants.USER_KEY);
		if(user!=null){
			LogUtil.info("发帖开始");
			//设置发帖人ID
			topicVO.setUid(user.getId());
			//初始化发帖时间
			Date date1 = new Date();//获取当前时间
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String str = sdf.format(date1);//时间存储为字符串
			System.out.println(str);
			Timestamp.valueOf(str);//转换时间字符串为Timestamp
			topicVO.setSendTime(Timestamp.valueOf(str));
			topicVO.setSendTimeStr(DateUtil.formatDate(new Date(),"yyyy-MM-dd"));
			LogUtil.info(topicVO.getSendTimeStr());
			//初始化帖子状态01:正常 02:屏蔽
			topicVO.setTopicStatus("01");
			//插入新帖
			topicService.insertTopicVO(topicVO);
			uid = user.getId();
			topicVO = topicService.queryTopicByTime(topicVO);
			tid = topicVO.getId();
			sid = topicVO.getSid();
			currentPage = 1;
			
			String webBathDir = "http://" + request.getServerName() + ":"+ request.getServerPort() + request.getContextPath() 
    		+"/upload/articleimage/";
			//删除没用到的图片
			ArrayList<String> imageList = (ArrayList<String>) session.getAttribute("imageList");
			if(imageList!=null){
				int size = imageList.size();
				File image = null;
				if(size!=0){
					for (int i = 0; i < size; i++) {
						String imageName = imageList.get(i);
						String url = request.getSession().getServletContext().getRealPath("/")+"\\upload\\articleimage\\" + imageName; 
						//如果正文中没用到删除
						if(!topicVO.getContent().contains(imageName)){
							image = new File(url);
							if(image.isFile()){
								image.delete();
							}
						}else{//正文中用到的照片放入社区照片中
							ImageVO img = new ImageVO();
							url = webBathDir + imageName;
							img.setUrl(url);
							imageService.insertImageVO(img);
						}
					}
				}
				imageList = null;
				session.setAttribute("imageList", imageList);
			}
			LogUtil.info("发帖结束");
			return "publishTopic";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 发布完成后的操作
	 * @return
	 */
	public String afterPublishTopic(){
		TopicVO vo =  topicService.queryTopicByTime(topicVO);
		UserVO userVO = new UserVO();
		userVO.setId(vo.getUid());
		userVO =  userService.queryUserVOById(userVO);
		UserInfoVO userInfo  =  userService.queryUserInfoVO(userVO);
		userVO.setUserInfoVO(userInfo);
		vo.setUserVO(userVO);
		request.setAttribute("topicVO", vo);
		return "viewTopic";
	}
	
	/**
	 * 预览主题帖子
	 */
	public String scanTopic(){
		UserVO user = (UserVO) session.getAttribute(Constants.USER_KEY);
		if(user!=null){
			LogUtil.info("预览帖子开始");
			//设置发帖人ID
			topicVO.setUid(user.getId());
			//初始化发帖时间
			topicVO.setSendTime(new Timestamp(new Date().getTime()));
			topicVO.setSendTimeStr(DateUtil.formatDate(new Date(),"yyyy-MM-dd"));
			//初始化帖子状态01:正常 02:屏蔽
			topicVO.setTopicStatus("01");
			request.setAttribute("topicVO", topicVO);
			LogUtil.info("预览帖子结束");
			return "scanTopic";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 预览回复帖子
	 */
	public String scanReply(){
		UserVO user = (UserVO) session.getAttribute(Constants.USER_KEY);
		if(user!=null){
			LogUtil.info("预览帖子开始");
			//设置发帖人ID
			replyVO.setUid(user.getId());
			//初始化发帖时间
			replyVO.setSendTime(new Timestamp(new Date().getTime()));
			replyVO.setSendTimeStr(DateUtil.formatDate(new Date(),"yyyy-MM-dd"));
			request.setAttribute("topicVO", replyVO);
			LogUtil.info("预览帖子结束");
			return "scanTopic";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 回帖
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String replyTopic(){
		UserVO user = (UserVO) session.getAttribute(Constants.USER_KEY);
		if(user!=null){
			LogUtil.info("回复帖子开始");
			//设置回帖的发帖人
			replyVO.setUid(user.getId());
			//设置回帖的主题帖ID
			replyVO.setTid(tid);
			//设置回帖的时间
			replyVO.setSendTime(new Timestamp(new Date().getTime()));
			//添加回帖
			topicService.insertReplyVO(replyVO);
			topicVO =  new TopicVO();
			topicVO.setId(tid);
			//设置每页的数目
			int length = 4;
			//计算总页数
			int allPages = 0;
			int totalCount = topicService.queryReplyNumTid(topicVO);
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
			currentPage = allPages;
			//更新回复数
			topicVO.setReplyNum(topicService.queryReplyNumTid(topicVO));
			topicService.updateReplyNum(topicVO);
			//更新最后回复时间
			topicVO.setLastReplyTime(new Timestamp(new Date().getTime()));
			topicService.updateLastReplyTime(topicVO);
			
			String webBathDir = "http://" + request.getServerName() + ":"+ request.getServerPort() + request.getContextPath() 
    		+"/upload/articleimage/";
			//删除没用到的图片
			ArrayList<String> imageList = (ArrayList<String>) session.getAttribute("imageList");
			if(imageList!=null){
				int size = imageList.size();
				File image = null;
				if(size!=0){
					for (int i = 0; i < size; i++) {
						String imageName = imageList.get(i);
						String url = request.getSession().getServletContext().getRealPath("/")+"\\upload\\articleimage\\" + imageName; 
						//如果正文中没用到删除
						if(!replyVO.getContent().contains(imageName)){
							image = new File(url);
							if(image.isFile()){
								image.delete();
							}
						}else{//正文中用到的照片放入社区照片中
							ImageVO img = new ImageVO();
							url = webBathDir + imageName;
							img.setUrl(url);
							imageService.insertImageVO(img);
						}
					}
				}
				imageList = null;
				session.setAttribute("imageList", imageList);
			}
			LogUtil.info("回复帖子结束");
			return "replyTopic";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 上传图片
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String uploadImage(){
		UserVO user = (UserVO) session.getAttribute(Constants.USER_KEY);
		String imageName = user.getId()+"_topic_"+new Date().getTime()+Math.random()*10000+".jpg";
		File dirPath =new File(request.getSession().getServletContext().getRealPath("/")+"\\upload\\articleimage\\");
		//如果文件夹不存在，创建它
		if(!dirPath.exists()){
			dirPath.mkdirs();
		}
		//文件存放路径
		String newPath = dirPath+"\\"+imageName;   
		//上传文件
		try {
			copy(imgFile, newPath);
		} catch (Exception e1) {
			e1.printStackTrace();
		} 
		//图片若大于700*500,改变显示为700*500
		try {
			BufferedImage   image   =   ImageIO.read(new File(newPath));
			int width = image.getWidth();
			int height = image.getHeight();
			if(width>700){
				imgWidth = "700";
				height = image.getHeight()*700/image.getWidth();
			}
			/*if(height>500){
				imgHeight = "500";
			}*/
		} catch (IOException e1) {
			e1.printStackTrace();
		}   

		
		String id = "content";   
        String url = "http://" + request.getServerName() + ":"+ request.getServerPort() + request.getContextPath() 
        		+"/upload/articleimage/" + imageName;   

		String border = "0"; 
		String result = 
			"<script type=\"text/javaScript\">parent.KE.plugin[\"image\"].insert(\""  
                + id   
                + "\",\""  
                + url   
                + "\",\""  
                + imgTitle   
                + "\",\""  
                + imgWidth   
                + "\",\"" 
                + imgHeight 
                + "\",\"" 
                + border
                + "\",\""
                + align
                +"\"" 
                +");</script>";   
		PrintWriter out = null;
		try {
			out = encodehead(request, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.write(result);
		out.close(); 
		//把文件名保存下来，如果发帖的时候正文里没这个图片，则把图片删除
		ArrayList<String> imageList = (ArrayList<String>) session.getAttribute("imageList");
		if(imageList==null){
			imageList = new ArrayList<String>();
			session.setAttribute("imageList", imageList);
		}
		imageList.add(imageName);
		return null;
	}
	
	/**  
     * 拷贝文件  
     *   
     * @param upload文件流  
     * @param newPath新文件路径和名称  
     * @throws Exception  
     */  
	private void copy(File upload, String newPath) throws Exception {   
        FileOutputStream fos = new FileOutputStream(newPath);   
        FileInputStream fis = new FileInputStream(upload);   
        byte[] buffer = new byte[1024];   
        int len = 0;   
        while ((len = fis.read(buffer)) > 0) {   
            fos.write(buffer, 0, len);   
        }   
        fos.close();   
        fis.close();   
    }  
	
	/**
	 * Ajax辅助方法 获取 PrintWriter
	 * @return
	 * @throws IOException 
	 * @throws IOException 
	 * request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	 */
	private PrintWriter encodehead(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		return response.getWriter();
	}

	/**
	 * 得到回复贴的主题帖信息
	 * @return
	 */
	public String prepareReply(){
		UserVO user = (UserVO) session.getAttribute(Constants.USER_KEY);
		if(user!=null){
			//查询子版块
			subSectionVO = sectionService.querySubSectionVO(subSectionVO);
			topicVO =  topicService.queryTopicById(topicVO);
			request.setAttribute("topicVO", topicVO);
			request.setAttribute("subSectionVO", subSectionVO);
			return "prepareReply";
		}else{
			return "logout";
		}
	}
	
	/**
	 * 查询特定子板块下的所有主题帖
	 */
	@SuppressWarnings("unchecked")
	public String queryAllTopicBySid(){
		LogUtil.info("取得主题帖列表开始");
		//查询子版块
		subSectionVO = sectionService.querySubSectionVO(subSectionVO);
		//版主信息
		String managerId = subSectionVO.getManagerId();
		UserVO tempUserVO = new UserVO();
		if(!StringUtil.isNullOrEmpty(managerId)){
			int id = Integer.parseInt(managerId);
			tempUserVO.setId(id);
			tempUserVO =  userService.queryUserVOById(tempUserVO);
		}
		subSectionVO.setManager(tempUserVO);
		//设置每页的数目
		int length = 12;
		//获得当前页数
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		//得到每页的开始基数
		int offset = (currentPage-1)*length;
		PageObject topics = topicService.queryAllTopicVO(subSectionVO, offset, length);
		//设置每个主题帖的作者信息
		List<TopicVO> topicsList = topics.getItems();
		for(int i=0,size=topicsList.size();i<size;i++){
			TopicVO topicVO =  topicsList.get(i);
			//设置最后回帖信息
			replyVO = topicService.queryLastReplyByTid(topicVO);
			if(replyVO!=null){
				UserVO userVO = new UserVO();
				userVO.setId(replyVO.getUid());
				userVO = userService.queryUserVOById(userVO);
				replyVO.setUserVO(userVO);
			}
			topicVO.setLastReplyVO(replyVO);
			//设置作者信息
			UserVO userVO =new UserVO();
			userVO.setId(topicVO.getUid());
			userVO = userService.queryUserVOById(userVO);
			topicVO.setUserVO(userVO);
			topicsList.set(i, topicVO);
		}
		topics.setItems(topicsList);
		
		PageInfo pageInfo = new PageInfo();
		//设置当前页
		pageInfo.setCurrentPage(currentPage);
		//设置当前页条数
		pageInfo.setCurrentItemNums(topics.getItems().size());
		//设置每页条数
		pageInfo.setItemNums(length);
		//计算总页数
		int allPages = 0;
		int totalCount = topics.getTotalCount();
		if(totalCount%length==0){
			allPages = totalCount/length;
		}else{
			allPages = totalCount/length +1;
		}
		//设置总页数
		pageInfo.setAllPages(allPages);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("topics", topics);
		request.setAttribute("subSectionVO", subSectionVO);
		LogUtil.info("取得主题帖列表结束");
		return "queryAllTopicBySid";
	}
	
	/**
	 * 查询特定主题帖的所有回帖
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String viewReply(){
		LogUtil.info("取得回复帖列表开始");
		//查询子版块
		subSectionVO = sectionService.querySubSectionVO(subSectionVO);
		//根据ID查询主题帖
		topicVO = topicService.queryTopicById(topicVO);
		//更新点击数
		topicVO.setClickNum(topicVO.getClickNum()+1);
		topicService.updateClickNum(topicVO);
		//设置主题帖作者信息
		UserVO userVO = new UserVO();
		userVO.setId(topicVO.getUid());
		userVO = userService.queryUserVOById(userVO);
		UserInfoVO userInfoVO = userService.queryUserInfoVO(userVO);
		userVO.setUserInfoVO(userInfoVO);
		topicVO.setUserVO(userVO);
		
		//查询改主题帖下的所有回帖
		//设置每页的数目
		int length = 4;
		//获得当前页数
//		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		//得到每页的开始基数
		int offset = (currentPage-1)*length;
		//调用业务层的方法
		PageObject replys = topicService.queryReplyByTid(topicVO, offset, length);
		
		//设置每个回复帖的作者信息
		List<ReplyVO> replysList = replys.getItems();
		for(int i=0,size=replysList.size();i<size;i++){
			ReplyVO replyVO =  replysList.get(i);
			userVO.setId(replyVO.getUid());
			userVO = userService.queryUserVOById(userVO);
			userInfoVO = userService.queryUserInfoVO(userVO);
			userVO.setUserInfoVO(userInfoVO);
			replyVO.setUserVO(userVO);
			replysList.set(i, replyVO);
		}
		replys.setItems(replysList);
		
		//创建分页对象
		PageInfo pageInfo = new PageInfo();
		//设置当前页
		pageInfo.setCurrentPage(currentPage);
		//设置当前页条数
		pageInfo.setCurrentItemNums(replys.getItems().size());
		//设置每页条数
		pageInfo.setItemNums(length);
		//计算总页数
		int allPages = 1;
		int totalCount = replys.getTotalCount();
		if(totalCount!=0){
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
		}
		
		//设置总页数
		pageInfo.setAllPages(allPages);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("replys", replys);
		request.setAttribute("topicVO", topicVO);
		request.setAttribute("subSectionVO", subSectionVO);
		LogUtil.info("取得回复帖列表开始");
		return "viewReply";
	}
	
	/**
	 * 定位到特定回帖
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String locateViewReply(){
		LogUtil.info("取得回复帖列表开始");
		
		//根据ID查询主题帖
		topicVO = topicService.queryTopicById(topicVO);
		//更新点击数
		topicVO.setClickNum(topicVO.getClickNum()+1);
		topicService.updateClickNum(topicVO);
		//查询子版块
		subSectionVO = new SubSectionVO();
		subSectionVO.setId(topicVO.getSid());
		subSectionVO = sectionService.querySubSectionVO(subSectionVO);
		//设置主题帖作者信息
		UserVO userVO = new UserVO();
		userVO.setId(topicVO.getUid());
		userVO = userService.queryUserVOById(userVO);
		UserInfoVO userInfoVO = userService.queryUserInfoVO(userVO);
		userVO.setUserInfoVO(userInfoVO);
		topicVO.setUserVO(userVO);
		
		//查询改主题帖下的所有回帖
		//设置每页的数目
		int length = 4;
		//获得当前页数
//		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		//定位所在页数
		//创建分页对象
		PageInfo pageInfo = new PageInfo();
		replyVO.setTid(topicVO.getId());
		int sort =  topicService.queryReplySortById(replyVO);
		currentPage = pageInfo.returnCurrentPage(length, sort);
		//得到每页的开始基数
		int offset = (currentPage-1)*length;
		//调用业务层的方法
		PageObject replys = topicService.queryReplyByTid(topicVO, offset, length);
		
		//设置每个回复帖的作者信息
		List<ReplyVO> replysList = replys.getItems();
		for(int i=0,size=replysList.size();i<size;i++){
			ReplyVO replyVO =  replysList.get(i);
			userVO.setId(replyVO.getUid());
			userVO = userService.queryUserVOById(userVO);
			userInfoVO = userService.queryUserInfoVO(userVO);
			userVO.setUserInfoVO(userInfoVO);
			replyVO.setUserVO(userVO);
			replysList.set(i, replyVO);
		}
		replys.setItems(replysList);
		//设置当前页
		pageInfo.setCurrentPage(currentPage);
		//设置当前页条数
		pageInfo.setCurrentItemNums(replys.getItems().size());
		//设置每页条数
		pageInfo.setItemNums(length);
		//计算总页数
		int allPages = 1;
		int totalCount = replys.getTotalCount();
		if(totalCount!=0){
			if(totalCount%length==0){
				allPages = totalCount/length;
			}else{
				allPages = totalCount/length +1;
			}
		}
		
		//设置总页数
		pageInfo.setAllPages(allPages);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("replys", replys);
		request.setAttribute("topicVO", topicVO);
		request.setAttribute("subSectionVO", subSectionVO);
		LogUtil.info("取得回复帖列表开始");
		return "viewReply";
	}
}
