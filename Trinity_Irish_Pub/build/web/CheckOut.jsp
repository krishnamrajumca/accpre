<%-- 
    Document   : CheckOut
    Created on : Dec 10, 2013, 9:05:30 AM
    Author     : krishna
--%>

<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    JSONObject json=new JSONObject();
    try{
    String id=request.getParameter("id");
    DBConnection db=new DBConnection();
    Connection con=db.getConn();
    PreparedStatement ps=con.prepareStatement("update orders set checkout=1 where tableid="+id);
    ps.execute();
    
    json.put("status", "success");
    }
    catch(Exception e){
    json.put("status", "failure");
    }
    finally{
    response.setContentType("application/json");
        response.getWriter().write(json.toString());

    }
%>
