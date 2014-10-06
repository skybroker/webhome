<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
JSONObject obj = new JSONObject();
try {
    String connectionURL = "jdbc:mysql://localhost/webhome";
    Connection connection = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "100200");
	PreparedStatement stmt = null;
    if(!connection.isClosed()) {
		String sql = "select password,userid,username from userinfo where loginname=? LIMIT 1";
		stmt = connection.prepareStatement(sql);
		stmt.setString(1, username);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()){
			String pwd = rs.getString("password");
			String uname = rs.getString("username");
			int uid = rs.getInt("userid");
			if(password.equals(pwd)) {
				obj.put("result", 1);
				session.setAttribute("userid", uid);
				session.setAttribute("username", uname);
			} else {
				obj.put("result", 0);
				obj.put("message", "密码错误!");
			}
		} else {
			obj.put("result", 0);
			obj.put("message", "用户名不存在!");
		}
		rs.close();
	}
    connection.close();
}catch(Exception ex){
    out.println(ex);
}
out.print(obj);
out.flush();
%>