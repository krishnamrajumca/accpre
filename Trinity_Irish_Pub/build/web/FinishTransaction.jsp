<%-- 
    Document   : FinishTransaction
    Created on : 19 Jul, 2014, 10:45:26 AM
    Author     : krishna
--%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
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
    String status="failed";
    try{
    String id=request.getParameter("id");
    String discounts=request.getParameter("discount");
    String others=request.getParameter("payment");
   HashMap<String,Double> hm=new HashMap<String,Double>();
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
double dis=0.0;
String discs[]=discounts.split(";");
for(int i=0;i<discs.length;i++){
    int ind=discs[i].lastIndexOf("-");
    double val=Double.parseDouble(discs[i].substring(ind+1));
    hm.put(discs[i].substring(0,ind), val);
    dis+=val;
}
  double sub=0.0,tax=0.0,total=0.0,disco=0.0; 
   HashMap<String,Double> taxmap=new HashMap<String,Double>();
   HashMap<String,Double> amtmap=new HashMap<String,Double>();
    while(rs.next()){
        double value=rs.getDouble(2);
        sub+=value;
        String taxname=rs.getString(1);
        String n="0";
        double discount=hm.get(taxname);
        amtmap.put(taxname, value);
        double tax1=getTax(taxname,value,discount);
        total+=tax1;
        taxmap.put(taxname, tax1);
    }
    ps=DBConnection.getPrepare("insert into transactions(id,type,amount,tdate,discount,other) values(?,?,?,now(),?,?)");
long dat=new Date().getTime();


ps.setString(1,dat+"");
ps.setString(2,"cash");
ps.setString(3,total+"");
ps.setDouble(4,dis);
ps.setString(5,others);
ps.execute();
ps=DBConnection.getPrepare("insert into trans values(?,?,?,?,?)");
PreparedStatement p=DBConnection.getPrepare("select price,quantity,total,item from orders where tableid="+id);
 rs=p.executeQuery();
while(rs.next()){
ps.setString(1,rs.getString(1));
ps.setString(2,rs.getString(2));
ps.setString(3,rs.getString(3));
ps.setString(4,rs.getString(4));
ps.setString(5, dat+"");
ps.execute();
}
p=DBConnection.getPrepare("delete from orders where tableid="+id);
p.execute();
p=DBConnection.getPrepare("delete from discounts where tableid="+id);
p.execute();

ps=DBConnection.getPrepare("insert into disc values(?,?,?,?,?)");
Set set=hm.keySet();
Iterator itr=set.iterator();
while(itr.hasNext()){
   String key=(String) itr.next();
   ps.setString(1, dat+"");
   ps.setString(2,key);
   ps.setDouble(3, hm.get(key));
   ps.setDouble(4, taxmap.get(key));
   ps.setDouble(5, amtmap.get(key));
   ps.execute();
}
status="success";
    }catch(Exception e){
    }
JSONObject json=new JSONObject();
json.put("status", status);
response.setContentType("application/json");
        response.getWriter().write(json.toString());
%>
