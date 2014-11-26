<%-- 
    Document   : add
    Created on : Apr 8, 2014, 3:16:41 PM
    Author     : Rao
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="javax.xml.ws.Response"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
           
       String tableno= (String)session.getAttribute("name");
        String itemname=request.getParameter("item");
        String type=request.getParameter("type");
        String  Qty=request.getParameter("qty");
        DBConnection db=new DBConnection();
        Connection con=db.getConn();
        System.out.println("------------------------------------------------------------");
       PreparedStatement ps=con.prepareStatement("insert into orders(item,quantity,price,total,tableid,status,checkout,type,action,waction) values(?,?,?,?,?,'in queue',0,?,'start cooking','serve')");
       PreparedStatement ps1=con.prepareStatement("select price from items where name like '%"+itemname+"%'");
       ResultSet rs=ps1.executeQuery();
       if(rs.next())
       {
         int price=rs.getInt(1);
         int total=price*Integer.parseInt(Qty);
       System.out.println("price:"+price);
       ps.setString(1,itemname);
       ps.setString(2,Qty);
       ps.setString(3,price+"");
       ps.setString(4,total+"");
       ps.setString(5, tableno);
       ps.setString(6, type);
       ps.execute();
       System.out.println("------------------------------------------------------------");
               }
     response.sendRedirect("OrderManagement.jsp?id="+tableno+"&plc="+type);
        %>
</body>
</html>