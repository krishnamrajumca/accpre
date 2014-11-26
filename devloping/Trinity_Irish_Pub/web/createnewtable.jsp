<%-- 
    Document   : Accounts
    Created on : Apr 26, 2014, 2:50:15 PM
    Author     : Rao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.action.accounts.Accounts"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.action.accounts.forms.TablesForm"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=getServletContext().getInitParameter("name")%></title>
        <link rel="stylesheet" type="text/css" href="css/notification.css" />
        <link href="css/modal.css" rel="stylesheet" type="text/css" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link href="css/circles.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery.js"></script>
        <script type="text/javascript">
            function validate(){
                
                var pw=document.forms["tableform"]["pw"].value;
                var rpw=document.forms["tableform"]["rpw"].value;
                if(pw!=rpw){
                    alert("password and re password not match");
                    return false;
                }
                
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
        
        
           <%
                Orders o=new Orders();
                int c1=o.getNotification();
                %>
        <%@include file="Header.jsp" %>
            
        
        
        
        <fieldset >
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
                    <td> <a href="tableacc.jsp" style="text-decoration: none;color: black;background-color: green"><font style="color: #ffffff;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Table Accounts&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td><a href="taxsettings.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Tax Settings&nbsp;&nbsp;&nbsp;</a> </td>
                </tr>
                 <tr>
                    <td><a href="paymenttype.jsp" style="text-decoration: none;color: black;"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Payment Types&nbsp;&nbsp;&nbsp;</a> </td>
                </tr>
            
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;
            
            
        </div><br>
        
        <form action="CreateTable" method="post" name="tableform" id="tableform" onsubmit="return validate()">
        
        <div style="margin-top: -260px;margin-left: 310px;font-size: 30px;font-family: myFirstFont">
            Create Table Account&nbsp;&nbsp;&nbsp;
            <b><input type="submit" value="Create" style="border-radius:10px; height:38px;width: 180px;background: #d0d0d0;font-size: 20px;text-decoration: none"/> &nbsp;&nbsp;&nbsp;</b>
            <!--<b style="border-radius:10px; height:30px;background: #d0d0d0;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="javascript:create()"style="text-decoration: none"> Create </a>&nbsp;&nbsp;&nbsp;</b>-->
            <b style="border-radius:10px; height:30px;background: #d0d0d0;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="tableacc.jsp"style="text-decoration: none"> Cancel</a>&nbsp;&nbsp;&nbsp;</b>
    
            
        </div>
        <br>
        <div style="margin-left: 280px">
            <fieldset>
     
        <div  style="margin-left: -10px;background-color: gray;font-size: 23px;color:white;font-family: myFirstFont">
            <b>&nbsp;Account Information</b>
        </div><br>
        
         <div  style="margin-left: -10px;font-family: myFFont">
             <table>
                 <tr>
                     <td><b style="font-size: 20px">User name <b></td>
                                 <td><b>:&nbsp;&nbsp;</b><input type="text" name="username" size="30px"> </td>
                      
                 </tr>
                 
                 <tr>
                     <td><b style="font-size: 20px">Password <b></td>
                     <td><b>:&nbsp;&nbsp;</b><input type="text" name="pw" size="30px"size="30px"> </td>
                      
                 </tr>
                 <tr>
                     <td><b style="font-size: 20px">Retype password <b></td>
                                 <td><b>:&nbsp;&nbsp;</b><input type="text" name="rpw" size="30px"> </td>
                      
                 </tr>
                 <tr>
                     <td><b style="font-size: 20px">Assign To <b></td>
                                 <td><b>:&nbsp;&nbsp;</b><select name="assign">
                                         <option value="Dinning">Dinning</option>
                                         <option value="Take Away">Take Away</option>
                                         <option value="Parcel">Parcel</option>
                                     </select> </td>
                      
                 </tr>
             </table>
           </div><br>
            </fieldset>
           </form>
       
        </body>
</html>
