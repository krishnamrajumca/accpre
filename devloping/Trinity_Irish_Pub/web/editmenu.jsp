
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
<%
try{
    //int rid=Integer.parseInt((String)session.getAttribute("restaurant"));
    String name=request.getParameter("name");
    String id=request.getParameter("id");
    DBConnection db=new DBConnection();
    Connection con=db.getConn();
    PreparedStatement ps=con.prepareStatement("update menus set name='"+name+"' where mid="+id);
    ps.execute();
    response.sendRedirect("menu.jsp");
}
catch(Exception e){
out.println(e);
}

%>