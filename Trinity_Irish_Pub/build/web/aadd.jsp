<%-- 
    Document   : add
    Created on : Apr 8, 2014, 3:16:41 PM
    Author     : Rao
--%>

<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.xml.ws.Response"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
       <% 
           
       String tableno= request.getParameter("id");
        String itemname=request.getParameter("item");
        String status="success";
       try{
        String  Qty=request.getParameter("qty");
        DBConnection db=new DBConnection();
        Connection con=db.getConn();
       PreparedStatement ps=con.prepareStatement("insert into orders(item,quantity,price,total,tableid,status,checkout,type,action,waction) values(?,?,?,?,?,'in queue',0,?,'start cooking','serve')");
       PreparedStatement ps1=con.prepareStatement("select price from items where name like '%"+itemname+"%'");
       ResultSet rs=ps1.executeQuery();
       PreparedStatement p=DBConnection.getPrepare("select assign from tables where tid="+tableno);
       ResultSet r=p.executeQuery();
       String type="";
       r.next();
       type=r.getString(1);
       if(rs.next())
       {
         int price=rs.getInt(1);
         int total=price*Integer.parseInt(Qty);
       System.out.println("price:"+price+" table:"+tableno);
       ps.setString(1,itemname);
       ps.setString(2,Qty);
       ps.setString(3,price+"");
       ps.setString(4,total+"");
       ps.setString(5, tableno);
       ps.setString(6, type);
       ps.execute();
       System.out.println("------------------------------------------------------------");
               }
       }
       catch(Exception e){
           status="failed";
       }
     JSONObject json=new JSONObject();
     json.put("status", status);
      response.setContentType("application/json");
        response.getWriter().write(json.toString());
        %>