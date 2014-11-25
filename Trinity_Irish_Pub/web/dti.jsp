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
<%
    String status="failed";
   
      try{
      
        String tableid=request.getParameter("tableid");
        String qty=request.getParameter("qty");
     String[] qtys = qty.split(",");
        String itemid=request.getParameter("itemid");
        String[] itemsids=itemid.split(",");
        //out.println(qty);
         //out.println(itemid);
        DBConnection db=new DBConnection();
        Connection con=db.getConn();
        
        Statement statement = con.createStatement();
        JSONObject json = new JSONObject();
        JSONObject js=new JSONObject();
        JSONArray data1=new JSONArray();
        
        PreparedStatement ps=DBConnection.getPrepare("select quantity,id from orders where tableid="+tableid);
        ResultSet rs=ps.executeQuery();
         while(rs.next()){
        json.put("qty", rs.getString(0));
         json.put("itemid", rs.getString(1));
    
    out.println("qty"+json);
        data1.add(json);
        
         }
        
        status="success";
    }catch(Exception e){}
         finally{
    JSONObject json=new JSONObject();
            json.put("status", status);
            response.setContentType("application/json");
        response.getWriter().write(json.toString());
      }
%>