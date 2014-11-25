<%-- 
    Document   : neworder
    Created on : Apr 7, 2014, 1:51:31 PM
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
        <% DBConnection db=new DBConnection();
      Connection con=db.getConn();
      PreparedStatement ps=con.prepareStatement("select  name from items");
        ResultSet rs=ps.executeQuery();
        while(rs.next())
        {
            String name=rs.getString(1);
       
        out.println(name);
        out.println("<br>");
        }
      %>
      
    </body>
</html>
