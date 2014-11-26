<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
<%
String id=request.getParameter("id");
String type=request.getParameter("type");
String amount=request.getParameter("amount");
DBConnection db=new DBConnection();
Connection con=db.getConn();
PreparedStatement ps=con.prepareStatement("insert into transactions(id,type,amount,tdate) values(?,?,?,now())");
long dat=new Date().getTime();
ps.setString(1,dat+"");
ps.setString(2,type);
ps.setString(3,amount);
ps.execute();
ps=con.prepareStatement("insert into trans values(?,?,?,?,?)");
PreparedStatement p=con.prepareStatement("select price,quantity,total,item from orders where tableid="+id);
ResultSet rs=p.executeQuery();
while(rs.next()){
ps.setString(1,rs.getString(1));
ps.setString(2,rs.getString(2));
ps.setString(3,rs.getString(3));
ps.setString(4,rs.getString(4));
ps.setString(5, dat+"");
ps.execute();
}
p=con.prepareStatement("delete from orders where tableid="+id);
p.execute();
response.sendRedirect("BillDesk.jsp?id="+id);
%>