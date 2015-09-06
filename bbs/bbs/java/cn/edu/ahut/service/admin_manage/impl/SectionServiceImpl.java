package cn.edu.ahut.service.admin_manage.impl;

import java.util.List;

import cn.edu.ahut.base.service.BaseServiceImpl;
import cn.edu.ahut.base.vo.PageObject;
import cn.edu.ahut.dao.admin_manage.SectionDao;
import cn.edu.ahut.dao.admin_manage.UserDao;
import cn.edu.ahut.service.admin_manage.SectionService;
import cn.edu.ahut.util.StringUtil;
import cn.edu.ahut.util.exception.BizException;
import cn.edu.ahut.vo.SectionVO;
import cn.edu.ahut.vo.SubSectionVO;
import cn.edu.ahut.vo.UserVO;

/**
 * 
 * @author UML小组
 *
 */
public class SectionServiceImpl extends BaseServiceImpl implements
		SectionService {

	/**
	 * DAO引用
	 */
	private SectionDao sectionDao;

	/**
	 * UserDao引用
	 */
	private UserDao userDao;
	
	/**
	 * 取得DAO引用
	 * @return
	 */
	public SectionDao getSectionDao() {
		return sectionDao;
	}

	/**
	 * 设置DAO引用
	 * @param sectionDao
	 */
	public void setSectionDao(SectionDao sectionDao) {
		this.sectionDao = sectionDao;
	}

	/**
	 * 取得UserDao引用
	 * @return
	 */
	public UserDao getUserDao() {
		return userDao;
	}

	/**
	 * 设置UserDao引用
	 * @param userDao
	 */
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * 删除父板块
	 */
	@Override
	public void deleteSectionVO(SectionVO vo) {
		sectionDao.deleteSectionVO(vo);
	}

	/**
	 * 删除子版块
	 */
	@Override
	public void deleteSubSectionVO(SubSectionVO vo) {
		sectionDao.deleteSubSectionVO(vo);
	}

	/**
	 * 添加父板块
	 */
	@Override
	public void insertSectionVO(SectionVO vo) throws BizException{
		if(sectionDao.querySectionVOByName(vo)!=null){
			throw new BizException("该板块名称已经存在");
		}else{
			sectionDao.insertSectionVO(vo);
		}
	}

	/**
	 * 添加子版块
	 */
	@Override
	public void insertSubSectionVO(SubSectionVO vo) {
		if(sectionDao.querySubSectionVOByName(vo)!=null){
			throw  new BizException("该板块名称已经存在");
		}else{
			sectionDao.insertSubSectionVO(vo);
		}
	}

	/**
	 * 查询所有父板块
	 */
	@Override
	public List<SectionVO> queryAllSectionVO() {
		return sectionDao.queryAllSectionVO();
	}

	/**
	 * 查询所有子版块
	 */
	@Override
	public List<SubSectionVO> queryAllSubSectionVO() {
		return sectionDao.queryAllSubSectionVO();
	}

	/**
	 * 查询父板块
	 */
	@Override
	public SectionVO querySectionVO(SectionVO vo) {
		return sectionDao.querySectionVO(vo);
	}
	/**
	 * 查询子版块
	 */
	@Override
	public SubSectionVO querySubSectionVO(SubSectionVO vo) {
		return sectionDao.querySubSectionVO(vo);
	}

	/**
	 * 更新父板块
	 */
	@Override
	public void updateSectionVO(SectionVO vo) {
		sectionDao.updateSectionVO(vo);
	}

	/**
	 * 更新子版块
	 */
	@Override
	public void updateSubSectionVO(SubSectionVO vo) {
		sectionDao.updateSubSectionVO(vo);
	}

	/**
	 * 分页查询父板块列表
	 */
	@Override
	public PageObject queryAllSectionForPage(int offset, int length) {
		return sectionDao.queryAllSectionForPage(offset, length);
	}

	/**
	 * 分页查询子版块列表
	 */
	@Override
	public PageObject queryAllSubSectionForPage(int offset, int length) {
		return sectionDao.queryAllSubSectionForPage(offset, length);
	}

	/**
	 * 根据父板块查找子版块
	 * @param vo
	 * @return
	 */
	public PageObject querySubSectionVOBySid(SectionVO vo,int offset,int length){
		return sectionDao.querySubSectionVOBySid(vo, offset, length);
	}
	
	/**
	 * 根据父板块查找子版块列表
	 * @param vo
	 * @return
	 */
	public List<SubSectionVO> querySubSectionVOBySid(SectionVO vo){
		return sectionDao.querySubSectionVOBySid(vo);
	}
	
	/**
	 * 设置版主
	 * @param vo
	 */
	public void addSectionManager(SubSectionVO vo){
		SubSectionVO tempVO = sectionDao.querySubSectionVO(vo);
		//如果已经有版主了，那么就删除原来的版主
		if(!StringUtil.isNullOrEmpty(tempVO.getManagerId())){
			UserVO userVO = new UserVO();
			userVO.setId(Integer.parseInt(tempVO.getManagerId()));
			userDao.deleteSectionManager(userVO);
		}
		sectionDao.addSectionManager(vo);
	}
	
	/**
	 * 删除版主
	 * @param vo
	 */
	public void deleteSectionManager(SubSectionVO vo){
		sectionDao.deleteSectionManager(vo);
	}
}
