package cn.edu.ahut.dao.system_manage.impl;

import java.util.List;

import cn.edu.ahut.base.dao.BaseDaoSupport;
import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.dao.system_manage.TopicDao;
import cn.edu.ahut.vo.ReplyVO;
import cn.edu.ahut.vo.SubSectionVO;
import cn.edu.ahut.vo.TopicVO;

/**
 * 主题帖TopicDaoImpl
 * @author UML小组
 *
 */
public class TopicDaoImpl extends BaseDaoSupport implements TopicDao {

	/**
	 * 增加主题帖
	 */
	@Override
	public void insertTopicVO(TopicVO vo) {
		this.executeInsert("topic.insert_topicVO", vo);
	}

	/**
	 * 分页查询特定版块下面的所有主题帖
	 */
	@Override
	public PageObject queryAllTopicVO(SubSectionVO vo,int offset,int length) {
		PageObject topics = this.executeQueryForPage("topic.query_all_topicVO", vo, offset, length);
		return topics;
	}

	/**
	 * 查询特定版块下面的所有主题帖列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<TopicVO> queryAllTopicVOList(SubSectionVO vo) {
		List<TopicVO> topics =  (List<TopicVO>) this.executeQueryForList("topic.query_all_topicVO", vo);
		return topics;
	}

	/**
	 * 根据ID查询特定的主题帖
	 */
	@Override
	public TopicVO queryTopicById(TopicVO vo) {
		return (TopicVO) this.executeQueryForObject("topic.query_topicVO_byId", vo);
	}

	/**
	 * 根据用户和发帖时间查询主题帖
	 * @param vo
	 * @return
	 */
	public TopicVO queryTopicByTime(TopicVO vo){
		return (TopicVO) this.executeQueryForObject("topic.query_topicVO_by_uid", vo);
	}

	/**
	 * 增加回帖
	 */
	@Override
	public void insertReplyVO(ReplyVO vo) {
		this.executeDelete("topic.insert_replyVO",vo);
	}

	/**
	 * 查询特定主题下的所有回复贴
	 */
	public PageObject queryReplyByTid(TopicVO vo,int offset,int length){
		return this.executeQueryForPage("topic.query_reply_by_tid",vo, offset, length);
	}

	/**
	 * 更新回帖
	 */
	@Override
	public void updateReplyVO(ReplyVO vo) {
		this.executeUpdate("topic.update_replyVO", vo);
	}

	/**
	 * 更新主题帖
	 */
	@Override
	public void updateTopicVO(TopicVO vo) {
		this.executeUpdate("topic.update_topicVO",vo);
	}

	/**
	 * 查询特定主题帖下的所有回帖数目
	 */
	@Override
	public int queryReplyNumTid(TopicVO vo) {
		return  (Integer) this.executeQueryForObject("topic.query_replyNum_by_tid", vo);
	}
	
	/**
	 * 更新点击数
	 * @param vo
	 */
	public void updateClickNum(TopicVO vo){
		this.executeUpdate("topic.update_topicVO_clickNum", vo);
	}
	
	/**
	 * 更新回复数
	 * @param vo
	 */
	public void updateReplyNum(TopicVO vo){
		this.executeUpdate("topic.update_topicVO_replyNum", vo);
	}
	
	/**
	 * 更新最后回帖时间
	 * @param vo
	 */
	public void updateLastReplyTime(TopicVO vo){
		this.executeUpdate("topic.update_topicVO_lastreplyTime", vo);
	}
	
	/**
	 * 查询特定主题帖的最后回帖
	 * @param TopicVO vo
	 * @return ReplyVO
	 */
	public ReplyVO queryLastReplyByTid(TopicVO vo){
		return (ReplyVO) this.executeQueryForObject("topic.query_lastReply_by_tid", vo);
	}
	
	/**
	 * 查询最新的10条主题帖
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TopicVO> queryLatest10TopicVO(){
		return (List<TopicVO>)this.executeQueryForList("topic.query_lasest_10_topicVO");
	}
	
	/**
	 * 查询最新的10条回帖
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ReplyVO> queryLatest10ReplyVO(){
		return (List<ReplyVO>)this.executeQueryForList("topic.query_lasest_10_replyVO");
	}
	
	/**
	 * 查询回帖的位置序号
	 * @param id
	 * @return
	 */
	public int queryReplySortById(ReplyVO vo){
		return (Integer) this.executeQueryForObject("topic.query_replySort_by_tid", vo);
	}
	
	/**
	 * 查询主题数
	 * @param vo
	 * @return
	 */
	public SubSectionVO queryTopicNum(SubSectionVO vo){
		return (SubSectionVO) this.executeQueryForObject("topic.query_topicNum_bySid", vo);
	}
	
	/**
	 * 查询文章数
	 * @param vo
	 * @return
	 */
	public SubSectionVO queryArticleNum(SubSectionVO vo){
		return (SubSectionVO) this.executeQueryForObject("topic.query_articleNum_bySid", vo);
	}
	
	/**
	 * 查询特定板块下面的最新主题
	 * @param vo
	 * @return
	 */
	public TopicVO queryLatestTopicVO(SubSectionVO vo){
		return (TopicVO) this.executeQueryForObject("topic.query_last_topic", vo);
	}
}
