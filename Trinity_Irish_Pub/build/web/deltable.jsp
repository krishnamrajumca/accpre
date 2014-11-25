<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%

    String id=request.getParameter("id");
    PreparedStatement ps=DBConnection.getPrepare("delete from tables where tid="+id);
    ps.execute();
    response.sendRedirect("tableacc.jsp?msg=Deleted successfully");
%>
