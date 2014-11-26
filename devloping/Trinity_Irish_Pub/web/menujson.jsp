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
try{
    String menu=request.getParameter("menu");
    DBConnection db=new DBConnection();
    Connection con=db.getConn();
    Statement statement = con.createStatement();
    JSONObject json      = new JSONObject();
    JSONObject js=null;
    JSONArray data1=new JSONArray();    
    ResultSet rs = statement.executeQuery("select * from items where parent in(select m1.mid from menus m1,menus m2 where m2.name='"+menu+"' and m1.refid=m2.mid)");
    js=new JSONObject();
    JSONArray data=new JSONArray();
    while(rs.next())
    {      
        js.put("id",rs.getString(1));
        js.put("name",rs.getString(2));
        js.put("price",rs.getString(3));
        js.put("short_desc",rs.getString(4));
        js.put("long_desc",rs.getString(5));
        js.put("logo","http://192.168.1.7:8084/Rest-manager/displayLogo.jsp?id="+rs.getString(1));
        js.put("isAvailable",rs.getInt("status"));
        data1.add(js);
    } 
    json.put("Data",data1);
    response.setContentType("application/json");
    response.getWriter().write(json.toString());
    }
catch (JSONException jse)
{
}
%>