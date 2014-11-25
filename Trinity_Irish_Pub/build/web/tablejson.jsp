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
            DBConnection db=new DBConnection();
        Connection con=db.getConn();
        Statement statement = con.createStatement();
    ResultSet rs = statement.executeQuery("select tid,table_name,password from tables");


    JSONObject json      = new JSONObject();
    JSONObject js=new JSONObject();
    
    JSONArray data=new JSONArray();
        while(rs.next())
        {
            
            js.put("ID",rs.getString(1));
            js.put("Name",rs.getString(2));
            js.put("Password",rs.getString(3));
           
            data.add(js);
        }
        json.put("Data", data);
        
        //out.println(addresses);

    response.setContentType("application/json");
    response.getWriter().write(json.toString());
    }
        catch (JSONException jse)
    {

    }
%>