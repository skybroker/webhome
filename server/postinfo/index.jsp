<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.text.SimpleDateFormat" %>  
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSz");

    JSONObject obj=new JSONObject();
    obj.put("postid", request.getParameter("postid"));
    obj.put("userid", 100);
    obj.put("type", 1);
    obj.put("title", "埃博拉二三事");
    obj.put("content", "患者三天前从肯尼亚旅游回国，胸痛/发热，大家帮忙看看");
    obj.put("findings", "胸廓左右对称，双上肺见少许索条与邻近胸膜粘连。左上肺胸膜下见泡影，双肺内见弥漫分布粟粒结节，分布教均匀，大小较均匀。双肺门似见斑点状钙化灶。双肺门及纵隔内多发肿大淋巴结，双侧胸腔未见积液征。主动脉肺动脉及其分支显影较好，未见异常密度。肝右叶隔顶区见细小低密度");
    obj.put("diagnosis", "疑似埃博拉");
    obj.put("discussion", "");
    obj.put("createdtime", sdf.format(new java.util.Date()) );
    obj.put("updatedtime", sdf.format(new java.util.Date()) );

    obj.put("pat_name", "张三");
    obj.put("pat_age", "49岁");
    obj.put("pat_gender", "M");
    obj.put("modalitytype", "CT");
    obj.put("bodypart", "chest");

out.print(obj);
out.flush();
%>