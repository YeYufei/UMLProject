package cn.edu.ahut.dao.admin_manage.impl;

import java.util.List;

import cn.edu.ahut.base.dao.BaseDaoSupport;
import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.dao.admin_manage.NoticeDao;
import cn.edu.ahut.vo.NoticeVO;

/**
 * 公告管理NoticeDaoImpl
 * @author UML小组
 */
public class NoticeDaoImpl extends BaseDaoSupport implements NoticeDao {

	/**
	 * 删除公告
	 */
	@Override
	public void deleteNoticeVO(NoticeVO vo) {
		this.executeDelete("admin.delete_noticeVO", vo);
	}

	/**
	 * 添加公告
	 */
	@Override
	public void insertNoticeVO(NoticeVO vo) {
		this.executeInsert("admin.insert_noticeVO", vo);
	}

	/**
	 * 分页查询全部公告
	 */
	@Override
	public PageObject queryAllNoticeVO(int offset, int length) {
		return this.executeQueryForPage("admin.query_all_noticeVO",offset, length);
	}

	/**
	 * 查询单条公告
	 */
	@Override
	public NoticeVO queryNoticeVO(NoticeVO vo) {
		return (NoticeVO) this.executeQueryForObject("admin.query_noticeVO", vo);
	}

	/**
	 * 更新公告
	 */
	@Override
	public void updateNoticeVO(NoticeVO vo) {
		this.executeUpdate("admin.update_noticeVO", vo);
	}
	
	/**
	 * 查询最近的5条公告
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<NoticeVO> queryLatest5NoticeVO(){
		return (List<NoticeVO>) this.executeQueryForList("admin.query_latest_5_noticeVO");
	}
}
