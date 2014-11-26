<%-- 
    Document   : createPayment
    Created on : May 5, 2014, 12:04:19 PM
    Author     : krishna
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%
    String name=request.getParameter("name");
    String type=request.getParameter("type");
    PreparedStatement ps=DBConnection.getPrepare("insert into payment(name,type) values(?,?)");
    ps.setString(1, name);
    ps.setString(2, type);
    ps.execute();
    response.sendRedirect("paymenttype.jsp");
%>
