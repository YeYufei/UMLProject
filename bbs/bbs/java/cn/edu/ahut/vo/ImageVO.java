package cn.edu.ahut.vo;
	
/**
 * 社区图片
 * @author UML小组
 *
 */
public class ImageVO {
	/**
	 * ID
	 */
	private int id;
	
	/**
	 * 图片url
	 */
	private String url;
	
	/**
	 * 图片标题
	 */
	private String title;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}
