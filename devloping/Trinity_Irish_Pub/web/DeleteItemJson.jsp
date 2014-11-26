<%-- 
    Document   : TableTransferJson
    Created on : Jul 27, 2014, 4:09:09 PM
    Author     : Accpre
--%>

<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String status="failed";
    try{
    String id=request.getParameter("tableid");
    String itemid=request.getParameter("itemid");
    System.out.println("itemid:"+itemid);
    System.out.println("tableid:"+id);
    String items[]=itemid.split(",");
    for(int i=0;i<items.length;i++){
    PreparedStatement ps=DBConnection.getPrepare("delete from orders where tableid="+id+" and id="+items[i]);
    ps.execute();
    System.out.println("deleted:"+items[i]);
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
