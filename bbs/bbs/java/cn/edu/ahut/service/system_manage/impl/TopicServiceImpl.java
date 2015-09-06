package cn.edu.ahut.service.system_manage.impl;

import java.util.List;

import cn.edu.ahut.base.service.BaseServiceImpl;
import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.dao.system_manage.TopicDao;
import cn.edu.ahut.service.system_manage.TopicService;
import cn.edu.ahut.vo.ReplyVO;
import cn.edu.ahut.vo.SubSectionVO;
import cn.edu.ahut.vo.TopicVO;

/**
 * 主题帖TopicServiceImpl
 * @author UML小组
 *
 */
public class TopicServiceImpl extends BaseServiceImpl implements TopicService {

	/**
	 * TopicDao对象
	 */
	private TopicDao topicDao;
	
	/**
	 * 取得TopicDao对象
	 * @return
	 */
	public TopicDao getTopicDao() {
		return topicDao;
	}

	/**
	 * 设置TopicDao对象
	 * @param topicDao
	 */
	public void setTopicDao(TopicDao topicDao) {
		this.topicDao = topicDao;
	}

	/**
	 * 增加主题帖
	 */
	@Override
	public void insertTopicVO(TopicVO vo) {
		topicDao.insertTopicVO(vo);
	}

	/**
	 * 分页查询特定版块下面的主题帖
	 */
	@Override
	public PageObject queryAllTopicVO(SubSectionVO vo, int offset, int length) {
		return topicDao.queryAllTopicVO(vo, offset, length);
	}

	/**
	 * 查询特定子版块下面的主题帖列表
	 */
	@Override
	public List<TopicVO> queryAllTopicVOList(SubSectionVO vo) {
		return topicDao.queryAllTopicVOList(vo);
	}

	/**
	 * 根据ID查询特定的主题帖
	 */
	@Override
	public TopicVO queryTopicById(TopicVO vo) {
		return topicDao.queryTopicById(vo);
	}

	/**
	 * 根据用户ID和帖子时间查询主题帖
	 * @param vo
	 * @return
	 */
	public TopicVO queryTopicByTime(TopicVO vo){
		return topicDao.queryTopicByTime(vo);
	}
	
	/**
	 * 增加回帖
	 * @param vo
	 */
	public void insertReplyVO(ReplyVO vo){
		topicDao.insertReplyVO(vo);
	}

	/**
	 * 查询特定主题下的所有回复贴
	 * @param vo
	 * @param offset
	 * @param length
	 * @return
	 */
	 
	public PageObject queryReplyByTid(TopicVO vo,int offset,int length){
		return topicDao.queryReplyByTid(vo, offset, length);
	}

	/**
	 * 更新回帖
	 * @param vo
	 */
	public void updateReplyVO(ReplyVO vo){
		topicDao.updateReplyVO(vo);
	}

	/**
	 * 更新主题帖
	 * @param vo
	 */
	public void updateTopicVO(TopicVO vo){
		topicDao.updateTopicVO(vo);
	}
	
	/**
	 * 查询特定主题帖下的所有回帖数目
	 * @param vo
	 * @return
	 */
	public int queryReplyNumTid(TopicVO vo){
		return topicDao.queryReplyNumTid(vo);
	}

	/**
	 * 更新点击数
	 * @param vo
	 */
	public void updateClickNum(TopicVO vo){
		topicDao.updateClickNum(vo);
	}
	
	/**
	 * 更新回复数
	 * @param vo
	 */
	public void updateReplyNum(TopicVO vo){
		topicDao.updateReplyNum(vo);
	}
	
	/**
	 * 更新最后回帖时间
	 * @param vo
	 */
	public void updateLastReplyTime(TopicVO vo){
		topicDao.updateLastReplyTime(vo);
	}
	
	/**
	 * 查询特定主题帖的最后回帖
	 * @param vo
	 * @return
	 */
	public ReplyVO queryLastReplyByTid(TopicVO vo){
		return topicDao.queryLastReplyByTid(vo);
	}
	
	/**
	 * 查询最新的10条主题帖
	 * @return
	 */
	public List<TopicVO> queryLatest10TopicVO(){
		return topicDao.queryLatest10TopicVO();
	}
	
	/**
	 * 查询最新的10条回帖
	 * @return
	 */
	public List<ReplyVO> queryLatest10ReplyVO(){
		return topicDao.queryLatest10ReplyVO();
	}
	
	/**
	 * 查询回帖的位置序号
	 * @param id
	 * @return
	 */
	public int queryReplySortById(ReplyVO vo){
		return topicDao.queryReplySortById(vo);
	}
	
	/**
	 * 查询主题数
	 * @param vo
	 * @return
	 */
	public SubSectionVO queryTopicNum(SubSectionVO vo){
		return topicDao.queryTopicNum(vo);
	}
	
	/**
	 * 查询文章数
	 * @param vo
	 * @return
	 */
	public SubSectionVO queryArticleNum(SubSectionVO vo){
		return topicDao.queryArticleNum(vo);
	}
	
	/**
	 * 查询特定板块下面的最新主题
	 * @param vo
	 * @return
	 */
	public TopicVO queryLatestTopicVO(SubSectionVO vo){
		return topicDao.queryLatestTopicVO(vo);
	}
}
