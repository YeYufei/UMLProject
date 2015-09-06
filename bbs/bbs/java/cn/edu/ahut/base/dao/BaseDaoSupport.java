package cn.edu.ahut.base.dao;
import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import cn.edu.ahut.base.vo.PageObject;

/**
 * DAO共通
 * @author UML小组
 *
 */
public class BaseDaoSupport extends SqlMapClientDaoSupport {
	/**
	 * 带参检索，返回List
	 * @param sqlId
	 * @param params
	 * @return
	 */
	public List<?> executeQueryForList(String sqlId, Object params) {
		return this.getSqlMapClientTemplate().queryForList(sqlId, params);
	}

	/**
	 * 无参检索，返回List
	 * @param sqlId
	 * @return
	 */
	public List<?> executeQueryForList(String sqlId) {
		return this.getSqlMapClientTemplate().queryForList(sqlId);
	}

	/**
	 * 无参检索，返回Object
	 * @param sqlId
	 * @return
	 */
	public Object executeQueryForObject(String sqlId) {
		return this.getSqlMapClientTemplate().queryForObject(sqlId);
	}

	/**
	 * 带参检索，返回Object
	 * @param sqlId
	 * @param params
	 * @return
	 */
	public Object executeQueryForObject(String sqlId, Object params) {
		return this.getSqlMapClientTemplate().queryForObject(sqlId, params);
	}
	
	public PageObject executeQueryForPage(String sqlId, Object params,
			final int offset, final int length) {

		int totalCount = this.getSqlMapClientTemplate().queryForList(sqlId,
				params).size();
		List<?> items = this.getSqlMapClientTemplate().queryForList(sqlId,
				params, offset, length);
		PageObject pageObject = new PageObject(items, totalCount);
		return pageObject;
	}

	/**
	 *无参分页检索，返回PageObject
	 * @param sqlId
	 * @param offset
	 * @param length
	 * @return
	 */
	public PageObject executeQueryForPage(String sqlId, final int offset,
			final int length) {

		int totalCount = this.getSqlMapClientTemplate().queryForList(sqlId)
				.size();
		List<?> items = this.getSqlMapClientTemplate().queryForList(sqlId,
				offset, length);
		PageObject pageObject = new PageObject(items, totalCount);
		return pageObject;
	}

	/**
	 * 带参更新操作
	 * @param sqlId
	 * @param params
	 * @return
	 */
	public int executeUpdate(String sqlId, Object params) {
		return this.getSqlMapClientTemplate().update(sqlId, params);
	}

	/**
	 * 无参更新操作
	 * @param sqlId
	 * @return
	 */
	public int executeUpdate(String sqlId) {
		return this.getSqlMapClientTemplate().update(sqlId);
	}

	/**
	 * 带参插入操作
	 * @param sqlId
	 * @param params
	 * @return
	 */
	public Object executeInsert(String sqlId, Object params) {
		return this.getSqlMapClientTemplate().insert(sqlId, params);
	}
	
	/**
	 * 无参插入操作
	 * @param sqlId
	 * @return
	 */
	public Object executeInsert(String sqlId) {
		return this.getSqlMapClientTemplate().insert(sqlId);
	}

	/**
	 * 无参删除操作
	 * @param sqlId
	 * @return
	 */
	public int executeDelete(String sqlId) {
		return this.getSqlMapClientTemplate().delete(sqlId);
	}

	/**
	 * 带参删除操作
	 * @param sqlId
	 * @param params
	 * @return
	 */
	public int executeDelete(String sqlId, Object params) {
		return this.getSqlMapClientTemplate().delete(sqlId, params);
	}
	
//	/**
//	 * 批量删除
//	 * @param sqlId
//	 * @param list
//	 */
//	public void batchDelete(String sqlId, List<?> list){
//		SqlMapClient sql = this.getSqlMapClient();
//		
//	}
}