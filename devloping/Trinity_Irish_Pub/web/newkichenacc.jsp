<%-- 
    Document   : Accounts
    Created on : Apr 26, 2014, 2:50:15 PM
    Author     : Rao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.action.accounts.Accounts"%>
<%@page import="com.action.accounts.forms.kichenForm"%>
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
        <script type="text/javascript">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
        <script type="text/javascript">
            function create(){
                var pw=document.forms['frm']['pw'].value;
                var cp=document.forms['frm']['rpw'].value;
                var un=document.forms['frm']['username'].value;
                var name=document.forms['frm']['name'].value;
                if(un==="")
                    alert("Username is required");
                else if(name==="")
                    alert("name is required");
                else if(pw.length<8)
                    alert("password must be grater than or equal 8 characters");
                else if(cp!==pw)
                    alert("password and re password not matched");
                else
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
        
        
<!--    <div style="font-family: myFirstFont">
            <h1 style="font-family: myFirstFont"><a href="BillDesk.jsp" style="margin-left: 300px;font-family: myFirstFont">Home</a>>>Accounts</h1>
        </div>-->
        
        
        
<fieldset  >
        <div style="font-family: myFirstFont">
            <table  border="1" style="border-collapse:collapse;border:1px solid gray;font-size: 30px;color: black;width: 220px">
                <tr>
                    <td  ><a href="Accounts.jsp" style="text-decoration: none;color: black;background-color: green"><font style="color: #ffffff;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp; Manager Accounts&nbsp;&nbsp;&nbsp;</font></a></td>
                   
                     
            </tr>
                        <br>
                <tr>
                    <td><a href="waiteraccount.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp; Waiter Accounts&nbsp;&nbsp;&nbsp;</font></a></td>
                </tr>
                <tr>
                    <td><a href="kichenacc.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Kichen Accounts&nbsp;&nbsp;&nbsp; </font></a></td>
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
        
        
        <form  action="CreateKitchen" name="frm">
        <div style="margin-top: -320px;margin-left: 310px;font-size: 30px;font-family: myFirstFont">
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Create Kitchen Account&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <b style="border-radius:10px; height:30px;background: #d0d0d0;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="javascript:create()"style="text-decoration: none"> Create </a>&nbsp;&nbsp;&nbsp;</b>
            <b style="border-radius:10px; height:30px;background: #d0d0d0;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="#"style="text-decoration: none"> Cancel</a>&nbsp;&nbsp;&nbsp;</b>
    
            
        </div>
        <br>
        <div style="margin-left: 280px;font-family: myFFont">
            <fieldset>
     
        <div  style="margin-left: -10px;background-color: gray;font-size: 25px;color:white">
            <b>&nbsp;Account Information</b>
        </div><br>
        
         <div  style="margin-left: -10px;">
             <table>
                 <tr>
                     <td><b style="font-size: 20px">User name  <b></td>
                                 <td><b>:&nbsp;&nbsp;</b><input type="text"name="username"size="30px"> </td>
                      
                 </tr>
                 
                 <tr>
                     <td><b style="font-size: 20px">Password  <b></td>
                     <td><b>:&nbsp;&nbsp;</b><input type="text"name="pw"size="30px"size="30px"> </td>
                      
                 </tr>
                 <tr>
                     <td><b style="font-size: 20px">Retype password  <b></td>
                                 <td><b>:&nbsp;&nbsp;</b><input type="text"name="rpw"size="30px"> </td>
                      
                 </tr>
                  
             </table>
           </div><br>
        
        
         <div  style="margin-left: -10px;background-color: gray;font-size: 25px;color:white">
            <b>&nbsp;Personal Information</b>
        </div><br>
        
         <div  style="margin-left: -10px;font-family: myFFont">
             <table>
                 <tr>
                     <td><b style="font-size: 20px;width: 20px"> Name <b></td>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>&nbsp;&nbsp;:&nbsp;&nbsp;</b><input type="text"name="name"size="30px">
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     
                                    
                                     
                                 </td>
                      
                 </tr>
                 
                 <tr>
                     <td><b style="font-size: 20px">Email Id <b></td>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <b>&nbsp;&nbsp;:&nbsp;</b> <input type="text"name="email"size="30px"size="30px"> 
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <b style="font-size: 20px"> Phone Number</b><b>&nbsp;&nbsp;:</b>&nbsp;&nbsp;<input type="text"name="ph"size="30px"> 
                                     </td> </tr>
      <div>
                     
                 </div>
                  
             </table>
           </div>
        <br>
        
         <div  style="margin-left: -10px;background-color: gray;font-size: 25px;color:white">
            <b>&nbsp;Assighn items</b>
        </div><br>
        
         <div  style="margin-left: -10px;">
             <%@include file="mtree.jsp" %>   
           </div>
            
        
        
    </fieldset>  
        </div>
           </form>
        </fieldset> 
</div>
        <br>
        <div style="margin-left: 1000px;font-family: myFirstFont">
            <b style="border-radius:10px; height:30px;background: #d0d0d0;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="createnewkichen.jsp"style="text-decoration: none"> Create </a>&nbsp;&nbsp;&nbsp;</b>
            <b style="border-radius:10px; height:30px;background: #d0d0d0;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="#"style="text-decoration: none"> Cancel</a>&nbsp;&nbsp;&nbsp;</b>
    
        </div>
        
        </body>
</html>
9999