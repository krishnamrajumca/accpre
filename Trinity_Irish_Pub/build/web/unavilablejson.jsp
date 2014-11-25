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
        
       
        DBConnection db=new DBConnection();
        Connection con=db.getConn();
        Statement statement = con.createStatement();
        JSONObject json = new JSONObject();
        JSONObject js=new JSONObject();
        JSONArray data1=new JSONArray();
        ResultSet rs = statement.executeQuery("select id from items where status=0");
        JSONArray data=new JSONArray();
        while(rs.next()){
        js.put("id",rs.getString(1));
        data.add(js);
        }
        json.put("unavilable",data);
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
    }
    catch (JSONException jse)
    {
    }
%>