<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
<%
try{
    //int rid=Integer.parseInt((String)session.getAttribute("restaurant"));
    String id=request.getParameter("id");
    DBConnection db=new DBConnection();
    Connection con=db.getConn();
        PreparedStatement ps=con.prepareStatement("select max(orderr),refid from menus where refid in(select refid from menus where mid="+id+") group by refid");
        ResultSet rs=ps.executeQuery();
        int maxorder=0;
        int ref=-1;
        int order=0;
        if(rs.next())
            maxorder=rs.getInt(1);
            ref=rs.getInt(2);
        ps=con.prepareStatement("select orderr from menus where mid="+id);
        rs=ps.executeQuery();   
        if(rs.next())
            order=rs.getInt(1);
        
        ps=con.prepareStatement("delete from menus where mid="+id);
       ps.execute();
       ps=con.prepareStatement("update menus set orderr=orderr-1 where orderr=? and refid="+ref);
       for(int i=order+1;i<=maxorder;i++){
       ps.setInt(1,i);
       ps.executeUpdate();
       }
response.sendRedirect("menu.jsp");
        }

catch(Exception e){
   e.printStackTrace();
   out.println(e);
}
%>