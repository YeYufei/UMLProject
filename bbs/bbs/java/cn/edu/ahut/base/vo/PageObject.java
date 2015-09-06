package cn.edu.ahut.base.vo;

import java.io.Serializable;
import java.util.List;

/**
 * 分页对象
 * @author UML小组
 *
 */
@SuppressWarnings("unchecked")

public class PageObject implements Serializable {
	
	private static final long serialVersionUID = 1214335599970597085L;
	
	private List items;
	
	private int totalCount;
	
	
	public PageObject(List items, int totalCount) {
		setTotalCount(totalCount);
		setItems(items);
	}
	
	public List getItems() {
		return items;
	}

	public void setItems(List items) {
		this.items = items;
	}
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
	}
}