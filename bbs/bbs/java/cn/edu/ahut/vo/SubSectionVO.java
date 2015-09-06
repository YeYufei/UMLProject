package cn.edu.ahut.vo;


/**
 * 子版块
 * @author UML小组
 *
 */
public class SubSectionVO extends BaseSectionVO{
	private static final long serialVersionUID = -4991427023495907005L;

	/**
	 * 父板块ID 外键
	 */
	private int sid;
	
	/**
	 * 版主ID
	 */
	private String managerId;
	
	/**
	 * 父板块名称
	 */
	private String sectionName;
	
	/**
	 * 版主对象
	 */
	private UserVO manager;
	
	/**
	 * 主题个数
	 */
	private int topicNum;
	
	/**
	 * 文章个数
	 */
	private int articleNum;
	
	private TopicVO topicVO;
	
	private ReplyVO replyVO;
	
	
	
	public int getTopicNum() {
		return topicNum;
	}

	public void setTopicNum(int topicNum) {
		this.topicNum = topicNum;
	}

	public int getArticleNum() {
		return articleNum;
	}

	public void setArticleNum(int articleNum) {
		this.articleNum = articleNum;
	}

	public TopicVO getTopicVO() {
		return topicVO;
	}

	public void setTopicVO(TopicVO topicVO) {
		this.topicVO = topicVO;
	}

	public ReplyVO getReplyVO() {
		return replyVO;
	}

	public void setReplyVO(ReplyVO replyVO) {
		this.replyVO = replyVO;
	}

	/**
	 * 取得版主对象	
	 * @return
	 */
	public UserVO getManager() {
		return manager;
	}

	/**
	 * 设置版主对象
	 * @param manager
	 */
	public void setManager(UserVO manager) {
		this.manager = manager;
	}

	/**
	 * 取得父板块ID
	 * @return
	 */
	public int getSid() {
		return sid;
	}

	/**
	 * 设置父板块ID
	 * @param sid
	 */
	public void setSid(int sid) {
		this.sid = sid;
	}

	/**
	 * 取得父板块名称
	 * @return
	 */
	public String getSectionName() {
		return sectionName;
	}

	/**
	 * 取得父板块名称
	 * @param sectionName
	 */
	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}
	
	/**
	 * 取得版主ID
	 * @return
	 */
	public String getManagerId() {
		return managerId;
	}

	/**
	 * 设置版主ID
	 * @param managerId
	 */
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
}
