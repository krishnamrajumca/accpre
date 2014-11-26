    <%-- 
    Document   : Accounts
    Created on : Apr 26, 2014, 2:50:15 PM
    Author     : Rao
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConnection"%>
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
        <script type='text/javascript'>
            function create(){
                var x=prompt("Enter payment Name","");
                
                if(x==null || x=="")
                    alter("Please enter payment type");
                
                else 
                    window.location.href="createPayment.jsp?name="+x+"&type=radio";
            }
            function edit(id,n){
                
                var x=prompt("Enter payment type",id);
                if(x==null || x=="")
                    alter("Please enter payment type");
                else if(x==id)
                {}
                else 
                    window.location.href="editPayment.jsp?name="+x+"&id="+n;
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
        
        <%@include file="Header.jsp" %>
       
        
        
        <fieldset >
        <div>
            <table  border="1" style="border-collapse:collapse;border:1px solid gray;font-size: 30px;color: black;width: 220px ">
                <tr>
                    <td  ><a href="Accounts.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp; Manager Accounts&nbsp;&nbsp;&nbsp;</font></a></td>
                   
                     
            </tr>
                        <br>
                <tr>
                    <td><a href="waiteraccount.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp; Waiter Accounts&nbsp;&nbsp;&nbsp;</font></a></td>
                </tr>
                <tr>
                    <td><a href="kitchenacc.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Kitchen Accounts&nbsp;&nbsp;&nbsp; </font></a></td>
                </tr>
                <tr>
                    <td> <a href="tableacc.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Table Accounts&nbsp;&nbsp;&nbsp;</font></a></td>
                </tr>
                <tr>
                    <td><a href="taxsettings.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Tax Settings&nbsp;&nbsp;&nbsp;</font></a> </td>
                </tr>
                 <tr>
                     <td><a href="paymenttype.jsp" style="text-decoration: none;color: black;background-color: green"><font style="color: #ffffff;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Payment Types&nbsp;&nbsp;&nbsp;</font></a> </td>
                </tr>
            
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;
            
            
        </div><br>
        </fieldset>
        
         
        <div style="margin-top: -240px;margin-left: 310px;font-size: 30px">
           
            
            
            
            <b style="border-radius:10px; height:30px;background: #d0d0d0;font-family: myFirstFont">&nbsp;&nbsp;&nbsp;<a href="javascript:create()">+ Create New</a>&nbsp;&nbsp;&nbsp;</b>
         </div>
        <br>
        
        <div style="margin-left: 310px">
            <table  border="1" style="border-collapse:collapse;border:1px solid blue;font-size: 20px;width: 840px;background-color: gray;color: white;height: 40px;font-family: myFFont">
                <tr>
                    <td>Payment types</td>
                 
                    
                </tr>
                
                 </table>
            
        </div>
        
        
        <div style="margin-left: 310px">
          <table  border="1" style="border-collapse:collapse;border:1px solid blue;font-size: 20px;width: 840px;font-family: myFFont">
           <%
               PreparedStatement ps=DBConnection.getPrepare("select *from payment");
               ResultSet rs=ps.executeQuery();
               while(rs.next()){
                   
               String name=rs.getString(2);
               String id=rs.getString(1);
           %>
              <tr>
                    <td><a href="javascript:edit('<%=name%>','<%=id%>')"><%=name%></a></td>
                    <td><a href="deletepay.jsp?id=<%=id%>">Delete</a></td>
                </tr>
           <%}%>
                
            </table>
            
            
            
        </div>
        
                
       
    </body>
</html>
