<%-- 
    Document   : displayimage
    Created on : Sep 24, 2013, 12:47:18 AM
    Author     : softmerge
--%>

<%@page import="com.util.DBConnection"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        

      <% 
            byte[] imgData = null ;
               DBConnection db=new DBConnection();
    Connection con=db.getConn();
             Statement stmt = con.createStatement();
              String id = request.getParameter("id"); 
              System.out.println("id:"+id);
              //System.out.println("Name:"+request.getParameter("name"));
     int id1=Integer.parseInt(id);
     ResultSet rs =stmt.executeQuery("select logo from items where id = "+id1) ; 
      if(rs.next())  
      {
          Blob bl = rs.getBlob(1);
          if(bl!=null){
    byte[] pict = bl.getBytes(1,(int)bl.length());
    response.setContentType("image/jpg");
    OutputStream o = response.getOutputStream();
    o.write(pict);
    o.flush();
    o.close();
          }
      }    
            %>


    </body>
</html>
