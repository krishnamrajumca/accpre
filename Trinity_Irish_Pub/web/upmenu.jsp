<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
<%
try{
    int rid=Integer.parseInt((String)session.getAttribute("restaurant"));
    int id=Integer.parseInt(request.getParameter("id"));
    
    DBConnection db=new DBConnection();
    Connection con=db.getConn();
    PreparedStatement ps,ps1,ps2;
           ps=con.prepareStatement("select refid,orderr from menus where mid="+id);
           ResultSet rs=ps.executeQuery();
           int ref=-1,order=1;
               if(rs.next()){
                ref=rs.getInt(1);
                order=rs.getInt(2);
               out.println(ref);
               }  
               if(order>1){
               ps=con.prepareStatement("select mid from menus where refid="+ref+" and orderr="+(order-1));
               rs=ps.executeQuery();
               int next=-1;
               if(rs.next()){
               next=rs.getInt(1);
               }
               ps=con.prepareStatement("update menus set orderr=orderr-1 where mid="+id);
               ps1=con.prepareStatement("update menus set orderr=orderr+1 where mid="+next);
               ps.execute();
               ps1.execute();
               out.println(next);
                   }
    response.sendRedirect("menu.jsp?name="+rid);
        }

catch(Exception e){
   e.printStackTrace();
   out.println(e);
}
%>