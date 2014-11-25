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
        String id=request.getParameter("id");
            DBConnection db=new DBConnection();
        Connection con=db.getConn();
        Statement statement = con.createStatement();
   // ResultSet rs = statement.executeQuery("select subid,sub_menu from menu where mid=100");
    ResultSet rs = statement.executeQuery("select subid,sub_menu,price from menu where mid="+id);

    JSONObject json      = new JSONObject();
    JSONObject js=new JSONObject();

//JSONArray  ids = new JSONArray();
   // JSONArray menus=new JSONArray();
   // JSONArray price=new JSONArray();
    JSONArray data=new JSONArray();
        while(rs.next())
        {

//            ids.add(result.getString(1));
//            menus.add(result.getString(2));
//            price.add(result.getString(3));
            js.put("ID",rs.getString(1));
            js.put("Name", rs.getString(2));
            js.put("Price", rs.getString(3));
            data.add(js);
        }
        json.put("Items", data);



    response.setContentType("application/json");
    response.getWriter().write(json.toString());
    }
        catch (JSONException jse)
    {

    }
%>