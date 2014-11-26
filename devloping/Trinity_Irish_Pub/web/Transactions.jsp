<%-- 
    Document   : Transactions
    Created on : 18 Jul, 2014, 8:24:51 PM
    Author     : krishna
--%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.action.accounts.Accounts"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    String from=request.getParameter("from");
    String to=request.getParameter("to");
    String sql="";
    if(from==null && to==null)
            sql="select *from transactions order by id desc";
            else if(from=="" && to=="")
            sql="select *from transactions order by id desc";
            else{
            
           sql= "select *from transactions where tdate between '"+from+"' and '"+to+"' order by id desc";
         
                System.out.println(sql);
            }
            
            PreparedStatement ps=DBConnection.getPrepare(sql);
            System.out.println("Transactions: "+sql);
            //ps.setString(1, txn);
            ResultSet rs=ps.executeQuery();
            String id="",amount="",t="",date="";
            JSONObject json=new JSONObject();
            JSONArray jarr=new JSONArray();
            while(rs.next()){
                JSONObject j=new JSONObject();
                id=rs.getString(1);
                t=rs.getString(6);
                amount=rs.getString(3);
                date=rs.getString(4);
                String discount=rs.getString(5);
                String tax=Accounts.getTransTax(id);
                j.put("id", id);
                j.put("type", t);
                j.put("amount",amount);
                j.put("date",date);
                j.put("discount", discount);
                j.put("tax", tax);
                jarr.add(j);
            }
            json.put("data", jarr);
            response.setContentType("application/json");
        response.getWriter().write(json.toString());
%>