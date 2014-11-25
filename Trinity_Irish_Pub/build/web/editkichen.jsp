<%-- 
    Document   : Accounts
    Created on : Apr 26, 2014, 2:50:15 PM
    Author     : Rao
--%>

<%@page import="com.action.accounts.Accounts"%>
<%@page import="com.action.accounts.forms.kichenForm"%>
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
        
        
        
        
        <fieldset >
        <div>
            <table  border="1" style="border-collapse:collapse;border:1px solid gray;font-size: 30px;color: black;width: 220px">
                <tr>
                    <td  ><a href="Accounts.jsp" style="text-decoration: none;color: black"><font style="color:#000000 ;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp; Manager Accounts&nbsp;&nbsp;&nbsp;</font></a></td>
                   
                     
            </tr>
                        <br>
                <tr>
                    <td><a href="waiteraccount.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp; Waiter Accounts&nbsp;&nbsp;&nbsp;</font></a></td>
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
        
        <form action="EditKichen" name="frm" method="post">
        
        <div style="margin-top: -240px;margin-left: 310px;font-size: 30px">
            Edit  Kichen Account&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <%
               String id=request.getParameter("id");
               kichenForm k=Accounts.getKichen(id);
               
           %>
            <b style="border-radius:10px; height:30px;background: gray;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="javascript:create()"style="text-decoration: none"> Save </a>&nbsp;&nbsp;&nbsp;</b>
            <b style="border-radius:10px; height:30px;background: gray;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="kichenacc.jsp"style="text-decoration: none"> Cancel</a>&nbsp;&nbsp;&nbsp;</b>
    
        </div>
        <br>
        <div style="margin-left: 280px">
            <fieldset>
     
        <div  style="margin-left: -10px;background-color: gray;font-size: 25px;color:white">
            <b>&nbsp;Account Information</b>
        </div><br>
        
         <div  style="margin-left: -10px;">
             <table>
                 <tr>
                     <td><b style="font-size: 20px">User name :<b></td>
                                 <input type="hidden"name="id"size="30px"value="<%=id%>">
                                 <td><input type="text"name="username"size="30px"value="<%=k.getUser()%>"> </td>
                      
                 </tr>
                 
                 <tr>
                     <td><b style="font-size: 20px">Password :<b></td>
                     <td><input type="text"name="pw"size="30px"size="30px"value="<%=k.getPassword()%>"> </td>
                      
                 </tr>
                 <tr>
                     <td><b style="font-size: 20px">Retype password :<b></td>
                                 <td><input type="text"name="rpw"size="30px"value="<%=k.getPassword()%>"> </td>
                      
                 </tr>
                  
             </table>
           </div><br>
        
        
         <div  style="margin-left: -10px;background-color: gray;font-size: 25px;color:white">
            <b>&nbsp;Personal Information</b>
        </div><br>
        
         <div  style="margin-left: -10px;">
             <table>
                 <tr>
                     <td><b style="font-size: 20px;width: 20px"> Name :<b></td>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"name="name"size="30px"value="<%=k.getName()%>">
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     
                                    
                                     
                                 </td>
                      
                 </tr>
                 
                 <tr>
                     <td><b style="font-size: 20px">Email Id :<b></td>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <input type="text"name="email"size="30px"size="30px"value="<%=k.getEmail()%>"> 
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <b style="font-size: 20px"> Phone Number:</b>&nbsp;&nbsp;<input type="text"name="pno"size="30px"value="<%=k.getPhone()%>"> 
                                     </td> </tr>
      <div>
                     
                 </div>
                  
             </table>
           </div>
        <br>
        
         <div  style="margin-left: -10px;background-color: gray;font-size: 25px;color:white">
            <b>&nbsp;Assighn Items</b>
        </div><br>
        
         <div  style="margin-left: -10px;">
             <%@include  file="mtreeu.jsp" %>
           </div>
        
        
        
    </fieldset>  
        </div>
        </form>
        </fieldset> 
</div>
        <br>
        <div style="margin-left: 1000px">
            <b style="border-radius:10px; height:30px;background: gray;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="javascript:create()"style="text-decoration: none"> Save </a>&nbsp;&nbsp;&nbsp;</b>
            <b style="border-radius:10px; height:30px;background: gray;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="kichenacc.jsp"style="text-decoration: none"> Cancel</a>&nbsp;&nbsp;&nbsp;</b>
    
        </div>
        
        </body>
</html>
