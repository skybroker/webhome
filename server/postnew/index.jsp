<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSz");

int userid = 100;

int type = 0;
try{
	type = Integer.parseInt( request.getParameter("type") );
}catch(Exception ex){
}
String title = request.getParameter("title");
String content = request.getParameter("content");
String findings = request.getParameter("findings");
String diagnosis = request.getParameter("diagnosis");
String discussion = request.getParameter("discussion");
String patientname = request.getParameter("patientname");
String patientage = request.getParameter("patientage");
String patientgender = request.getParameter("patientgender");
String modalitytype = request.getParameter("modalitytype");
String bodypart = request.getParameter("bodypart");
Boolean ret = false;
try {
    String connectionURL = "jdbc:mysql://localhost/webhome";
    Connection connection = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
    connection = DriverManager.getConnection(connectionURL, "root", "100200");
    if(!connection.isClosed()) {
         //out.println("Successfully connected to " + "MySQL server using TCP/IP...");
		 String sql = "insert post(title, content, findings, diagnosis, discussion, patientname, patientage, patientgender, modalitytype, bodypart, type, userid, createdtime, updatedtime)"
			+ " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,now(),now())";
		PreparedStatement pstatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		pstatement.setString(1, title);
		pstatement.setString(2, content);
		pstatement.setString(3, findings);
		pstatement.setString(4, diagnosis);
		pstatement.setString(5, discussion);
		pstatement.setString(6, patientname);
		pstatement.setString(7, patientage);
		pstatement.setString(8, patientgender);
		pstatement.setString(9, modalitytype);
		pstatement.setString(10, bodypart);
		pstatement.setInt(11, type);
		pstatement.setInt(12, userid);
		int rows = pstatement.executeUpdate();

		ResultSet rs = pstatement.getGeneratedKeys();
		if(rs.next()){
			ret = true;
			JSONObject obj=new JSONObject();
			obj.put("postid", rs.getInt(1));
			out.print(obj);
			out.flush();
		}
		rs.close();
	}
    connection.close();
	if(!ret){
		out.print("{postid:0}");
	}
}catch(Exception ex){
    out.println(ex);
}
%>