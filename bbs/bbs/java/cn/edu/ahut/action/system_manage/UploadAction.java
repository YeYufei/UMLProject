package cn.edu.ahut.action.system_manage;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Date;

import org.apache.commons.fileupload.util.Streams;

import cn.edu.ahut.base.action.BaseActionSupport;
import cn.edu.ahut.service.system_manage.UserService;
import cn.edu.ahut.util.Constants;
import cn.edu.ahut.util.LogUtil;
import cn.edu.ahut.vo.UserVO;

/**
 * UploadAction
 * 
 * @author UML小组
 * 
 */
public class UploadAction extends BaseActionSupport {

	private static final long serialVersionUID = 4795147622620740907L;

	/**
	 * UserService引用
	 */
	private UserService service;

	private File[] uploadFiles;
	
	private String[] uploadFileNames;
	
	private String[] uploadContentTypes;
	
	public File[] getUploadFiles() {
		return uploadFiles;
	}

	public void setUploadFiles(File[] uploadFiles) {
		this.uploadFiles = uploadFiles;
	}

	public String[] getUploadFileNames() {
		return uploadFileNames;
	}

	public void setUploadFileNames(String[] uploadFileNames) {
		this.uploadFileNames = uploadFileNames;
	}

	public String[] getUploadContentTypes() {
		return uploadContentTypes;
	}

	public void setUploadContentTypes(String[] uploadContentTypes) {
		this.uploadContentTypes = uploadContentTypes;
	}


	/**
	 * 上传照片
	 */
	public void uploadImage() {
		LogUtil.info("上传用户头像开始");
		UserVO tempVO = (UserVO) session.getAttribute(Constants.USER_KEY);
		if(tempVO!=null){
//			图片上传后存放的路径目录 
			String fileBasePath = session.getServletContext().getRealPath("/");
			File images = new File(fileBasePath+"/images/user_images/"+tempVO.getId()+"/");   
            if(!images.exists()){   
                images.mkdirs();   
            } 
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;
			for(int i = 0,size = uploadFiles.length;i<size;i++){
				File file = uploadFiles[i];
				if(file.length()>1024000){
					writeJson("上传失败：文件太大，文件大小不能超过1M", false);
				}else{
					try {
						bis = new BufferedInputStream(new FileInputStream(file));
						String imageName  = tempVO.getId()+new Date().getTime()+".png";
						//
						bos = new BufferedOutputStream(      
						        new FileOutputStream(new File(images.getPath()+"/"+imageName)));
						Streams.copy(bis, bos, true);
						//拷贝一份到工程目录下，方便前台页面显示用
						String destBasePath = images.getPath().substring(0,images.getPath().indexOf("\\", images.getPath().indexOf("\\")+1));
						String destPath = destBasePath+"\\bbs\\WebRoot\\images\\user_images\\"+tempVO.getId()+"\\";
						images = new File(destPath);   
			            if(!images.exists()){   
			                images.mkdirs();   
			            } 
						bis = new BufferedInputStream(new FileInputStream(file));
						bos = new BufferedOutputStream(      
						        new FileOutputStream(new File(destPath+imageName)));
						Streams.copy(bis, bos, true);
						writeJson("images/user_images/"+tempVO.getId()+"/"+imageName,true);
					} catch (Exception e) {
						writeJson("上传失败：系统发生错误，请与管理员联系", false);
						e.printStackTrace();
					}    
				}
			}
		}else{
			writeJson("上传失败：您已经退出了登录", false);
		}
		isInvalid();
		LogUtil.info("上传用户头像结束");
	}

	/**
	 * 取得service引用
	 * @return
	 */
	public UserService getService() {
		return service;
	}

	/**
	 * 设置service引用
	 * 
	 * @param service
	 */
	public void setService(UserService service) {
		this.service = service;
	}
}
