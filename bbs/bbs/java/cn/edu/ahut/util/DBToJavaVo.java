package cn.edu.ahut.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

/**
 * 动态读取DB表的结构，生成成hibernate支持的VO类和map文件
 * 
 * @author grhuang
 * 
 */
public class DBToJavaVo {

	/**
	 * 生成ＶＯ的存放位置
	 */
	private static final String TARGET_VO_DIR = "src\\java\\cn\\edu\\ahut\\vo\\";
	private static final String VO_PACKAGE_NAME = "cn.edu.ahut.vo";
	private static final int VO_EXLUDE_NUMBER = 7;
	/**
	 * db.jdbc.driver.class
	 */
	private static final String JDBC_DRIVER_CLASS = "org.gjt.mm.mysql.Driver";
	/**
	 * db.jdbc.connect.url
	 */
	private static final String JDBC_CONNECT_URL = "jdbc:mysql://localhost:3306/bbs2";

	/**
	 * DB_USER_NAME
	 */
	private static final String DB_USER = "root";

	/**
	 * DB_USER_PWD
	 */
	private static final String DB_USER_PWD = "88343840";

	Connection con = null;
	private Map<String, String> columnsComments = null;
	private Map<String, String> tableComment = null;
	private ArrayList<String> tableNameList = null;

