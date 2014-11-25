<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
<%
String[] ids=request.getParameterValues("ch");
DBConnection db=new DBConnection();
Connection con=db.getConn();
PreparedStatement ps=con.prepareStatement("delete from transactions where id=?");
PreparedStatement ps1=con.prepareStatement("delete from trans where  trasid=?");

for(int i=0;i<ids.length;i++)
{
ps.setString(1,ids[i]);
ps1.setString(1,ids[i]);
ps.execute();
ps1.execute();
}
response.sendRedirect("transactions");
%>