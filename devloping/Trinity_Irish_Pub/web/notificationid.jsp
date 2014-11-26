<%-- 
    Document   : Items
    Created on : 18 Jul, 2014, 10:11:41 PM
    Author     : krishna
--%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%
    PreparedStatement ps=DBConnection.getPrepare("select tableid from orders where checkout=1");
    ResultSet rs=ps.executeQuery();
    JSONObject json=new JSONObject();
    JSONObject json1=new JSONObject();
    JSONArray jar=new JSONArray();
    while(rs.next()){
        json1.put("id", rs.getString(1));
    
    
        jar.add(json1);
    }
    
    
    json.put("checked tables are", jar);
    
    
    response.setContentType("application/json");
    
        response.getWriter().write(json.toString());
    
%>
