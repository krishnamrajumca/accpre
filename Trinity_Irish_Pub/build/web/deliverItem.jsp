<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
<%@page import="com.util.DBConnection"%>
<%
    String id=request.getParameter("table");
    DBConnection db=new DBConnection();
    Connection con=db.getConn();
    PreparedStatement ps = con.prepareStatement("update orders set status='delivered' where tableid="+id);
    int i=ps.executeUpdate();
    JSONObject json      = new JSONObject();
    if(i>0)
        json.put("status","success");
    else
        json.put("status","failure");
    response.setContentType("application/json");
    response.getWriter().write(json.toString());
%>