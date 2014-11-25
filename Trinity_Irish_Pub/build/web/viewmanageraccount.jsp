<%-- 
    Document   : Accounts
    Created on : Apr 26, 2014, 2:50:15 PM
    Author     : Rao
--%>

<%@page import="com.manager.Orders"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.action.accounts.forms.Managers"%>
<%@page import="com.action.accounts.Accounts"%>
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
        <script type="text/javascript">
            function delet(uid){
                var c=confirm("Do You Want to Delete");
                if(c)
                window.location.href="delmanager.jsp?id="+uid;
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
            <table  border="1" style="border-collapse:collapse;border:1px solid gray;font-size: 30px;color: black;width: 220px">
                <tr>
                    <td  ><a href="Accounts.jsp" style="text-decoration: none;color: black;background-color: green"><font style="color: #ffffff;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp; Manager Accounts&nbsp;&nbsp;&nbsp;</font></a></td>
                   
                     
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
                     <td><a href="paymenttype.jsp" style="text-decoration: none;color: black;"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Payment Types&nbsp;&nbsp;&nbsp;</font></a> </td>
                </tr>
            
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;
            
            
        </div><br>
        
        <%
            String uid=request.getParameter("id");
            Managers m=Accounts.getManager(uid);
        %>
        
        <div style="margin-top: -260px;margin-left: 310px;font-size: 26px;font-family: myFirstFont">
           Create Manager Account
           &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
           &nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
           <b style="border-radius:10px; height:30px;background:#D0D0D0;font-size: 30px;text-decoration: none;color:black">&nbsp;&nbsp;&nbsp;<a href="Accounts.jsp"style="text-decoration: none"> < Back </a>&nbsp;&nbsp;&nbsp;</b>
            <b style="border-radius:10px; height:30px;background:#D0D0D0;font-size: 30px;text-decoration: none;color: black">&nbsp;&nbsp;&nbsp;
                <a href="javascript:delet('<%=uid%>')"style="text-decoration: none"> Delete</a>&nbsp;&nbsp;&nbsp;</b>
             <b style="border-radius:10px; height:30px;background:#D0D0D0;font-size: 30px;text-decoration: none;color: black">&nbsp;&nbsp;&nbsp;<a href="edit.jsp?id=<%=uid%>"style="text-decoration: none"> Edit</a>&nbsp;&nbsp;&nbsp;</b>
           
        </div>
        <br>
        <div style="margin-left: 280px">
            <fieldset>
     
        <div  style="margin-left: -10px;background-color: gray;font-size: 22px;color:white;font-family: myFirstFont">
            <b>&nbsp;Account Information</b>
        </div><br>
        
         <div  style="margin-left: -10px;font-family: myFFont">
             <table>
                 <tr>
                     <td><b style="font-size: 20px">User name &nbsp;&nbsp;<b></td>
                                 <td><b>:&nbsp;&nbsp;</b><%=m.getUname()%></td>
                      
                 </tr>
                 
                 <tr>
                     <td><b style="font-size: 20px">Password&nbsp;&nbsp;<b></td>
                     <td><b>:&nbsp;&nbsp;</b><%=m.getPassword()%></td>
                      
                 </tr>
                 <tr>
                     <td><b style="font-size: 20px">Retype password &nbsp;&nbsp;<b></td>
                                 <td><b>:&nbsp;&nbsp;</b><%=m.getPassword()%></td>
                      
                 </tr>
                  
             </table>
           </div><br>
        
        
         <div  style="margin-left: -10px;background-color: gray;font-size: 23px;color:white;font-family: myFirstFont">
            <b>&nbsp;Personal Information</b>
        </div><br>
        
         <div  style="margin-left: -10px;font-family: myFFont">
             <table>
                 <tr>
                     <td><b style="font-size: 20px;width: 20px"> Name &nbsp;&nbsp;<b></td>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>:&nbsp;&nbsp;</b><%=m.getName()%>
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <b style="font-size: 20px"> Designation</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>:&nbsp;&nbsp;</b><%=m.getDesg()%>
                                     
                                 </td>
                      
                 </tr>
                 
                 <tr>
                     <td><b style="font-size: 20px">Email Id &nbsp;&nbsp;<b></td>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <b>:&nbsp;&nbsp;</b><%=m.getEmail()%>                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <b style="font-size: 20px"> Phone Number&nbsp;&nbsp;</b>&nbsp;&nbsp;<b>:&nbsp;&nbsp;</b><%=m.getPhone()%>
                                     </td> </tr>
      <div>
                     
                 </div>
                  
             </table>
           </div>
        <br>
        
         <div  style="margin-left: -10px;background-color: gray;font-size: 23px;color:white;font-family: myFirstFont">
            <b>&nbsp;Access permissions</b>
        </div><br>
        
         <div  style="margin-left: -10px;font-family: myFFont">
             <table>
                 <tr>
                     <%
                        ArrayList l=m.getRoles();
                        Iterator i=l.iterator();
                        while(i.hasNext()){
                     %>
                     <td style="widht:30px">
                         
                         
                         <b style="font-size: 20px"><%=i.next()%> <b>&nbsp;&nbsp;&nbsp;&nbsp;
                      </td>
                                
                
                                                <%}%>
                                                </tr>
                 
                 
             </table>
           </div>
        
        
        
    </fieldset>  
        </fieldset> 
</div>
        <br>
        <div style="margin-left: 900px;font-family: myFirstFont">
            <b style="border-radius:10px; height:30px;background:#D0D0D0;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="Accounts.jsp"style="text-decoration: none"> < Back </a>&nbsp;&nbsp;&nbsp;</b>
            <b style="border-radius:10px; height:30px;background:#D0D0D0;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="delet('<%=uid%>')" style="text-decoration: none"> Delete</a>&nbsp;&nbsp;&nbsp;</b>
             <b style="border-radius:10px; height:30px;background:#D0D0D0;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="edit.jsp?id=<%=uid%>"style="text-decoration: none"> Edit</a>&nbsp;&nbsp;&nbsp;</b>
        </div>
        
        </body>
</html>
