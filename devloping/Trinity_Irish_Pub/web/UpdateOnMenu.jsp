<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
<%
String id=request.getParameter("table");
String discount=request.getParameter("discount");
DBConnection db=new DBConnection();
Connection con=db.getConn();
PreparedStatement ps=con.prepareStatement("update discounts set discount=? where tableid="+id);
ps.setString(1,discount);
ps.execute();
response.sendRedirect("BillDesk.jsp?id="+id+"&value="+discount);
%>