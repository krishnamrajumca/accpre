
 <%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
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
    String  qty=request.getParameter("qty");
    String id=request.getParameter("tableid");
    String itemid=request.getParameter("itemid");
    System.out.println("Quenty:"+qty);
    System.out.println("itemid:"+itemid);
    System.out.println("id:"+id);
    ArrayList<String> sitemids = new ArrayList<String>();
    ArrayList<String> squantity = new ArrayList<String>();
    
    String[] items = itemid.split(",");
    String[] qtys = qty.split(",");
    
    for(int i=0;i<items.length;i++){
        PreparedStatement ps=DBConnection.getPrepare("update orders set quantity=?,total=price*quantity where tableid=? and id=?");
        ps.setString(1, qtys[i]);
        ps.setString(2,id);
        ps.setString(3,items[i]);
      
        ps.execute();
    }
    status="success";
    
    
    
    }
    catch(Exception e){
        e.printStackTrace();
    status="failed";
    
    }
    finally{
        System.out.println("Status:"+status);
    JSONObject json=new JSONObject();
            json.put("status", status);
            response.setContentType("application/json");
        response.getWriter().write(json.toString());
    }
%>
