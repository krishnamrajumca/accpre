<%-- 
    Document   : samp1
    Created on : Dec 5, 2013, 8:35:40 AM
    Author     : krishna
--%>



<%@page import="java.io.FileReader"%>
<%@page import="java.io.Reader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        data loading into local database...
        <%
            try{
                System.out.println("____________________________________");
                DBConnection db=new DBConnection();
                Connection con=db.getConn();
                
              
                
                
                
                
                PreparedStatement ps=con.prepareStatement("insert into menus values(?,?,?,?) on duplicate key update refid=?,name=?,orderr=?");
                PreparedStatement ps1=con.prepareStatement("insert into items values(?,?,?,?,?,?,?,?,null,null,null) on duplicate key update "
                        + "name=?,price=?,sdesc=?,ldesc=?,logo=?,parent=?,status=?");
                String obj = request.getParameter("data");
               
                
                JSONObject js=new JSONObject(obj);
                
                JSONArray arr=js.getJSONArray("menus");
              int len=arr.length();
              for(int i=0;i<len;i++){
               JSONObject o=arr.getJSONObject(i);
              
               String mid=o.getString("id");
               String refid=o.getString("refid");
               String order=o.getString("order");
               String name=o.getString("name");
               //out.println(mid+" "+refid+" "+order+" "+name);
               ps.setString(1,mid);
               ps.setString(2,refid);
               ps.setString(3,name);
               ps.setString(4,order);
//               ps.setString(8,mid);
               ps.setString(5,refid);
               ps.setString(6,name);
               ps.setString(7,order);
               ps.execute();
               JSONArray items=o.getJSONArray("items");
               for(int j=0;j<items.length();j++){
                   JSONObject ob=items.getJSONObject(j);
                   ps1.setString(1,ob.getString("item_id"));
                   ps1.setString(2,ob.getString("item_name"));
                   ps1.setString(3,ob.getString("price"));
                   ps1.setString(4,ob.getString("sdesc"));
                   ps1.setString(5,ob.getString("ldesc"));
                  // BufferedReader br=new BufferedReader(new FileReader(ob.get("logo")));
                   //Object obj1=ob.get("logo");
                   ps1.setString(6,ob.getString("logo"));
                   ps1.setString(7,ob.getString("parent_id"));
                   String st=ob.getString("status");
                   int status=Integer.parseInt(st);
                   ps1.setInt(8,status);
                   
//                   ps1.setString(16,ob.getString("item_id"));
                   ps1.setString(9,ob.getString("item_name"));
                   ps1.setString(10,ob.getString("price"));
                   ps1.setString(11,ob.getString("sdesc"));
                   ps1.setString(12,ob.getString("ldesc"));
                   ps1.setString(13,ob.getString("logo"));
                   ps1.setString(14,ob.getString("parent_id"));
                   ps1.setInt(15,status);
                   ps1.execute();
               }
               
              }
              out.println("<br>menu data loaded");
              JSONArray tables=js.getJSONArray("tables");
                //out.println(tables);
                ps1=con.prepareStatement("insert into tables values(?,?,?,null) on duplicate key update table_name=?,password=?");
                for(int i=0;i<tables.length();i++){
                JSONObject to=tables.getJSONObject(i);
               ps1.setString(1, to.getString("table_id"));
               ps1.setString(2,to.getString("name"));
               ps1.setString(3,to.getString("password"));
               ps1.setString(4,to.getString("name"));
               ps1.setString(5,to.getString("password"));
               ps1.execute();
                }
                //System.out.println("----jk--------------------------------\n"+s);
            }
            catch(Exception e){
               System.out.println(e);
               e.printStackTrace();
            out.println("error:"+e);
            }
            finally{
           response.sendRedirect("menu.jsp");
            }
        %>
    </body>
</html>
