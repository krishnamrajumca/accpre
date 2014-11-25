<%@page import="com.util.DBConnection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONException"%>
<%
    try
    {
        String id=request.getParameter("id"); 
        String table=request.getParameter("table");
        String action=request.getParameter("action");
        String status=request.getParameter("status");
        DBConnection db=new DBConnection();
        Connection con=db.getConn();
        Statement statement = con.createStatement();
        JSONObject json = new JSONObject();
        JSONObject js=new JSONObject();
        JSONArray data1=new JSONArray();
        int i = statement.executeUpdate("update orders set action='"+action+"',status='"+status+"' where id="+id+" and tableid="+table);
        JSONArray data=new JSONArray();
       
            json.put("order","success");
        
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
    }
    catch (JSONException jse)
    {
        out.println(jse);
    }
%>