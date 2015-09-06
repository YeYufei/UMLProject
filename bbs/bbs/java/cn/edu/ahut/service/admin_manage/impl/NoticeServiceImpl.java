package cn.edu.ahut.service.admin_manage.impl;

import java.util.List;

import cn.edu.ahut.base.service.BaseServiceImpl;
import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.dao.admin_manage.NoticeDao;
import cn.edu.ahut.service.admin_manage.NoticeService;
import cn.edu.ahut.vo.NoticeVO;

/**
 * 公告管理NoticeServiceImpl
 * @author UML小组
 *
 */
public class NoticeServiceImpl extends BaseServiceImpl implements NoticeService {

	/**
	 * DAO引用
	 */
	private NoticeDao noticeDao;
	
	/**
	 * 取得DAO引用
	 * @return
	 */
	public NoticeDao getNoticeDao() {
		return noticeDao;
	}

	/**
	 * 设置DAO引用
	 * @param noticeDao
	 */
	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	/**
	 * 删除公告
	 */
	@Override
	public void deleteNoticeVO(NoticeVO vo) {
		noticeDao.deleteNoticeVO(vo);
	}

	/**
	 * 添加公告
	 */
	@Override
	public void insertNoticeVO(NoticeVO vo) {
		noticeDao.insertNoticeVO(vo);
	}

	/**
	 * 分页查询全部公告
	 */
	@Override
	public PageObject queryAllNoticeVO(int offset, int length) {
		return noticeDao.queryAllNoticeVO(offset, length);
	}

	/**
	 * 查询单条公告
	 */
	@Override
	public NoticeVO queryNoticeVO(NoticeVO vo) {
		return noticeDao.queryNoticeVO(vo);
	}

	/**
	 * 更新公告
	 */
	@Override
	public void updateNoticeVO(NoticeVO vo) {
		noticeDao.updateNoticeVO(vo);
	}
	
	/**
	 * 查询最近的5条公告
	 * @return
	 */
	public List<NoticeVO> queryLatest5NoticeVO(){
		return noticeDao.queryLatest5NoticeVO();
	}
}
