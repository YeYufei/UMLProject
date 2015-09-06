package cn.edu.ahut.service.system_manage.impl;

import java.util.List;

import cn.edu.ahut.base.service.BaseServiceImpl;
import cn.edu.ahut.dao.system_manage.ImageDao;
import cn.edu.ahut.service.system_manage.ImageService;
import cn.edu.ahut.vo.ImageVO;

/**
 * 社区图片
 * @author UML小组
 *
 */
public class ImageServiceImpl extends BaseServiceImpl implements ImageService {
	
	
	private ImageDao imageDao;
	
	public ImageDao getImageDao() {
		return imageDao;
	}

	public void setImageDao(ImageDao imageDao) {
		this.imageDao = imageDao;
	}

	/**
	 * 新增社区图片
	 * @param vo
	 */
	public void insertImageVO(ImageVO vo){
		imageDao.insertImageVO(vo);
	}
	
	/**
	 * 查询社区图片
	 * @return
	 */
	public List<ImageVO> queryImageVO(){
		return imageDao.queryImageVO();
	}
}
