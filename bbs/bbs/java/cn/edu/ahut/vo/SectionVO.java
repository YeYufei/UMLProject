package cn.edu.ahut.vo;

import java.util.List;

import cn.edu.ahut.base.vo.PageObject;

/**
 * 父板块
 * @author UML小组
 *
 */
public class SectionVO extends BaseSectionVO{
	private static final long serialVersionUID = 7873111598010219864L;

	/**
	 * 子版块个数
	 */
	private int subSectionNums;
	
	/**
	 * 子版块分页列表
	 */
	private PageObject subSections;
	
	/**
	 * 子版块列表
	 */
	private List<SubSectionVO> subSectionList;
	
	/**
	 * 取得子版块列表
	 * @return
	 */
	public List<SubSectionVO> getSubSectionList() {
		return subSectionList;
	}

	/**
	 * 设置子版块列表
	 * @param subSectionList
	 */
	public void setSubSectionList(List<SubSectionVO> subSectionList) {
		this.subSectionList = subSectionList;
	}

	
	
	/**
	 * 取得子版块个数
	 * @return
	 */
	public int getSubSectionNums() {
		return subSectionNums;
	}

	/**
	 * 设置子版块个数
	 * @param subSectionNums
	 */
	public void setSubSectionNums(int subSectionNums) {
		this.subSectionNums = subSectionNums;
	}

	/**
	 * 取得子版块列表
	 * @return
	 */
	public PageObject getSubSections() {
		return subSections;
	}

	/**
	 * 设置子版块列表
	 * @param subSections
	 */
	public void setSubSections(PageObject subSections) {
		this.subSections = subSections;
	}

}
