package cn.edu.ahut.dao.admin_manage;

import java.util.List;

import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.vo.SectionVO;
import cn.edu.ahut.vo.SubSectionVO;
import cn.edu.ahut.vo.UserVO;

/**
 * 
 * @author UML小组
 *
 */
public interface SectionDao {
	
	/**
	 * 增加父板块
	 * @param vo
	 */
	public void insertSectionVO(SectionVO vo);
	
	/**
	 * 删除父板块
	 * @param vo
	 */
	public void deleteSectionVO(SectionVO vo);
	
	/**
	 * 修改父板块
	 * @param vo
	 */
	public void updateSectionVO(SectionVO vo);
	
	/**
	 * 单个查询父板块
	 * @param vo
	 * @return
	 */
	public SectionVO querySectionVO(SectionVO vo);
	
	/**
	 * 查询父板块列表
	 * @return
	 */
	public List<SectionVO> queryAllSectionVO();
	
	/**
	 * 分页查询父板块列表
	 * @return
	 */
	public PageObject queryAllSectionForPage(int offset,int length);
	
	/**
	 * 增加子版块
	 * @param vo
	 */
	public void insertSubSectionVO(SubSectionVO vo);
	
	/**
	 * 删除子版块
	 * @param vo
	 */
	public void deleteSubSectionVO(SubSectionVO vo);
	
	/**
	 * 修改子版块
	 * @param vo
	 */
	public void updateSubSectionVO(SubSectionVO vo);
	
	/**
	 * 单个查询子版块
	 * @param vo
	 * @return
	 */
	public SubSectionVO querySubSectionVO(SubSectionVO vo);
	
	/**
	 * 根据版主ID查询子版块
	 * @param vo
	 * @return
	 */
	public SubSectionVO querySubSectionVOByManager(UserVO vo);
	
	/**
	 * 查询子版块列表
	 * @return
	 */
	public List<SubSectionVO> queryAllSubSectionVO();
	
	/**
	 * 分页查询子板块列表
	 * @return
	 */
	public PageObject queryAllSubSectionForPage(int offset,int length);

	/**
	 * 根据板块名称查询父板块
	 * @param vo
	 * @return
	 */
	public SectionVO querySectionVOByName(SectionVO vo);
	
	/**
	 * 根据板块名称查询子板块
	 * @param vo
	 * @return
	 */
	public SubSectionVO querySubSectionVOByName(SubSectionVO vo);
	
	/**
	 * 根据父板块分页查找子版块
	 * @param vo
	 * @return
	 */
	public PageObject querySubSectionVOBySid(SectionVO vo,int offset,int length);

	/**
	 * 根据父板块查找子版块列表
	 * @param vo
	 * @return
	 */
	public List<SubSectionVO> querySubSectionVOBySid(SectionVO vo);
	
	/**
	 * 设置版主
	 * @param vo
	 */
	public void addSectionManager(SubSectionVO vo);
	
	/**
	 * 删除版主
	 * @param vo
	 */
	public void deleteSectionManager(SubSectionVO vo);
}
