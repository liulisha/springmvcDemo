package com.springdemo.dao;

import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Tool {
	private static Connection conn=null;
	public Connection getConnection() {
		try{
			// ��ʼ�����������ռ�
			Context ctx = new InitialContext();
			// ����java:/comp/envΪ�̶�·��
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			// ����jdbc/mysqldsΪ����Դ��JNDI�󶨵�����
			DataSource ds = (DataSource) envContext.lookup("jdbc/oracleConnent");
			Connection conn = ds.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}		
		return conn;
	}
	
	public List execueQuery(String sql){
		try{
	
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
	}
}
