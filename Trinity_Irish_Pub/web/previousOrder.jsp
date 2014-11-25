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
        String id=request.getParameter("table");
        DBConnection db=new DBConnection();
        Connection con=db.getConn();
        Statement statement = con.createStatement();
        JSONObject json      = new JSONObject();
        JSONObject js=null;
        JSONArray data1=new JSONArray();    
        ResultSet rs = statement.executeQuery("select * from orders where tableid="+id);
        js=new JSONObject();
        JSONArray data=new JSONArray();
        while(rs.next())
        {
            js.put("item",rs.getString(2));
            js.put("quantity",rs.getString(3));
            js.put("price",rs.getString(4));
            js.put("Total",rs.getString(5));  
            data1.add(js);
        }  
        json.put("LastOrder",data1);
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
     }
     catch (JSONException jse)
     {
     }
%>