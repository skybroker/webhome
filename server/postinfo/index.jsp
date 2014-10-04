<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.text.SimpleDateFormat" %>  
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSz");

Statement stmt = null;
int userid = 100;
String postid = request.getParameter("postid");
JSONObject obj = new JSONObject();
try {
    String connectionURL = "jdbc:mysql://localhost/webhome";
    Connection connection = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "100200");
    if(!connection.isClosed()) {
		String sql = "select * from post where postid="+postid+" LIMIT 1";
		stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()){
			obj.put("postid", rs.getInt("postid"));
			obj.put("userid", userid);
			obj.put("type", rs.getInt("type"));
			obj.put("title", rs.getString("title"));
			obj.put("content", rs.getString("content"));
			obj.put("findings", rs.getString("findings"));
			obj.put("diagnosis", rs.getString("diagnosis"));
			obj.put("discussion", rs.getString("discussion"));
			if(rs.getTimestamp("createdtime") != null)
				obj.put("createdtime", sdf.format((java.util.Date)rs.getTimestamp("createdtime")));
			if(rs.getTimestamp("updatedtime") != null)
				obj.put("updatedtime", sdf.format((java.util.Date)rs.getTimestamp("updatedtime")));

			obj.put("patientname", rs.getString("patientname"));
			obj.put("patientage", rs.getString("patientage"));
			obj.put("patientgender", rs.getString("patientgender"));
			obj.put("modalitytype", rs.getString("modalitytype"));
			obj.put("bodypart", rs.getString("bodypart"));
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