<%-- 
    Document   : Accounts
    Created on : Apr 26, 2014, 2:50:15 PM
    Author     : Rao
--%>

<%@page import="com.action.accounts.forms.TaxForm"%>
<%@page import="java.util.Iterator"%>
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
        <link href="css/radio.css" rel="stylesheet" type="text/css" />
        <link href="css/scroll.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery.js"></script>
        <script type="text/javascript">
            function delet(name){
                var c=confirm("Do You Want Delete:"+name);
                if(c)
                    window.location.href="deletetax.jsp?name="+name;
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
        
        
<!--        <div>
            <h1><a href="BillDesk.jsp" style="margin-left: 300px">Home</a>>>Accounts</h1>
        </div>
        -->
        
        
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
                    <td> <a href="tableacc.jsp" style="text-decoration: none;color: black;"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Table Accounts&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td><a href="taxsettings.jsp" style="text-decoration: none;color: black;background-color: green"><font style="color: #ffffff;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Tax Settings&nbsp;&nbsp;&nbsp;</a> </td>
                </tr>
                 <tr>
                    <td><a href="paymenttype.jsp" style="text-decoration: none;color: black;"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Payment Types&nbsp;&nbsp;&nbsp;</a> </td>
                </tr>
            
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;
            
            
        </div>
       <%
           String name=request.getParameter("id");
           String comment=request.getParameter("id");
           ArrayList list=Accounts.getTax(name);
       %>
            
        <div style="margin-left: 290px;margin-top: -255px">
            <fieldset>
                <!--<h1 style=";font-family: myFirstFont"> Create Tax Settings</h1>-->
                <b style="font-family: myFirstFont;margin-left: 280px;font-size: 30px">Create Tax Settings</b>
                <br>
            <br>
       
           
            <table>
                <tr>
                    <td  style="font-family: myFirstFont;font-size: 20px" >Tax Setting Name<input type="text"name="tax" value="<%=name%>"></td>
                    <td style="font-family: myFirstFont;font-size: 20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                        
                        Comments<input type="text"name="tax" value="<%=comment%>"></td>
                </tr>
            </table>
                <!--            <h1>Define Taxes</h1>--><br>
 <b style="font-family: myFirstFont;margin-left: 320px;font-size: 30px">Define Taxes</b>
                <br>
           
            <fieldset style="border-radius: 8px;font-family: myFirstFont">
            <table>
               
                <tr>
                    <td>Name</td>
                    <td></td>
                   
                      
                     <td>value</td>
                </tr>
                 <%
                 String formula="";
                    Iterator itr=list.iterator();
                    while(itr.hasNext()){
                    TaxForm tf=(TaxForm)itr.next();
                    formula=tf.getFormula().replace(";","+");
                %>
                 <tr>
                     <td><input type="text"name="vat"value="<%=tf.getType()%>"></td>
                    <td>=</td>
                    <td><input type="text"name="vat1"value="<%=tf.getVal()%>"></td>
                    <td> <%=tf.getOp()%>
                    </td>
                    <td> <%=tf.getWit()%></td>



                </tr>
               <%}%>
               
                
               
               
       </table>
                
                
                
            </fieldset>
           
        <!--<h1>Grand Total Formula</h1>-->
        <br>
 <b style="font-family: myFirstFont;margin-left: 280px;font-size: 30px">Grand Total Formula</b>
                <br>
           
            <fieldset style="border-radius: 8px;font-family: myFirstFont">
            <table>
                <tr>
                     <td>Grand Total</td>
                    <td>=</td>
                 
                    <td> <%=formula%>



                </tr>
                </table>
                 
               </fieldset>
        
        <br>
        
               
        
          &nbsp;  &nbsp;  &nbsp;  &nbsp;  
        
         <b style="border-radius:10px; height:30px;background: #d0d0d0;font-family: myFirstFont;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;
                 <a href="edittax.jsp?id=<%=name%>&comment=<%=comment%>"style="text-decoration: none"> Edit </a>&nbsp;&nbsp;&nbsp;</b> 
         
                 &nbsp;  &nbsp;  &nbsp;  &nbsp;  
                 <b style="border-radius:10px; height:30px;background: #d0d0d0;font-family: myFirstFont;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;
                 <a href="javascript:delet('<%=name%>')" style="text-decoration: none"> Delete </a>&nbsp;&nbsp;&nbsp;</b> 
             
        </div>
       
         </fieldset>
        </fieldset>        
       
    </body>
</html>
