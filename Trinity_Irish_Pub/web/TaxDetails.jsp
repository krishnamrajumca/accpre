<%-- 
    Document   : TaxDetails
    Created on : 18 Jul, 2014, 12:15:57 PM
    Author     : krishna
--%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%!
    public double getTax(String name,double amt,double dis){
        
        double total=0.0;
        HashMap<String,Double> hm=new HashMap<String,Double>();
        PreparedStatement ps=DBConnection.getPrepare("select value,op,wit,formula,taxtype from tax where name=?");
        try{
            System.out.println("Discount:"+dis);
        ps.setString(1, name);
        ResultSet rs=ps.executeQuery();
        String form="sub-discount";
        System.out.println("------------------------------------------------------");
        while(rs.next()){
            double val=rs.getDouble(1);
            String op=rs.getString(2);
            String wit=rs.getString(3);
            form=rs.getString(4);
            String type=rs.getString(5);
            double sub=0.0;
         
            if(wit.equalsIgnoreCase("sub-discount"))
                sub=amt-dis;
            else
                sub=hm.get(wit);
            if(op.equals("%")){
                sub=(val/100)*sub;
             
            }
            else if(op.equals("*"))
                sub=val*sub;
            else
                sub+=val;
            hm.put(type,sub);
            System.out.println("Type:"+type+" amt:"+sub);
        }
        String s[]=form.split(";");
        for(int i=1;i<s.length;i++){
            total+=hm.get(s[i]);
        }
        }catch(Exception e){}
    return total;
    }
%>
<%
    String id=request.getParameter("id");
    String discounts=request.getParameter("discount");
    if(discounts==null)
        discounts="";
    String disc[]=discounts.split(";");
    PreparedStatement ps=DBConnection.getPrepare("select assign from tables where tid="+id);
    ResultSet rs=ps.executeQuery();
    String type="Dinning";
    if(rs.next())
        type=rs.getString(1);
    String sql="";
    if(type.equalsIgnoreCase("dinning"))
        sql="select  tax,sum(total) from orders o,items i where tableid=? and name=item group by tax";
    else if(type.equalsIgnoreCase("parcel"))
        sql="select  ptax,sum(total) from orders o,items i where tableid=? and name=item group by ptax";
    else
        sql="select  taketax,sum(total) from orders o,items i where tableid=? and name=item group by taketax";
    ps=DBConnection.getPrepare(sql);
    ps.setString(1,id);
    rs=ps.executeQuery();
    JSONObject json=new JSONObject();
    
    JSONObject jarr=new JSONObject();
    double sub=0.0,tax=0.0,total=0.0,disco=0.0; 
    while(rs.next()){
        double value=rs.getDouble(2);
        sub+=value;
        String taxname=rs.getString(1);
        String n="0";
        for(int i=0;i<disc.length;i++){
      
            if(disc[i].contains(taxname)){
                n=disc[i].substring(disc[i].lastIndexOf("-")+1);
            }
        }
        double discount=Double.parseDouble(n);
        disco+=discount;
        total+=getTax(taxname,value,discount);
        
    }
    jarr.put("subtotal", sub);
    jarr.put("tax",total);
    jarr.put("discount",disco);
    jarr.put("GrandTotal",sub+total-disco);
   
    response.setContentType("application/json");
        response.getWriter().write(jarr.toString());
%>
