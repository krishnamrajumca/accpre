<%-- 
    Document   : Accounts
    Created on : Apr 26, 2014, 2:50:15 PM
    Author     : Rao
--%>

<%@page import="com.action.accounts.Accounts"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=getServletContext().getInitParameter("name")%></title>
        <link rel="stylesheet" type="text/css" href="css/notification.css" />
        <link href="css/modal.css" rel="stylesheet" type="text/css" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link href="css/circles.css" rel="stylesheet" type="text/css" />
        <link href="css/radio.css" rel="stylesheet" type="text/css" />
        <link href="css/scroll.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $(".rd").click(function(){
                   var x=$(this).val();
                   sen(x);
                });
            });
            function sen(x){
                window.location.href="taxsettings.jsp?type="+x
                
            }
            function create(){
                document.forms['frm'].submit();
            }
        </script>
        
                                <style> 
@font-face
{
font-family: myFirstFont;
src: url(images/HelveticaRoundedLTStd.otf);
}

@font-face
{
font-family: myFirstFont;
src: url(images/HelveticaRoundedLTStd.otf);
font-weight:lighter;
}

/*div
{
font-family:myFirstFont;
}*/
</style>
              <style> 
@font-face
{
font-family: myFFont;
src: url(images/HelveticaNeue.otf);
}

@font-face
{
font-family: myFFont;
src: url(images/HelveticaNeue.otf);
font-weight:lighter;
}

/*div
{
font-family:myFirstFont;
}*/
</style>
              
 <style> 
@font-face
{
font-family: mySFont;
src: url(images/HelveticaRounded.otf);
}

@font-face
{
font-family: mySFont;
src: url(images/HelveticaRounded.otf);
font-weight:lighter;
}

/*div
{
font-family:myFirstFont;
}*/
</style>
        
    </head>
    <body>
        
       <%
        String type=request.getParameter("type");
        if(type==null)
            type="Dinning";
       %>
<!--        <div style="width: 100%;height: 100px;margin-top: -20px">
            <br>
            <table>
                <tr>
                <td><img src="images/Dg.png"></td>
                </tr>
                <tr>
                    <td style="color: gray">&nbsp; Redefine dinning experience</td>
                </tr>
            </table>
        </div><br>
        <br><br>-->
        
        <!--<div style="margin-left: 550px;margin-top: -130px;font-size: 25px">-->
            <%@include file="Header.jsp" %>
            
            
        <!--</div>-->
        
        
