<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.text.SimpleDateFormat" %>  
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSz");

String title = request.getParameter("title");
String content = request.getParameter("content");
String findings = request.getParameter("findings");
String diagnosis = request.getParameter("diagnosis");
String discussion = request.getParameter("discussion");
String pat_age = request.getParameter("pat_age");
String pat_gender = request.getParameter("pat_gender");
String modalitytype = request.getParameter("modalitytype");
String bodypart = request.getParameter("bodypart");

    JSONObject obj=new JSONObject();
    obj.put("postid", 1);

out.print(obj);
out.flush();
%>