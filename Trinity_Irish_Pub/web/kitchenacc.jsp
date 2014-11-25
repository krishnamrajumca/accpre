<%-- 
    Document   : Accounts
    Created on : Apr 26, 2014, 2:50:15 PM
    Author     : Rao
--%>

<%@page import="java.util.Iterator"%>
<%@page import="com.action.accounts.forms.kichenForm"%>
<%@page import="com.action.accounts.Accounts"%>
<%@page import="java.util.ArrayList"%>
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
        <script src="js/jquery.js"></script>
        <script src="js/jquery.js"></script>
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
                    <td  ><a href="Accounts.jsp" style="text-decoration: none;color: black;"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp; Manager Accounts&nbsp;&nbsp;&nbsp;</font></a></td>
                   
                     
            </tr>
                        <br>
                <tr>
                     <td  ><a href="waiteraccount.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp; Waiter Accounts&nbsp;&nbsp;&nbsp;</font></a></td>
                </tr>
                <tr>
                    <td><a href="kitchenacc.jsp" style="text-decoration: none;color: black;background-color: green"><font style="color: #ffffff;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Kitchen Accounts&nbsp;&nbsp;&nbsp; </font></a></td>
                </tr>
                <tr>
                    <td> <a href="tableacc.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Table Accounts&nbsp;&nbsp;&nbsp;</font></a></td>
                </tr>
                <tr>
                    <td><a href="taxsettings.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Tax Settings&nbsp;&nbsp;&nbsp;</font></a> </td>
                </tr>
                 <tr>
                    <td><a href="paymenttype.jsp" style="text-decoration: none;color: black;"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Payment Types&nbsp;&nbsp;&nbsp;</font></a> </td>
                </tr>
            
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;
            
            
        </div><br>
        </fieldset>
        
        
        <div style="margin-top: -240px;margin-left: 310px;font-size: 26px;font-family: myFirstFont">
            Kichen Accounts&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <b style="border-radius:10px; height:30px;background: #d0d0d0">&nbsp;&nbsp;&nbsp;<a href="newkichenacc.jsp">+ Create New</a>&nbsp;&nbsp;&nbsp;</b>
         </div>
        <br>
        
        <div style="margin-left: 310px;font-family: myFFont">
            <table  border="1" style="border-collapse:collapse;border:1px solid #d0d0d0;font-size: 20px;width: 1112px;background-color: gray;color: white;height: 40px">
                <tr>
                    <td style="width: 329px">Account Name</td>
                    <td style="width: 329px"> User Name</td>
                    <td> No.of tables assighned</td>
                </tr>
                
                 </table>
            
        </div>
        
        
        <div style="margin-left: 310px;font-family: myFFont">
          <table  border="1" style="border-collapse:collapse;border:1px solid #d0d0d0;font-size: 20px;width: 1005px">
              <%
                  ArrayList<kichenForm> list=Accounts.getkichens();
                  Iterator itr=list.iterator();
                  while(itr.hasNext()){
                  kichenForm k=(kichenForm)itr.next();
                  
              %>
                <tr>
                    <td><a href="viewkichenacc.jsp?id=<%=k.getId()%>"><%=k.getUser()%></a></td>
                    <td ><%=k.getName()%></td>
                    <td style="width: 337px"> <%=k.getNum()%></td>
                </tr>
                <%}%>
            </table>
            
            
            
        </div>
        
        
        
        
        </fieldset>
        
       
    </body>
</html>
