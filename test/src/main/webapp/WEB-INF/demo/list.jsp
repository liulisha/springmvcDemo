<%@page import="org.apache.taglibs.standard.lang.jstl.test.PageContextImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ page isELIgnored ="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*" %>     
<%@ page import="javax.naming.*" %>     
<%@ page import="javax.sql.DataSource" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>list.jsp</title>
  </head>
  <%     
        try {      
            //初始化查找命名空间
            Context ctx = new InitialContext();  
            //参数java:/comp/env为固定路径   
            Context envContext = (Context)ctx.lookup("java:/comp/env"); 
            //参数jdbc/mysqlds为数据源和JNDI绑定的名字
            DataSource ds = (DataSource)envContext.lookup("jdbc/oracleConnent"); 
            Connection conn = ds.getConnection();     
           // conn.close();     
            String sql="select navname,ordernum from tbl_popedom_nav ";
            Statement st=conn.createStatement();
            
            //工具类，网上粘贴
            ResultSet rs=st.executeQuery(sql);            
            List list = new ArrayList();
            ResultSetMetaData md = rs.getMetaData();
            int columnCount = md.getColumnCount(); //Map rowData;
            while (rs.next()) { //rowData = new HashMap(columnCount);
	            Map rowData = new HashMap();
	
	            for (int i = 1; i <= columnCount; i++) {
	                rowData.put(md.getColumnName(i), rs.getObject(i));
	            }
            list.add(rowData);
            }   
            
           rs.close();
           conn.close();
           System.out.println(list.size());
           session.setAttribute("listlist",list);
        } catch (NamingException e) {     
            e.printStackTrace();     
        } catch (SQLException e) {     
            e.printStackTrace();     
        }     
    %> 
  <body>
    <table>
        <script>
         var ss='${listlist}';
        </script>
        <th>
            <td style="width: 60px;">序号</td>
            <td style="width: 60px;">名称</td>
            <td style="width: 60px;">大小</td>
            <td style="width: 60px;">操作</td>
        </th>
        <c:forEach items="${listlist}" var="item"  varStatus="status" >
            <tr>
                <td>${status.index+1}</td>
                <td>${item.NAVNAME}</td>
                <td>${item.ORDERNUM}</td>
                <td><a href="#">操作</a></td>
            </tr>
        </c:forEach>
    </table>
  </body>
</html>
