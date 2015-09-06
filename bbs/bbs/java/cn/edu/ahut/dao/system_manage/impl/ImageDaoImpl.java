package cn.edu.ahut.dao.system_manage.impl;

import java.util.List;

import cn.edu.ahut.base.dao.BaseDaoSupport;
import cn.edu.ahut.dao.system_manage.ImageDao;
import cn.edu.ahut.vo.ImageVO;

/**
 * 社区图片
 * @author UML小组
 *
 */
public class ImageDaoImpl extends BaseDaoSupport implements ImageDao {

	
	/**
	 * 新增社区图片
	 */
	public void insertImageVO(ImageVO vo) {
		this.executeInsert("image.insert_imageVO", vo);
	}

	/**
	 * 查询社区图片
	 */
	@SuppressWarnings("unchecked")
	public List<ImageVO> queryImageVO() {
		return (List<ImageVO>) this.executeQueryForList("image.query_imageVO");
	}

}
