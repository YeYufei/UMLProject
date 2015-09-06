package cn.edu.ahut.util;


import java.awt.Rectangle;
import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ZoomImage extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{

		int imageWidth = Integer.parseInt(request.getParameter("txt_width"));
		int imageHeight = Integer.parseInt(request.getParameter("txt_height"));
		int cutTop = Integer.parseInt(request.getParameter("txt_top"));
		int cutLeft = Integer.parseInt(request.getParameter("txt_left"));
		int dropWidth = Integer.parseInt(request.getParameter("txt_DropWidth"));
		int dropHeight = Integer.parseInt(request.getParameter("txt_DropHeight"));
		float imageZoom = Float.parseFloat(request.getParameter("txt_Zoom"));
		String picture = request.getParameter("picture");
		
		System.out.println("imageWidth : "+imageWidth);
		System.out.println("imageHeight : "+imageHeight);
		System.out.println("cutTop : "+cutTop);
		System.out.println("cutLeft : "+cutLeft);
		System.out.println("dropWidth : "+dropWidth);
		System.out.println("dropHeight : "+dropHeight);
		System.out.println("imageZoom : "+imageZoom);
		System.out.println("picture : "+picture);
		System.out.println("url :"+request.getSession().getServletContext().getRealPath("/") +"/UserFiles/UploadPhoto/"+picture);
		Rectangle rec = new Rectangle(cutLeft,cutTop,dropWidth,dropHeight);
		File file = new File(request.getSession().getServletContext().getRealPath("/") +"/UserFiles/User/UserHeadImage/"+picture);
		File file1 = new File(request.getSession().getServletContext().getRealPath("/")+"/UserFiles/UploadPhoto/"+picture);
		//BufferedImage image = ImageIO.read(new File(request.getRealPath("")+"/UploadPhoto/"+picture));  
		saveSubImage(file1,file,imageWidth,imageHeight,rec);
		if(file1.exists())
			file1.delete();
		response.sendRedirect("/bbs/system/update_userInfo.action?Picurl="+picture+"&step=3");
	}
	
	private static void saveSubImage(File srcImageFile, File descDir,int width,int height,Rectangle rect) throws IOException   
	{   

		ImageHepler.cut(srcImageFile, descDir, width, height, rect);
	} 

}
