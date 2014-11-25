<%-- 
    Document   : editTPrice
    Created on : Apr 10, 2014, 7:47:33 PM
    Author     : Rao
--%>

<%@page import="java.sql.ResultSet"%>
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
             String pr=(String) session.getAttribute("name1");
            String sid=(String) session.getAttribute("name");
         String id=request.getParameter("id");
            String price=request.getParameter("price");  
        DBConnection db=new DBConnection();
        Connection con=db.getConn();
        PreparedStatement ps=con.prepareStatement("select price from orders where id=?");
        ps.setString(1,id);
        ResultSet rs=ps.executeQuery();
        Double p=0.0;
        if(rs.next())
            p=rs.getDouble(1);
        ps=con.prepareStatement("update orders set  quantity=?,total=? where id=?");
        ps.setString(1,price);
        ps.setDouble(2,Integer.parseInt(price)*p);
        ps.setString(3,id);
        ps.execute();
        
        
        PreparedStatement ps1=con.prepareStatement("insert into modifiedbill values(?,?,now())");
        ps1.setString(1,pr);
        ps1.setString(2,price);
//        ps1.execute();
        
        
        
        
        
        response.sendRedirect("OrderManagement.jsp?id="+sid);
        
     %>
    </body>
</html>
