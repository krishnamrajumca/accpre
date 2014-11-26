<%-- 
    Document   : ActiveBillDesk
    Created on : 18 Jul, 2014, 11:49:47 AM
    Author     : krishna
--%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    PreparedStatement ps=DBConnection.getPrepare("select distinct(tableid) from orders");
    ResultSet rs=ps.executeQuery();
    JSONObject json      = new JSONObject();
    JSONObject json1      = new JSONObject();
    JSONArray jarr=new JSONArray();
    while(rs.next()){
        json1.put("id", rs.getString(1));
    jarr.add(json1);
    }
    json.put("table", jarr);
    response.setContentType("application/json");
        response.getWriter().write(json.toString());
%>
