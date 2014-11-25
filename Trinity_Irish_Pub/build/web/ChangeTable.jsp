<%-- 
    Document   : ChangeTable
    Created on : Mar 11, 2014, 12:22:38 PM
    Author     : Rao
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
            String present=request.getParameter("p");
            String to=request.getParameter("c");
              session.setAttribute("name", to);
           PreparedStatement ps1=DBConnection.getPrepare("select count(*)  from tables where tid="+to);
           ResultSet rs=ps1.executeQuery();
           int cnt=0;
           if(rs.next())
               cnt=rs.getInt(1);
           System.out.println("------------------------------------------------"+cnt);
           if(cnt!=0)
           {
            PreparedStatement ps=DBConnection.getPrepare("update orders set tableid=? where tableid=?");
            ps.setString(1, to);
            ps.setString(2,present);
            ps.execute();
              response.sendRedirect("BillDesk.jsp"); 
           
           }
//             response.sendRedirect("BillDesk.jsp?msg=no table"+to);  
             
              else{
              
           response.sendRedirect("BillDesk.jsp?msg= table " +to+" is not avilable");  
                      }
        %>
    </body>
</html>
