<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONException"%>
<%!
public String getItemId(String item){
String id="";
PreparedStatement ps=DBConnection.getPrepare("select id from items where name='"+item+"'");
try{
ResultSet rs=ps.executeQuery();
if(rs.next())
    id=rs.getString(1);
}catch(Exception e){
e.printStackTrace();
}
return id;
}
%>
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
        ResultSet rs = statement.executeQuery("select item,id,quantity,status,action from orders where tableid="+id+" and action not in('Completed')");
        js=new JSONObject();
        JSONArray data=new JSONArray();
        while(rs.next())
        {
            js.put("item",rs.getString(1));
            js.put("id",rs.getString(2));
            js.put("quantity",rs.getString(3));
            js.put("status",rs.getString(4));
            js.put("action",rs.getString(5));
            js.put("itemid", getItemId(rs.getString(1)));
            data1.add(js);
        }
        json.put("order",data1);
        response.setContentType("application/json");
        response.getWriter().write(json.toString());
    }
    catch (JSONException jse)
    {

    }
%>