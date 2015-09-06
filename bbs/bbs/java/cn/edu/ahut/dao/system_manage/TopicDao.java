package cn.edu.ahut.dao.system_manage;

import java.util.List;

import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.vo.ReplyVO;
import cn.edu.ahut.vo.SubSectionVO;
import cn.edu.ahut.vo.TopicVO;

/**
 * 主题帖DAO
 * @author 李三来
 *
 */
public interface TopicDao {

	/**
	 * 增加主题帖
	 * @param vo
	 */
	public void insertTopicVO(TopicVO vo);

	/**
	 * 更新主题帖
	 * @param vo
	 */
	public void updateTopicVO(TopicVO vo);
	
	/**
	 * 分页查询特定版块的所有主题帖
	 * @param vo
	 * @return
	 */
	public PageObject queryAllTopicVO(SubSectionVO vo,int offset,int length);
	
	/**
	 * 查询特定版块的所有主题帖
	 * @param vo
	 * @return
	 */
	public List<TopicVO> queryAllTopicVOList(SubSectionVO vo);
	
	/**
	 * 根据ID查询特定的主题帖
	 * @param vo
	 * @return
	 */
	public TopicVO queryTopicById(TopicVO vo);
	
	/**
	 * 根据发帖时间查询主题帖
	 * @param vo
	 * @return
	 */
	public TopicVO queryTopicByTime(TopicVO vo);
	
	/**
	 * 增加回复贴
	 * @param vo
	 */
	public void insertReplyVO(ReplyVO vo);
	
	/**
	 * 更新回复贴
	 * @param vo
	 */
	public void updateReplyVO(ReplyVO vo);
	
	/**
	 * 查询特定主题下的所有回复贴
	 * @param vo
	 * @return
	 */
	public PageObject queryReplyByTid(TopicVO vo,int offset,int length);
	
	/**
	 * 查询特定主题帖下的所有回帖数目
	 * @param vo
	 * @return
	 */
	public int queryReplyNumTid(TopicVO vo);
	
	/**
	 * 更新点击数
	 * @param vo
	 */
	public void updateClickNum(TopicVO vo);
	
	/**
	 * 更新回复数
	 * @param vo
	 */
	public void updateReplyNum(TopicVO vo);
	/**
	 * 更新最后回帖时间
	 * @param vo
	 */
	public void updateLastReplyTime(TopicVO vo);
	
	/**
	 * 查询特定主题帖的最后回帖
	 * @param vo
	 * @return
	 */
	public ReplyVO queryLastReplyByTid(TopicVO vo);
	
	/**
	 * 查询最新的10条主题帖
	 * @return
	 */
	public List<TopicVO> queryLatest10TopicVO();
	
	/**
	 * 查询最新的10条回帖
	 * @return
	 */
	public List<ReplyVO> queryLatest10ReplyVO();
	
	/**
	 * 查询回帖的位置序号
	 * @param id
	 * @return
	 */
	public int queryReplySortById(ReplyVO vo);
	
	/**
	 * 查询主题数
	 * @param vo
	 * @return
	 */
	public SubSectionVO queryTopicNum(SubSectionVO vo);
	/**
	 * 查询文章数
	 * @param vo
	 * @return
	 */
	public SubSectionVO queryArticleNum(SubSectionVO vo);
	
	/**
	 * 查询特定板块下面的最新主题
	 * @param vo
	 * @return
	 */
	public TopicVO queryLatestTopicVO(SubSectionVO vo);
}
