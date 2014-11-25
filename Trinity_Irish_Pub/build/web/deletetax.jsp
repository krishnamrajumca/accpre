<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%
    String name=request.getParameter("name");
    PreparedStatement ps=DBConnection.getPrepare("delete from tax where name='"+name+"'");
    ps.execute();
    ps=DBConnection.getPrepare("update items set tax=? where tax=?");
           ps.setString(1, null);
           ps.setString(2,name);
           ps.execute();
           ps=DBConnection.getPrepare("update items set ptax=? where ptax=?");
           ps.setString(1, null);
           ps.setString(2,name);
           ps.execute();
           ps=DBConnection.getPrepare("update items set taketax=? where taketax=?");
           ps.setString(1, null);
           ps.setString(2,name);
           ps.execute();
           response.sendRedirect("taxsettings.jsp");
%>