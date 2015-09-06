package cn.edu.ahut.base.vo;

/**
 * 分页信息
 * @author UML小组
 *
 */
public class PageInfo {

	/**
	 * 总页数
	 */
	private int allPages;
	
	/**
	 * 每页的条数
	 */
	private int itemNums;
	
	/**
	 * 当前页码
	 */
	private int currentPage;
	
	/**
	 * 当前页条数
	 */
	private int currentItemNums;
	

	/**
	 * 取得当前页条数
	 * @return
	 */
	public int getCurrentItemNums() {
		return currentItemNums;
	}

	/**
	 * 设置当前页条数
	 * @param currentItemNums
	 */
	public void setCurrentItemNums(int currentItemNums) {
		this.currentItemNums = currentItemNums;
	}

	public int getAllPages() {
		return allPages;
	}

	public void setAllPages(int allPages) {
		this.allPages = allPages;
	}

	public int getItemNums() {
		return itemNums;
	}

	public void setItemNums(int itemNums) {
		this.itemNums = itemNums;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	/**
	 * 根据每页显示的条数和当前对象的排序位置获得该对象在哪一页
	 * @param length 每页显示的条数
	 * @param sort 当前对象的排序位置
	 * @return 该对象在哪一页
	 */
	public int returnCurrentPage(int length,int sort){
		int currentPage = 0;
		if(sort%length==0){
			currentPage = sort/length;
		}else{
			currentPage = sort/length+1;
		}
		return currentPage;
	}
}
