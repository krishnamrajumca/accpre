<%-- 
    Document   : TableTransferJson
    Created on : Jul 27, 2014, 4:09:09 PM
    Author     : Accpre
--%>

<%@page import="java.sql.Connection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   
    String status="failed";
    try{
    String id=request.getParameter("id");
    String[] animalsArray = id.split(",");
    
  for (int i = 0; i < animalsArray.length; i++) {
        
   // out.println(animalsArray[i]);
   // DBConnection db=new DBConnection();
   // Connection con=db.getConn();
    PreparedStatement ps=DBConnection.getPrepare("delete from transactions where id="+animalsArray[i]);
    ps.execute();
     ps=DBConnection.getPrepare("delete from trans where trasid="+animalsArray[i]);
    ps.execute();
  }
    status="success";
    }
    catch(Exception e){}
    finally{
    JSONObject json=new JSONObject();
            json.put("status", status);
            response.setContentType("application/json");
        response.getWriter().write(json.toString());
    }
%>
