package cn.edu.ahut.util;

import cn.edu.ahut.util.File;
import cn.edu.ahut.util.SmartUpload;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpLoadUserHeadImage extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ServletConfig config = null;
	private String FileName = null;
	private String sPath = "/UserFiles/UploadPhoto";

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LogUtil.info("Get int this servlet");
		SmartUpload mySmartUpload = new SmartUpload();
		mySmartUpload.initialize(config, request, response);
		mySmartUpload.setMaxFileSize(2048 * 1024);
		mySmartUpload.setAllowedFilesList("jpg,gif,png,jpeg,bmp");
		try {
			mySmartUpload.upload();
			File myFile = mySmartUpload.getFiles().getFile(0);
			if (!myFile.isMissing()) {

				Date currTime = new Date();
				SimpleDateFormat formatter2 = new SimpleDateFormat(
						"yyyyMMddhhmmssS", Locale.US);
				FileName = new String((formatter2.format(currTime))
						.getBytes("utf-8"));
				String ext = myFile.getFileExt();
				FileName = FileName + "." + ext;
				myFile.saveAs(sPath + "/" + FileName,
						mySmartUpload.SAVE_VIRTUAL);
			}
			response.sendRedirect("/bbs/system/update_userInfo.action?Picurl="
					+ FileName + "&step=2");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	
	public void init(ServletConfig config) throws ServletException {
		this.config = config;
	}

}
