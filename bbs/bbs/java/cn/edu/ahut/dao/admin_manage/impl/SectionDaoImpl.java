package cn.edu.ahut.dao.admin_manage.impl;

import java.util.List;

import cn.edu.ahut.base.dao.BaseDaoSupport;
import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.dao.admin_manage.SectionDao;
import cn.edu.ahut.vo.SectionVO;
import cn.edu.ahut.vo.SubSectionVO;
import cn.edu.ahut.vo.UserVO;

/**
 * 
 * @author UML小组
 *
 */
public class SectionDaoImpl extends BaseDaoSupport implements SectionDao {

	/**
	 * 删除父板块
	 */
	@Override
	public void deleteSectionVO(SectionVO vo) {
		this.executeDelete("admin.delete_sectionVO", vo);
	}

	/**
	 * 删除子板块
	 */
	@Override
	public void deleteSubSectionVO(SubSectionVO vo) {
		this.executeDelete("admin.delete_subSectionVO", vo);
	}
	
	/**
	 * 增加父板块
	 */
	@Override
	public void insertSectionVO(SectionVO vo) {
		this.executeInsert("admin.insert_sectionVO", vo);
	}

	/**
	 * 增加子版块
	 */
	@Override
	public void insertSubSectionVO(SubSectionVO vo) {
		this.executeInsert("admin.insert_subSectionVO", vo);
	}

	/**
	 * 查询所有父板块
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<SectionVO> queryAllSectionVO() {
		return (List<SectionVO>) this.executeQueryForList("admin.query_all_sectionVO");
	}

	/**
	 * 查询所有的子板块
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<SubSectionVO> queryAllSubSectionVO() {
		return (List<SubSectionVO>) this.executeQueryForList("admin.query_all_subSectionVO");
	}

	/**
	 * 根据ID查询单个父版块
	 */
	@Override
	public SectionVO querySectionVO(SectionVO vo) {
		return (SectionVO) this.executeQueryForObject("admin.query_sectionVO", vo);
	}

	/**
	 * 查询单个子版块
	 */
	@Override
	public SubSectionVO querySubSectionVO(SubSectionVO vo) {
		return (SubSectionVO) this.executeQueryForObject("admin.query_subSectionVO", vo);
	}
	
	/**
	 * 根据版主ID查询子版块
	 * @param vo
	 * @return
	 */
	public SubSectionVO querySubSectionVOByManager(UserVO vo){
		return (SubSectionVO) this.executeQueryForObject("admin.query_subSectionVO_bymanagerId", vo);
	}
	
	/**
	 * 更新父板块
	 */
	@Override
	public void updateSectionVO(SectionVO vo) {
		this.executeUpdate("admin.update_sectonVO", vo);
	}

	/**
	 * 更新子版块
	 */
	@Override
	public void updateSubSectionVO(SubSectionVO vo) {
		this.executeUpdate("admin.update_subSectionVO", vo);
	}

	/**
	 * 分页查询父板块列表
	 */
	@Override
	public PageObject queryAllSectionForPage(int offset, int length) {
		return this.executeQueryForPage("admin.query_all_sectionVO", offset, length);
	}

	/**
	 * 分页查询子版块列表
	 */
	@Override
	public PageObject queryAllSubSectionForPage(int offset, int length) {
		return this.executeQueryForPage("admin.query_all_subSectionVO", offset, length);
	}

	/**
	 * 根据板块名称查询父板块
	 * @param vo
	 * @return
	 */
	public SectionVO querySectionVOByName(SectionVO vo){
		return (SectionVO) this.executeQueryForObject("admin.query_sectionVO_byName", vo);
	}
	
	/**
	 * 根据板块名称查询子板块
	 * @param vo
	 * @return
	 */
	public SubSectionVO querySubSectionVOByName(SubSectionVO vo){
		return (SubSectionVO) this.executeQueryForObject("admin.query_subSectionVO_byName", vo);
	}
	
	/**
	 * 根据父板块查找子版块
	 * @param vo
	 * @return
	 */
	public PageObject querySubSectionVOBySid(SectionVO vo,int offset,int length){
		return this.executeQueryForPage("admin.query_subSection_bySID", vo, offset, length);
	}
	
	/**
	 * 根据父板块查找子版块列表
	 * @param vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<SubSectionVO> querySubSectionVOBySid(SectionVO vo){
		return (List<SubSectionVO>) this.executeQueryForList("admin.query_subSection_bySID", vo);
	}
	
	/**
	 * 设置版主
	 * @param vo
	 */
	public void addSectionManager(SubSectionVO vo){
		this.executeUpdate("admin.update_section_add_manager", vo);
	}
	
	/**
	 * 删除版主
	 * @param vo
	 */
	public void deleteSectionManager(SubSectionVO vo){
		this.executeUpdate("admin.update_section_delete_manager", vo);
	}
}
