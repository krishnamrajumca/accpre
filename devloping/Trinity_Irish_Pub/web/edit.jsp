<%-- 
    Document   : Accounts
    Created on : Apr 26, 2014, 2:50:15 PM
    Author     : Rao
--%>

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
       function create(){
                
                var un=document.forms['frm']['username'].value;
                var pw=document.forms['frm']['pw'].value;
                var cp=document.forms['frm']['rpw'].value;
                var nm=document.forms['frm']['name'].value;
                var de=document.forms['frm']['des'].value;
                if(un==="")
                    alert("Username is Not empty");
                else if(nm==="")
                    alert("Name is Not empty");
                else if(pw.length<8)
                    alert("password must be grater than or equal 8 characters");                  
                else if(cp!==pw)
                    alert("password and re password not matched");
                else if(de==="")
                    alert("Designation is required");
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
        
<!--       <br>
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
        </div>
        <br>
        <div style="margin-left: 280px">
            <fieldset>
     
        <div  style="margin-left: -10px;background-color: gray;font-size: 23px;color:white;font-family: myFirstFont">
            <b>&nbsp;Account Information</b>
        </div><br>
        <form action="EditManager" method="get" name="frm">
         <div  style="margin-left: -10px;font-family: myFFont">
             <table>
                 <tr>
                     <td><b style="font-size: 20px">User name &nbsp;&nbsp;<b></td>
                                 <input type="hidden"name="id" size="30px"value="<%=uid%>"> 
                                 <td><b>:&nbsp;&nbsp;</b><input type="text"name="username"size="30px"value="<%=m.getUname()%>"> </td>
                      
                 </tr>
                 
                 <tr>
                     <td><b style="font-size: 20px">Password &nbsp;&nbsp;<b></td>
                     <td><b>:&nbsp;&nbsp;</b><input type="text"name="pw"size="30px"size="30px"value="<%=m.getPassword()%>"> </td>
                      
                 </tr>
                 <tr>
                     <td><b style="font-size: 20px">Retype password &nbsp;&nbsp;<b></td>
                                 <td><b>:&nbsp;&nbsp;</b><input type="text"name="rpw"size="30px"value="<%=m.getPassword()%>"> </td>
                      
                 </tr>
                  
             </table>
           </div><br>
        
        
         <div  style="margin-left: -10px;background-color: gray;font-size: 23px;color:white;font-family: myFirstFont">
            <b>&nbsp;Personal Information</b>
        </div><br>
        
         <div  style="margin-left: -10px;font-family: myFFont">
             <table>
                 <tr>
                     <td><b style="font-size: 20px;width: 20px"> Name <b></td>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>:&nbsp;&nbsp;</b><input type="text"name="name"size="30px"value="<%=m.getName()%>">
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     
                                     <b style="font-size: 20px"> Designation</b>&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>:&nbsp;&nbsp;</b>
                                     <input type="text"name="des"size="30px"value="<%=m.getDesg()%>"> 
                                     
                                 </td>
                      
                 </tr>
                 
                 <tr>
                     <td><b style="font-size: 20px">Email Id <b></td>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <b>:&nbsp;&nbsp;</b><input type="text"name="email"size="30px"size="30px"value="<%=m.getEmail()%>"> 
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     <b style="font-size: 20px"> Phone Number</b>&nbsp;&nbsp;
                                    <b>:&nbsp;&nbsp;</b> <input type="text"name="pno"size="30px"value="<%=m.getPhone()%>"> 
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
                     <td style="widht:30px">
                         <%
                         ArrayList l=m.getRoles();
                         Iterator itr=l.iterator();
                         String s="";
                         while(itr.hasNext()){
                             s+=itr.next()+";";
                             
                         }
                         
                         boolean b=false;
                        %>
                        <%
                        if(s.contains("BillDesk")){
                        
                        %>
                        <input type="checkbox" name="ch" value="BillDesk" checked="true">
                        <%}
                        else{
                        
                        %>
                        <input type="checkbox" name="ch" value="BillDesk" >
                        <%
                        }
                        %>
                         &nbsp;&nbsp;&nbsp;&nbsp;
                         <b style="font-size: 20px">BillDesk <b></td>
                                 
                       <td>
                           <%if(s.contains("Order Management")){
                            %>
                           <input type="checkbox" name="ch" value="Order Management" checked>
                           <%}
                               else{
                           %>
                           <input type="checkbox" name="ch"  value="Order Management">
                           <%}%>
                           &nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size: 20px">Order Management <b></td>
                        <td>
                             <%
                        if(s.contains("Restaurant Moniter")){
                        
                        %>
                        <input type="checkbox" name="ch" value="Restaurant Moniter" checked>
                            <%
                        }else{
                            %>
                            <input type="checkbox" name="ch" value="Restaurant Moniter">
                            <%}%>
                            &nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size: 20px">Restaurant Monitaring <b></td>
                                    <td>
                                        <%
                        if(s.contains("Transactions")){
                        
                        %>
                        <input type="checkbox" name="ch" value="Transactions" checked>
                        <%}
                        else{
                        %>
                        <input type="checkbox" name="ch" value="Transactions">
                         <%}%>               
                                        &nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size: 20px">Transactions<b><br></td>
                 </tr>
                 
                 
                   <tr>
                     <td>
                         <%
                            if(s.contains("Inventary Management")){
                         %>
                         <input type="checkbox" name="ch" value="Inventary Management" checked>
                         <%
                            }else{%>
                                <input type="checkbox" name="ch" value="Inventary Management" >
                                <%}%>
                         &nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size: 20px">Inventory Management <b></td>
                                 
                       <td>
                           <%
                            if(s.contains("Reports")){
                         %>
                           <input type="checkbox" name="ch"  value="Reports" checked>
                           <%
                            }else{
                           %>
                           <input type="checkbox" name="ch" value="Reports">
                           <%}%>
                           &nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size: 20px">Reports <b></td>
                        <td>
                            <%
                            if(s.contains("Menu Management")){
                         %>
                            <input type="checkbox" name="ch" value="Menu Management" checked>
                            <%}else{%>
                            <input type="checkbox" name="ch" value="Menu Management">
                            <%}%>
                            &nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size: 20px">Menu Management <b></td>
                      <td>
                          <%
                            if(s.contains("Accounts")){
                         %>
                         <input type="checkbox" name="ch" value="Accounts" checked>
                         <%}else{%>
                         <input type="checkbox" name="ch" value="Accounts">
                         <%}%>
                          &nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size: 20px">Accounts<b></td>
                 </tr>
                 
             </table>
           </div>
        </form>
        
        
    </fieldset>  
        </fieldset> 
</div>
        <br>
        <div style="margin-left: 1000px;font-family: myFirstFont">
            <b style="border-radius:10px; height:30px;background:#D0D0D0;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="javascript:create()"style="text-decoration: none"> Create </a>&nbsp;&nbsp;&nbsp;</b>
            <b style="border-radius:10px; height:30px;background: #D0D0D0;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;<a href="Accounts.jsp"style="text-decoration: none"> Cancel</a>&nbsp;&nbsp;&nbsp;</b>
    
        </div>
        
        </body>
</html>
