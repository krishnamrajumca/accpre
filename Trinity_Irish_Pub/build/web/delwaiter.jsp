<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%

    String id=request.getParameter("id");
    PreparedStatement ps=DBConnection.getPrepare("delete from waiteracc where id="+id);
    ps.execute();
    response.sendRedirect("waiteraccount.jsp?msg=Deleted successfully");
%>
