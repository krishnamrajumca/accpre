<%-- 
    Document   : editPayment
    Created on : May 5, 2014, 12:13:01 PM
    Author     : krishna
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%
    String name=request.getParameter("name");
    String id=request.getParameter("id");
    PreparedStatement ps=DBConnection.getPrepare("update payment set name=? where id=?");
    ps.setString(1,name);
    ps.setString(2,id);
    ps.execute();
    response.sendRedirect("paymenttype.jsp");
%>