	/**
	 * 构造函数
	 * 
	 * @throws Exception
	 */
	public DBToJavaVo() throws Exception {
		try {
			Class.forName(JDBC_DRIVER_CLASS);
			con = DriverManager.getConnection(JDBC_CONNECT_URL, DB_USER,
					DB_USER_PWD);
			ResultSet rs;
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery("select * from user_col_comments");
			columnsComments = new HashMap<String, String>();
			while (rs.next()) {
				columnsComments
						.put(rs.getString("TABLE_NAME")
								+ rs.getString("COLUMN_NAME"), rs
								.getString("COMMENTS"));
			}
			rs.close();
			stmt.close();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from USER_TAB_COMMENTS");
			tableComment = new HashMap<String, String>();
			tableNameList = new ArrayList<String>();
			while (rs.next()) {
				tableComment.put(rs.getString("TABLE_NAME"), rs
						.getString("COMMENTS"));
				String tableName = rs.getString("TABLE_NAME");
				if (tableName != null && tableName.indexOf("BIN$") == -1) {
					tableNameList.add(tableName);
				}
			}
			rs.close();
			stmt.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw e;
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * 做成VO对象
	 * 
	 * @param tableName
	 * @throws Exception
	 */
	public void tableToVO(String tableName) throws Exception {
		if (con == null)
			return;
		if (tableName == null || tableName.indexOf("BIN$") != -1)
			return;
		DatabaseMetaData dbmd = con.getMetaData();
		ResultSet rs = dbmd.getColumns(null, dbmd.getUserName(), tableName,
				null);

		OutputStreamWriter out;
		try {
			File dir = new File(TARGET_VO_DIR);
			dir.mkdirs();
			out = new OutputStreamWriter(new FileOutputStream(new File(dir,
					convertColumn(tableName) + "VO.java")), "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
			rs.close();
			return;
		}
		out
				.write("/*\n * BBS系统 \n * 作成者  UML小组\n * 作成日  2015-08-15\n *\n */\n");
		out.write("package " + VO_PACKAGE_NAME + ";\n\n");
		out.write("import com.ustcsoft.edmc.base.vo.BaseVO;\n\n");

		out.write("/** \n * 表　" + tableComment.get(tableName) + "\n */\n");
		out.write("public class " + convertColumn(tableName)
				+ "VO extends BaseVO { \n");
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		while (rs.next()) {
			StringBuilder fieldSb = new StringBuilder();
			StringBuilder methodSb = new StringBuilder();
			String type = rs.getString("TYPE_NAME");
			String realColumn = rs.getString("COLUMN_NAME");
			String column = convertColumn(realColumn);
			StringBuffer sdd = new StringBuffer(column);
			Map<String, String> map = new HashMap<String, String>();

			sdd.setCharAt(0, Character.toLowerCase(sdd.charAt(0)));
			String field = sdd.toString();

			fieldSb.append("    /** "
					+ columnsComments.get(tableName + realColumn) + " */\n");
			fieldSb.append("    private " + getTypeString(type) + " " + field
					+ ";\n");
			fieldSb.append("\n");
			methodSb.append("    /**\n");
			methodSb.append("      * 取得"
					+ columnsComments.get(tableName + realColumn) + "\n");
			methodSb.append("      * \n");
			methodSb.append("      * @return " + field + "\n");
			methodSb.append("      */\n");
			methodSb.append("    public " + getTypeString(type) + " get"
					+ column + "() { \n");
			methodSb.append("        return " + field + "; \n    }\n");
			methodSb.append("\n");
			methodSb.append("    /**\n");
			methodSb.append("      * 设定"
					+ columnsComments.get(tableName + realColumn) + "\n");
			methodSb.append("      * \n");
			methodSb.append("      * @param " + field + " "
					+ columnsComments.get(tableName + realColumn) + "\n");
			methodSb.append("      */\n");
			methodSb.append("    public void set" + column + "("
					+ getTypeString(type) + " " + field + ") { \n");
			methodSb.append("        this." + field + " = " + field
					+ "; \n    }\n");
			methodSb.append("\n");
			map.put("field", fieldSb.toString());
			map.put("method", methodSb.toString());
			list.add(map);
		}
		for (int i = 0; i < VO_EXLUDE_NUMBER; i++) {
			list.remove(list.size() - 1);
		}
		for (Map<String, String> map : list) {
			out.write(map.get("field"));
		}
		for (Map<String, String> map : list) {
			out.write(map.get("method"));
		}
		rs.close();
		out.write("}");
		out.flush();
		out.close();

		System.out.println(tableName + "表对应的VO文件已经生成。");
	}

	/**
	 * 类型转换
	 * 
	 * @param type
	 * @return
	 */
	public String getTypeString(String type) {
		String typeString = "";
		if (type == null) {
			return null;
		}
		if (type.indexOf("CHAR") != -1) {
			typeString = "java.lang.String";
		} else if (type.indexOf("VARCHAR") != -1) {
			typeString = "java.lang.String";
		} else if (type.indexOf("LONGVARCHAR") != -1) {
			typeString = "java.lang.String";
		} else if (type.indexOf("TIME") != -1) {
			typeString = "java.sql.Timestamp";
		} else if (type.indexOf("DATE") != -1) {
			typeString = "java.sql.Date";
		} else if (type.indexOf("NUMBER") != -1
				|| type.indexOf("Decimal") != -1) {
			typeString = "java.math.BigDecimal";
		} else if (type.indexOf("CLOB") != -1) {
			typeString = "java.sql.Clob";
		} else {
			typeString = "java.lang.Object";
		}
		return typeString;
	}

	private String convertColumn(String column) {
		String newCol = "";
		StringTokenizer st = new StringTokenizer(column, "_");
		while (st.hasMoreTokens()) {
			String token = st.nextToken();
			newCol += token.charAt(0) + token.substring(1).toLowerCase();
		}
		return newCol;
	}

	/**
	 * 生成指定表的VO和Mapping文件
	 * 
	 * @param tableName
	 *            表的名字
	 * @throws Exception
	 *             Exception
	 */
	public void createByTableName(String tableName) throws Exception {
		// 做成VO对象文件
		tableToVO(tableName);
	}

	/**
	 * 由控制台输入表名称，生成VO和Mapping文件
	 * 
	 * @param tableName
	 *            表的名字
	 * @throws Exception
	 *             Exception
	 */
	public void createByInput() throws Exception {
		DatabaseMetaData dbmd = con.getMetaData();
		ResultSet rs = dbmd.getTables(null, dbmd.getUserName(), null,
				new String[] { "TABLE" });
		List<String> tableNames = new ArrayList<String>();
		while (rs.next()) {
			tableNames.add(rs.getString("TABLE_NAME"));
		}
		rs.close();
		// 读取控制台的输入
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		System.out.print("Enter your value:");
		String name = br.readLine().toUpperCase();
		if (!tableNames.contains(name)) {
			System.out.println("输入的表名称不存在！");
			return;
		}
		createByTableName(name);
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		try {
			DBToJavaVo objDBToJavaVo = new DBToJavaVo();
			objDBToJavaVo.createByInput();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
