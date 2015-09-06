package cn.edu.ahut.base.action;

import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import cn.edu.ahut.util.LogUtil;

import com.googlecode.jsonplugin.JSONException;
import com.googlecode.jsonplugin.JSONUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Action共通
 * @author UML小组
 *
 */
public class BaseActionSupport extends ActionSupport implements
		ServletRequestAware, ServletResponseAware {

	private static final long serialVersionUID = 7834736236105975470L;

	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;
	private Vector<String> errMessage;
	protected int start;
	protected int limit;

	public void setServletRequest(HttpServletRequest req) {
		this.request = req;
		this.session = request.getSession();
	}

	public void setServletResponse(HttpServletResponse res) {
		this.response = res;
	}

	public void writeError() {
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write("{success:false,msg:'");
			for (String msg : errMessage) {
				writer.write(msg);
				writer.write("<br/>");
			}
			errMessage.clear();
			writer.write("'}");
			writer.flush();
			writer.close();
		} catch (java.io.IOException exc) {
			exc.printStackTrace();
		}
	}

	public void writeJson(Object obj) {
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(JSONUtil.serialize(obj));
			writer.flush();
			writer.close();
		} catch (java.io.IOException exc) {
			exc.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	public void writeJson(Object obj, boolean isSuccess) {
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer = response.getWriter();
			if (isSuccess) {
				writer.write("{\"success\":true,\"data\":");
			} else {
				writer.write("{\"success\":false,\"data\":");
			}
			writer.write(JSONUtil.serialize(obj));
			writer.write("}");
			writer.flush();
			writer.close();
		} catch (java.io.IOException exc) {
			exc.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	public void write(String outStr) {
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(outStr);
			writer.flush();
			writer.close();
			LogUtil.debug(outStr);
		} catch (java.io.IOException exc) {
			exc.printStackTrace();
		}
	}

	public void writeXml(String outStr) {
		try {
			response.setContentType("text/xml;charset=utf-8");
			PrintWriter writer = response.getWriter();
			writer.write(outStr);
			writer.flush();
			writer.close();
		} catch (java.io.IOException exc) {
			exc.printStackTrace();
		}
	}

	protected void addError(String msgId, Object... params) {
		if (errMessage == null) {
			errMessage = new Vector<String>();
		}
		errMessage.add(String.format(getText(msgId), params));
	}

	public boolean isInvalid() {
		if (errMessage != null && errMessage.size() > 0) {
			writeError();
			return true;
		}
		return false;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}
}
