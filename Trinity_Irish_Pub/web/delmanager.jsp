<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%

    String id=request.getParameter("id");
    PreparedStatement ps=DBConnection.getPrepare("delete from manager where id="+id);
    ps.execute();
    response.sendRedirect("Accounts.jsp?msg=Deleted successfully");
%>
