package org.home.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDBUtil {
	/**
	 * @param args
	 */
	// �����������֮ǰ��classpath�����õ�JDBC�����������JAR ����
	public static final String DBDRIVER = "com.mysql.jdbc.Driver";
	// ���ӵ�ַ���ɸ������ݿ������̵����ṩ�ģ�������Ҫ������ס
	public static final String DBURL = "jdbc:mysql://localhost:3306/worksubmit?useSSL=false";
	// �������ݿ���û���
	public static final String DBUSER = "root";
	// �������ݿ������
	public static final String DBPASS = "123456";

	static Connection conn;

	/**
	 * Connect to DB
	 * 
	 * @return Connection
	 * @throws SQLException
	 */
	public static Connection connetDB() {

		// 1��ʹ��CLASS �������������
		try {
			Class.forName(DBDRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
		} catch (SQLException e) {
			// e.printStackTrace();
			return null;
		}

		return conn;

	}

	/**
	 * close DB
	 */
	public static void closeDB() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
