<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.text.SimpleDateFormat" %>  
<%@ page import="java.util.ArrayList" language="java" %>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSz");
ArrayList objs = new ArrayList();
for(int i=0; i<10; ++i){
    JSONObject obj=new JSONObject();
    obj.put("replyid", i);
    obj.put("postid", request.getParameter("postid"));
    obj.put("userid", 100+i);
    obj.put("username", "奥巴马"+i+"世");
    obj.put("content", "执行过程中，如果出现连不上 commondatastorage.googleapis.com （连接被重置），修改 trunk/webrtc/tools/update_resources.py，将 http 改为 https 就可以了");
    obj.put("quotedreplyid", "");
    obj.put("createdtime", sdf.format(new java.util.Date()) );
    obj.put("updatedtime", sdf.format(new java.util.Date()) );

	objs.add(obj);
}
out.print(objs);
out.flush();
%>