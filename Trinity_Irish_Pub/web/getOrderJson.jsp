<%--<%@page import="net.sf.json.JSONObject"%>--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.JSONObject"%>


<%
    JSONObject obj = new JSONObject();
    String value="failure";
    try{
        String table=request.getParameter("table");
        String item=request.getParameter("items");
        String price=request.getParameter("price");
        String qt=request.getParameter("quantity");
        String prices[]=price.split(",");
        String items[]=item.split(",");
        String quantity[]=qt.split(",");
        DBConnection db=new DBConnection();
        Connection con=db.getConn();
        PreparedStatement ps1=con.prepareStatement("select name from items where id=?");
        PreparedStatement ps=con.prepareStatement("insert into orders(tableid,item,quantity,price,total,status,action,waction,type) values(?,?,?,?,?,'in queue','start cooking','serve','Dinning')");
        ResultSet rs;
        
        for(int i=0;i<items.length;i++)
        {
            ps.setString(1,table);
            ps1.setString(1,(String) items[i]);
            rs=ps1.executeQuery();
            String name="";
            if(rs.next())
            {
                name=rs.getString(1);
                ps.setString(2,name);
                ps.setInt(3,Integer.parseInt(quantity[i]));
                ps.setDouble(4,Double.parseDouble(prices[i]));
                double tot=Integer.parseInt(quantity[i])*Double.parseDouble(prices[i]);
                ps.setDouble(5,tot);
                ps.execute();
                
            }   
        }  
        //ps=con.prepareStatement("insert into discounts(tableid) values(?)");
        //ps.setString(1,table+"");
        //ps.execute();
        value="success";
    }
    catch(Exception e){
        out.println(e);
        value+=e;
        e.printStackTrace();
    }
    finally{
        obj.put("status",value);
        response.setContentType("application/json");
        response.getWriter().write(obj.toString());
    }
%>
