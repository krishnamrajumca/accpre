<%-- 
    Document   : TablesbyType
    Created on : Jul 27, 2014, 3:06:41 PM
    Author     : Accpre
--%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%
    int id=Integer.parseInt(request.getParameter("id"));
    String types[]={"Dinning","Take Away","Parcel"};
    PreparedStatement ps=DBConnection.getPrepare("select tid from tables where assign='"+types[id]+"'");
    ResultSet rs=ps.executeQuery();
    JSONObject json=new JSONObject();
    JSONArray jarr=new JSONArray();
    JSONObject obj=null;
    while(rs.next()){
        obj=new JSONObject();
        String tid=rs.getString(1);
        obj.put("id", tid);
        obj.put("isActive",isActive(tid));
        jarr.add(obj);
    }
    json.put("tables",jarr);
    response.setContentType("application/json");
        response.getWriter().write(json.toString());
%>
<%!
    public String isActive(String id){
        String act="0";
        try{
        PreparedStatement ps=DBConnection.getPrepare("select count(*) from orders where tableid="+id);
        ResultSet rs=ps.executeQuery();
        int cnt=0;
        if(rs.next())
            cnt=rs.getInt(1);
        if(cnt>0)
            act="1";
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
        return act;
        }
    
    }
%>