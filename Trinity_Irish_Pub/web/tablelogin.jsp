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
        String id=request.getParameter("number");
        String pass=request.getParameter("password");
    DBConnection db=new DBConnection();
    Connection con=db.getConn();
    Statement statement = con.createStatement();
    ResultSet rs = statement.executeQuery("select tid from tables where table_name='"+id+"' and password='"+pass+"'");


    JSONObject json      = new JSONObject();
    JSONObject js=new JSONObject();
    
    JSONArray data=new JSONArray();
        if(rs.next())
        {
            
            js.put("ID",rs.getString(1));
//            js.put("Name",rs.getString(2));
//            js.put("Price",rs.getString(3));
//            js.put("short", rs.getString(4));
//            js.put("long",rs.getString(5));
//            js.put("logo","displayLogo.jsp?id="+rs.getString(1));
           
            
        }
        else
            js.put("ID","0");
        //data.add(js);
        //json.put("Data", data);
        
        //out.println(addresses);

    response.setContentType("application/json");
    response.getWriter().write(js.toString());
    }
        catch (JSONException jse)
    {
        
    }
%>