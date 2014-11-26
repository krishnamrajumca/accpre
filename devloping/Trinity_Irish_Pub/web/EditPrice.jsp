<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
<%
String id=request.getParameter("id");
String price=request.getParameter("price");
String menu=(String) session.getAttribute("pid");
DBConnection db=new DBConnection();
Connection con=db.getConn();
PreparedStatement ps=con.prepareStatement("update items set price=? where id=?");
ps.setString(1,price);
ps.setString(2,id);
ps.execute();
response.sendRedirect("menu.jsp?iid="+menu);
%>