<!--        <div>
            <h1><a href="BillDesk.jsp" style="margin-left: 300px">Home</a>>>Accounts</h1>
        </div>-->
        
        
        
        <fieldset>
        <div>
            <table  border="1" style="border-collapse:collapse;border:1px solid gray;font-size: 30px;color: black;width: 220px ">
                <tr>
                    <td  ><a href="Accounts.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp; Manager Accounts&nbsp;&nbsp;&nbsp;</a></td>
                   
                     
            </tr>
                        <br>
                <tr>
                    <td><a href="waiteraccount.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp; Waiter Accounts&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td><a href="kitchenacc.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Kitchen Accounts&nbsp;&nbsp;&nbsp; </a></td>
                </tr>
                <tr>    
                    <td> <a href="tableacc.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Table Accounts&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td><a href="taxsettings.jsp" style="text-decoration: none;color: black;background-color: green"><font style="color: #ffffff;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Tax Settings&nbsp;&nbsp;&nbsp;</a> </td>
                </tr>
                 <tr>
                    <td><a href="paymenttype.jsp" style="text-decoration: none;color: black;"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Payment Types&nbsp;&nbsp;&nbsp;</a> </td>
                </tr>
            
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;
            
            
        </div><br>
        </fieldset>
        
         
        <div style="margin-top: -240px;margin-left: 310px;font-size: 30px;font-family: myFirstFont">
            Tax settings&nbsp;|&nbsp;Payment Type
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            
          
            <b style="border-radius:10px; height:30px;background: #d0d0d0">&nbsp;&nbsp;&nbsp;<a href="createtax.jsp">+ Create New</a>&nbsp;&nbsp;&nbsp;</b>
         </div>
        <br>
        
        <div style="margin-left: 310px;font-family: myFFont">
            <table  border="1" style="border-collapse:collapse;border:1px solid #d0d0d0;font-size: 20px;width: 640px;background-color: gray;color: white;height: 40px">
                <tr>
                    <td style="width: 235px">Tax Setting Name</td>
                    <td> Comments</td>
                    
                </tr>
                
                 </table>
            
        </div>
        
        
        <div style="margin-left: 310px;font-family: myFFont">
          <table  border="1" style="border-collapse:collapse;border:1px solid #d0d0d0;font-size: 16px;width: 640px;height: 43px">
              <%
                  PreparedStatement ps=DBConnection.getPrepare("select id,name,comment from tax group by name");
                  ResultSet rs=ps.executeQuery();
                  while(rs.next()){
                      String id=rs.getString(1);
                      String name=rs.getString(2);
                      String com=rs.getString(3);
                  
              %>
                <tr>
                    <td style="width: 275px"><a href="viewtax.jsp?id=<%=name%>&comment=<%=com%>"><%=name%></a></td>
                    <td style="width:470px"><%=com%></td>
                </tr>
              <%}%>
                
            </table>
            
            
            
        </div>
              <br>
         <div style="margin-top: 10px;margin-left: 310px;font-size: 30px;font-family: myFirstFont">
        Apply Tax Settings
         </div>
              <br>
              <form name="frm" action="ApplayTax" method="post">
        <div style="margin-left: 310px">
            <table  border="0" style="border-collapse:collapse;border:1px solid blue;font-size: 20px;width: 840px;background-color: gray;color: white;height: 40px;font-family: myFFont">
                <tr>
                    <td>
                        <%if(type.equalsIgnoreCase("Dinning")){%>
                        <input type="radio" name="ch" group="type" value="Dinning" id="1" checked class="rd">
                        <%}else{ %>
                        <input type="radio" name="ch" group="type" value="Dinning" id="1" class="rd">
                        <%}%>
                          <label for="1"><span></span>Dining</label></td>
                    <td>
                                            <% if(type.equalsIgnoreCase("TakeAway")){%>

                                            <input type="radio" name="ch" group="type" value="TakeAway"  checked id="2" class="rd">
                        <%}else{%>
                        <input type="radio" name="ch" group="type" value="TakeAway" id="2" class="rd">
                        <%}%>
                          <label for="2"><span></span>Take Away</label></td>
                    <td>
                        <% if(type.equalsIgnoreCase("parcel")){%>
                        <input type="radio" name="ch" group="type" value="Parcel" checked id="3" class="rd">
                        <%}else{%>
                        <input type="radio" name="ch" group="type" value="Parcel" id="3" class="rd">
                        <%}%>
                          <label for="3"><span></span>Parcel</label></td>
                    
                </tr>
            </table>
        </div><br>
        
                

                
        <div style="margin-top: 5px;margin-left: 880px;font-family: myFirstFont">
        
            <b style="border-radius:5px; font-size: 25px;background: #d0d0d0">&nbsp;&nbsp;&nbsp;
            <a href="javascript:create()">Apply</a>&nbsp;&nbsp;&nbsp;</b>
            <b style="border-radius:5px; font-size: 25px;background: #d0d0d0    ">&nbsp;&nbsp;&nbsp;
            <a href="#" > Cancel</a>&nbsp;&nbsp;&nbsp;</b>
        
        
            </div>
                <br>
                
                  <div style="margin-left: 310px;font-family: myFFont">
            <table  border="1" style="border-collapse:collapse;border:1px solid #d0d0d0;font-size: 17px;width: 840px;height: 200px;overflow: auto">
                <%ps=DBConnection.getPrepare("select mid,name from menus");
                PreparedStatement ps1=DBConnection.getPrepare("select id,name from items where parent=?");
                ResultSet r=null;
                PreparedStatement p=DBConnection.getPrepare("select distinct(name) from tax");
                ResultSet rr=p.executeQuery();
                ArrayList list=new ArrayList();
                while(rr.next()){
                  list.add(rr.getString(1));  
                }
                    rs=ps.executeQuery();
                    while(rs.next()){
                        String id=rs.getString(1);
                        String menu=rs.getString(2);
                
                %>
                <tr style="background-color: black;color: white">
                    <td colspan="2"><%=menu%></td> 
                </tr>
                <%
                    ps1.setString(1, id);
                    r=ps1.executeQuery();
                    while(r.next()){
                    String iid=r.getString(1);    
                    String item=r.getString(2);
                %>
                <tr>
                    <td><%=item%>
                        <input type="hidden" name="items" value="<%=iid%>"/>
                    </td><td>
                        <select name="<%=iid%>">
                       <%
                        Iterator itr=list.iterator();
                        String n=Accounts.getTaxName(type,iid);
                        if(n!=null || n!="")
                        %>
                        <option value="<%=n%>"><%=n%></option>
                            <%
                        while(itr.hasNext()){
                        String t=(String)itr.next();    
                        
                        %>
                        <option value="<%=t%>"><%=t%></option>
                            <%   
                        }
                       %>
                    </td>
                </tr>
                <%}}%>
            </table>
            
            
            
        </div>
             
              </form>     
                
         </fieldset>       
       
    </body>
</html>
