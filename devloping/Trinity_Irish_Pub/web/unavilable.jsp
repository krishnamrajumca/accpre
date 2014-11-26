<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
<%
String checked;
//int i=1;
//String id=(String)session.getAttribute("restaurant");
    String pid=(String)session.getAttribute("pid");
DBConnection db=new DBConnection();
Connection con=db.getConn();
String ch[]=request.getParameterValues("ch");

PreparedStatement ps=con.prepareStatement("update items set status=0 where id=?");

for(int i=0;i<ch.length;i++){
   
    ps.setString(1, ch[i]);
ps.executeUpdate();
}
response.sendRedirect("menu.jsp?iid="+pid);
%>