<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%
    String id=request.getParameter("id");
    PreparedStatement ps=DBConnection.getPrepare("delete from payment where id="+id);
    ps.execute();
    response.sendRedirect("paymenttype.jsp");
%>