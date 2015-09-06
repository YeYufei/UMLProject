package cn.edu.ahut.dao.system_manage;

import java.util.List;

import cn.edu.ahut.vo.ImageVO;

/**
 * 社区图片DAO
 * @author UML小组
 *
 */
public interface ImageDao {
	/**
	 * 新增社区图片
	 * @param vo
	 */
	public void insertImageVO(ImageVO vo);
	
	/**
	 * 查询社区图片
	 * @return
	 */
	public List<ImageVO> queryImageVO();
}
