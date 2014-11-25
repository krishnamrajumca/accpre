<%-- 
    Document   : PaymentTypes
    Created on : 18 Jul, 2014, 1:07:18 PM
    Author     : krishna
--%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%
PreparedStatement ps=DBConnection.getPrepare("select name from payment");
ResultSet rs=ps.executeQuery();

JSONObject obj=new JSONObject();
JSONObject obj1=new JSONObject();
JSONArray arr=new JSONArray();

while(rs.next()){
    obj1.put("types",rs.getString(1) );
    arr.add(obj1);
}
obj.put("payments",arr );
 response.setContentType("application/json");
        response.getWriter().write(obj.toString());
%>
