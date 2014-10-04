<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%
int userid = 100;
String postid = request.getParameter("postid");
String content = request.getParameter("new-content");

Boolean ret = false;
try {
    String connectionURL = "jdbc:mysql://localhost/webhome";
    Connection connection = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "100200");
    if(!connection.isClosed()) {
         //out.println("Successfully connected to " + "MySQL server using TCP/IP...");
		 String sql = "insert reply(postid, content, userid, createdtime, updatedtime)"
			+ " VALUES(?,?,?,now(),now())";
		PreparedStatement pstatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		pstatement.setString(1, postid);
		pstatement.setString(2, content);
		pstatement.setInt(3, userid);

		int rows = pstatement.executeUpdate();

		ResultSet rs = pstatement.getGeneratedKeys();
		if(rs.next()){
			ret = true;
			JSONObject obj=new JSONObject();
			obj.put("replyid", rs.getInt(1));
			out.print(obj);
			out.flush();
		}
		rs.close();
	}
    connection.close();
	if(!ret){
		out.print("{replyid:0}");
	}
}catch(Exception ex){
    out.println(ex);
}
%>