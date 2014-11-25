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
    PreparedStatement ps=DBConnection.getPrepare("select  id,name,price from items order by name");
    ResultSet rs=ps.executeQuery();
    JSONObject json=new JSONObject();
    JSONObject json1=new JSONObject();
    JSONArray jarr=new JSONArray();
    while(rs.next()){
        json1.put("id", rs.getString(1));
         json1.put("name", rs.getString(2));
          json1.put("price", rs.getString(3));
        jarr.add(json1);
    }
    json.put("items", jarr);
    response.setContentType("application/json");
        response.getWriter().write(json.toString());
%>
