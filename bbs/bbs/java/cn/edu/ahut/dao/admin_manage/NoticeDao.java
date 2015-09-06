package cn.edu.ahut.dao.admin_manage;

import java.util.List;

import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.vo.NoticeVO;

/**
 * 公告管理DAO
 * @author UML小组
 *
 */
public interface NoticeDao {

	/**
	 * 增加公告
	 * @param vo
	 */
	public void insertNoticeVO(NoticeVO vo);
	
	/**
	 * 删除公告
	 * @param vo
	 */
	public void deleteNoticeVO(NoticeVO vo);
	
	/**
	 * 更新公告
	 * @param vo
	 */
	public void updateNoticeVO(NoticeVO vo);
	
	/**
	 * 查询单条公告
	 * @param vo
	 * @return
	 */
	public NoticeVO queryNoticeVO(NoticeVO vo);
	
	/**
	 * 分页查询全部公告
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject queryAllNoticeVO(int offset,int length);
	
	/**
	 * 查询最近的5条公告
	 * @return
	 */
	public List<NoticeVO> queryLatest5NoticeVO();
}
