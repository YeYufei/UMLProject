package cn.edu.ahut.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetWeather extends HttpServlet{  
	  
	static String json = null;
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LogUtil.info("Get in weather Servlet");
		response.setCharacterEncoding("UTF-8");
		// 创建saxReader对象  
        SAXReader reader = new SAXReader();  
        
        java.net.URL url = new java.net.URL("http://flash.weather.com.cn/wmaps/xml/guangzhou.xml");
		BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
        
		// 通过read方法读取一个文件 转换成Document对象  
		Document document = null;
		try {
			document = reader.read(in);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //获取根节点元素对象  
        Element node = document.getRootElement();  
        
        json = "{\"CWeather\":[{\"weather\":\"get";
        //遍历所有的元素节点  
        listNodes(node);
        json+="\"}]}";
        LogUtil.info(json);
        PrintWriter pw = response.getWriter();
        pw.write(json);
        pw.flush();
        pw.close();
		LogUtil.info("Get Out weather Servlet");
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
  
    /** 
     * 遍历当前节点元素下面的所有(元素的)子节点 
     *  
     * @param node 
     */  
    public static void listNodes(Element node) {  
        System.out.println("当前节点的名称：：" + node.getName());  
        // 获取当前节点的所有属性节点  
        List<Attribute> list = node.attributes();  
        // 遍历属性节点     
        /*for (Attribute attr : list) {  
        	//System.out.println(attr.getText());
            System.out.println(attr.getName()  
                    + "---" + attr.getValue());  
        }*/ 
        if(node.getName().equals("city")){
        	Attribute attr1 = node.attribute("cityX");
        	json+="{\"cityX\":\""+attr1.getValue();
            System.out.print(" 经度 : "+attr1.getValue());
            
            Attribute attr2 = node.attribute("cityY");
            json+="\",\"cityY\":\""+attr2.getValue();
            System.out.print(" 纬度 : "+attr2.getValue());
            
            Attribute attr3 = node.attribute("cityname");
            json+="\",\"cityname\":\""+attr3.getValue();
            System.out.print(" 城市名 : "+attr3.getValue());
            
            Attribute attr4 = node.attribute("centername");
            json+="\",\"centername\":\""+attr4.getValue();
            System.out.print(" 中心名 : "+attr4.getValue());
            
            Attribute attr5 = node.attribute("stateDetailed");
            json+="\",\"stateDetailed\":\""+attr5.getValue();
            System.out.print(" 天气 : "+attr5.getValue());
            
            Attribute attr6 = node.attribute("tem1");
            json+="\",\"tem1\":\""+attr6.getValue();
            System.out.print(" 最低温度: "+attr6.getValue());
            
            Attribute attr7 = node.attribute("tem2");
            json+="\",\"tem2\":\""+attr7.getValue();
            System.out.print(" 最高气温 : "+attr7.getValue());
            
            Attribute attr8 = node.attribute("temNow");
            json+="\",\"temNow\":\""+attr8.getValue();
            System.out.print(" 实时温度 : "+attr8.getValue());
            
            Attribute attr9 = node.attribute("windState");
            json+="\",\"windState\":\""+attr9.getValue();
            System.out.print(" 风力 : "+attr9.getValue());
            
            Attribute attr10 = node.attribute("windDir");
            json+="\",\"windDir\":\""+attr10.getValue();
            System.out.print(" 风向 : "+attr10.getValue());
            
            Attribute attr11 = node.attribute("windPower");
            json+="\",\"windPower\":\""+attr11.getValue();
            System.out.print(" 风力等级 : "+attr11.getValue());
            
            Attribute attr12 = node.attribute("humidity");
            json+="\",\"humidity\":\""+attr12.getValue();
            System.out.print(" 相对湿度 : "+attr12.getValue());
            
            Attribute attr13 = node.attribute("time");
            json+="\",\"time\":\""+attr13.getValue();
            System.out.print(" 测量时间 : "+attr13.getValue());
        	
        }
        
        System.out.println("Strike");
        
  
        /*if (!(node.getTextTrim().equals(""))) {  
            System.out.println("文本内容：：：：" + node.getText());  
        }*/  
  
        // 当前节点下面子节点迭代器  
        Iterator<Element> it = node.elementIterator();  
        // 遍历  
        while (it.hasNext()) {  
        	if(it.hasNext()&&!node.getName().equals("city")){
        		json+="\"},";
        	}
        	else{
        		json+="\"}";
        	}
            // 获取某个子节点对象  
            Element e = it.next();  
            // 对子节点进行遍历  
            listNodes(e);  
        }  
    }  
  
}  