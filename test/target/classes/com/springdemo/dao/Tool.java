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
			// 初始化查找命名空间
			Context ctx = new InitialContext();
			// 参数java:/comp/env为固定路径
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			// 参数jdbc/mysqlds为数据源和JNDI绑定的名字
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
