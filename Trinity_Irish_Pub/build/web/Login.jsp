<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONException"%>
<%
    try{
        String id=request.getParameter("name");
        String pass=request.getParameter("password");
        PreparedStatement ps=DBConnection.getPrepare("select tid from tables where table_name='"+id+"' and password='"+pass+"'");
        ResultSet rs=ps.executeQuery();
        JSONObject json      = new JSONObject();
        JSONObject js=new JSONObject();
        JSONArray data=new JSONArray();
        if(rs.next())
        {
            js.put("ID",rs.getString(1));
        } 
        else
            js.put("ID","0");
        ps.close();
        response.setContentType("application/json");
        response.getWriter().write(js.toString());
    }
    catch (JSONException jse)
    {
        out.println(jse);
    }
%>