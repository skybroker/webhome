<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.text.SimpleDateFormat" %>  
<%@ page import="java.util.ArrayList" language="java" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
ArrayList objs = new ArrayList();
Statement stmt = null;
int userid = 100;
String postid = request.getParameter("postid");
try {
    String connectionURL = "jdbc:mysql://localhost/webhome";
    Connection connection = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "100200");
    if(!connection.isClosed()) {
		String sql = "select * from reply where postid="+postid;
		stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			JSONObject obj=new JSONObject();
			obj.put("replyid", rs.getInt("replyid"));
			obj.put("postid", rs.getInt("postid"));
			obj.put("userid", userid);
			obj.put("quotedreplyid", rs.getInt("quotedreplyid"));
			obj.put("username", "User Name".replace("<", "&lt;").replace(">", "&gt;"));
			obj.put("content", rs.getString("content").replace("<", "&lt;").replace(">", "&gt;"));
			if(rs.getTimestamp("createdtime") != null)
				obj.put("createdtime", sdf.format((java.util.Date)rs.getTimestamp("createdtime")));
			if(rs.getTimestamp("updatedtime") != null)
				obj.put("updatedtime", sdf.format((java.util.Date)rs.getTimestamp("updatedtime")));
			objs.add(obj);
		}
		rs.close();
	}
    connection.close();
}catch(Exception ex){
    out.println(ex);
}
out.print(objs);
out.flush();
%>