<%@page import="com.util.DBConnection"%>
<%@ page import="java.sql.*" %>
<%!
public int nullIntconvert(String str){
int num=0;
if(str==null){
str="0";
}
else if((str.trim()).equals("null")){
str="0";
}
else if(str.equals("")) {
str="0";
}
try{
num=Integer.parseInt(str);
}
catch(Exception e){ }
return num;
}
%>
<%
String pg=request.getParameter("iPageNo");
        DBConnection db=new DBConnection();
        Connection conn=db.getConn();
 int showRows=2;
int totalRecords=5;
int totalRows=nullIntconvert(request.getParameter("totalRows"));
int totalPages=nullIntconvert(request.getParameter("totalPages"));
int iPageNo=nullIntconvert(request.getParameter("iPageNo"));
int cPageNo=nullIntconvert(request.getParameter("cPageNo"));
int startResult=0;
int endResult=0;
if(iPageNo==0){
iPageNo=0;
}
else{
iPageNo=Math.abs((iPageNo-1)*showRows);
}
String query1="SELECT SQL_CALC_FOUND_ROWS mid,name FROM menus limit "+iPageNo+","+showRows+"";
PreparedStatement ps1=conn.prepareStatement(query1);
ResultSet rs1=ps1.executeQuery();

String query2="SELECT FOUND_ROWS() as cnt";
PreparedStatement ps2=conn.prepareStatement(query2);
ResultSet rs2=ps2.executeQuery();
if(rs2.next()){
totalRows=rs2.getInt("cnt");
}
%>
<html>
<body><form>
<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
<input type="hidden" name="showRows" value="<%=showRows%>">
<table width="100%" cellpadding="0" cellspacing="0" style="border: 1px solid green" >
<tr>
<%while(rs1.next()){
%>
<td width="50%" style="text-align: center"><font style="color:red;size:20px;"><%=rs1.getString(2)%></font>
<%PreparedStatement ps=conn.prepareStatement("select name,price,id,status from items where parent="+rs1.getString(1));
ResultSet rs=ps.executeQuery();
out.println("<table width='100%' style='border:1px solid green'>");
while(rs.next()){%>
<tr height="50px">
    <%if(rs.getInt(4)==1){%>
<td style='text-align:left'><input type='checkbox' name='ch2' value='<%=rs.getString(3)%>'/><font style="color:green"><%=rs.getString(1)%></font></td>

<%}
    else{%>
    <td style='text-align:left'><input type='checkbox' name='ch2' value='<%=rs.getString(3)%>'/><%=rs.getString(1)%></td>

    <%}%>
    <td><%=rs.getString(2)%> <a href="javascript:myFunction(<%=rs.getString(2)%>,<%=rs.getString(3)%>,<%=pg%>)">&nbsp;change</a></td>
</tr>
<%}
out.println("</table>");
%>





<script>
function myFunction(price,id,pg)
{
var x;

var newprice=prompt("Please enter your value",price);
if(newprice!=null)
window.location.href="change.jsp?price="+newprice+"&id="+id+"&page="+pg;
//window.location.href="Management_menu.jsp?"
}
</script>





<%


try{
    Connection con=db.getConn();
    PreparedStatement ps3=con.prepareStatement("select price from items");
    ResultSet rs3=ps3.executeQuery();
 



        }catch(Exception e){
   e.printStackTrace();
   out.println(e);
}
%>

<%}%>


<%try{
if(totalRows<(iPageNo+showRows)){
endResult=totalRows;
}
else{
endResult=(iPageNo+showRows);
}
startResult=(iPageNo+1);
totalPages=((int)(Math.ceil((double)totalRows/showRows)));
}
catch(Exception e){
e.printStackTrace();
}
%>
<tr><td colspan="3" style="text-align: center">
<div>
<%
int i=0;
int cPage=0;
if(totalRows!=0){
cPage=((int)(Math.ceil((double)endResult/(totalRecords*showRows))));
int prePageNo=(cPage*totalRecords)-((totalRecords-1)+totalRecords);
if((cPage*totalRecords)-(totalRecords)>0){
%>
<a href="Management_menu.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>">Previous</a>
<%
}
for(i=((cPage*totalRecords)-(totalRecords-1));i<=(cPage*totalRecords);i++){
if(i==((iPageNo/showRows)+1)){%>
<a href="Management_menu.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
<%
}
else if(i<=totalPages){
%>
<a href="Management_menu.jsp?iPageNo=<%=i%>"><%=i%></a>
<%
}
}
if(totalPages>totalRecords && i<totalPages){
%>
<a href="Management_menu.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>">Next</a>
<%
}
}
%>

</div></td></tr></table></form></body></html