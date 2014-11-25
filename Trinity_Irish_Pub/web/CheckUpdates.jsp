<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
<%
PreparedStatement ps=DBConnection.getPrepare("select name,mid from menus where mid in(select distinct(parent) from items)");

JSONObject json=new JSONObject();
JSONObject u=new JSONObject();
JSONArray data=new JSONArray();
JSONArray data1=new JSONArray();
ResultSet r=ps.executeQuery();
while(r.next())
{
    JSONObject j=new JSONObject();
    PreparedStatement p=DBConnection.getPrepare("select *from items where parent="+r.getString(2));
    ResultSet rs=p.executeQuery();
    JSONArray d=new JSONArray();
    j.put("catageory", r.getString(1));
    while(rs.next())
    {
        JSONObject items=new JSONObject();
        JSONObject un=new JSONObject();
        items.put("id", rs.getString(1));
        items.put("name", rs.getString(2));
        items.put("price", rs.getString(3));
        items.put("short", rs.getString(4));
        items.put("long", rs.getString(5));
        items.put("isAvailable", rs.getString(8));
        d.add(items);
        if(rs.getInt(8)==0)
        {
            un.put("id", rs.getString(1));
            data1.add(un);  
        }
    }
    j.put("items",d);
    data.add(j);
}
JSONObject j1=new JSONObject();
JSONArray large=new JSONArray();
JSONArray small=new JSONArray();
ps=DBConnection.getPrepare("select id,name,price,status from items where parent=30 and name like '%large'");
r=ps.executeQuery();
while(r.next()){
JSONObject jobj=new JSONObject();
jobj.put("id",r.getString(1));
String s=r.getString(2).replace(" large","");
s=s.replace(" Large","");
jobj.put("name",s);
jobj.put("price",r.getString(3));
jobj.put("isAvailable",r.getString(4));
large.add(jobj);
}
ps=DBConnection.getPrepare("select id,name,price,status from items where parent=30 and name like '%small'");
r=ps.executeQuery();
while(r.next()){
JSONObject jobj=new JSONObject();
jobj.put("id",r.getString(1));
String s=r.getString(2).replace(" small","");
s=s.replace(" Small","");
jobj.put("name",s);
jobj.put("price",r.getString(3));
jobj.put("isAvailable",r.getString(4));
small.add(jobj);
}
j1.put("large", large);
j1.put("small", small);
json.put("Scotch Whisky",j1);
json.put("unavilable",data1);
json.put("catageories",data);
response.setContentType("application/json");
        response.getWriter().write(json.toString());

%>