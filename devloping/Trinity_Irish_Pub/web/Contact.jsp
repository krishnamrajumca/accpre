<%@page import="com.manager.Orders"%>
<%@page import="com.manager.Forms.TableItems"%>
<%@page import="com.manager.GetItemsOnTable"%>
<%@page import="com.manager.Forms.TableForm"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.manager.Tables"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=getServletContext().getInitParameter("name")%></title>
        <link rel="stylesheet" type="text/css" href="css/notification.css" />
        <link href="css/modal.css" rel="stylesheet" type="text/css" />
        <link href="css/circles.css" rel="stylesheet" type="text/css" />
        <link href="style.css" rel="stylesheet" type="text/css" />
              <script src="js/jquery.js"></script>
<script src="js/getData.js"></script>

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
       <style type="text/css">


            #watermark {
  color: #d0d0d0;
  font-size: 20pt;
  -webkit-transform: rotate(0deg);
  -moz-transform: rotate(0deg);
  position: bottom;
  width: 100%;
  height: 20%;
  margin: 0;
  z-index: -1;
  left:-100px;
  top:-200px;

            }
            #button1 {
  background: url("images/gb.png") no-repeat;
  cursor:pointer;
  width:100px; height:px;
  }

            #circl{
                width: 52px;
                height: 52px;
                background:gray;
                -moz-border-radius: 500px;
                -webkit-border-radius: 500px;
                border-radius: 500px;

            }
            a{
                text-decoration: none;
            }
        </style>
        <script type="text/javascript">







          function printPage()
            {
                var printContent =document.getElementById("print");
                var Win4Print=window.open('', '', 'left=0,top=0,width=800,height=500,top=300,left=365,resizable=1,status=0,toolbar=0');
                Win4Print.document.write(printContent.innerHTML);
                Win4Print.document.close();
                Win4Print.focus();
                Win4Print.print();
                Win4Print.close();
            }
            function disc(id,total){

                var v=document.bill.desc.value;
                if(isNaN(v)){
                    alert("Enter a valid Number")
                    dis=0;
                }
                var t,dis;
                for(i=0;i<document.bill.discount.length;i++)
                    if(document.bill.discount[i].checked)
                           t=document.bill.discount[i].value;
                  if(t=='per')
                  {

                      dis=(total*v)/100;

                  }
                  else
                  {
                      dis=v;
                  }
                  //alert(dis);
                  dis=Math.round(dis);
                   window.location.href="BillDesk.jsp?id="+id+"&value="+dis;
            }
            function removeitems(id){

                var val="RemoveOrder?";
                var x=0;
                for(i=0;i<document.bill.remov.length;i++){
                    if(document.bill.remov[i].checked){
                        val+="ch="+document.bill.remov[i].value+"&";
                        x++;
                    }
                }
                val+="table="+id;
                if(x>0)
                    window.location.href=val;
                    //alert(val);
            }
        </script>
    </head>
   <body >
<!---->

        <fieldset style="height:700">




<!--        <div style="background: url(images/top.png);width: 100%;height: 100px;margin-top: -20px">
            <br>
            <img src="images/Dg.png">
        </div>  -->
            <%
                Orders o=new Orders();
                int c1=o.getNotification();
           
                %>
    <%@include file="Header.jsp" %>

        <div style="margin-left: 50px;font-size: 18px">
            <table>
               
                <tr>
                     <td style="font-size: 20px"><font color="#228B22"> <b><font style="color: #228B22;font-family: myFirstFont;font-size: 24px">Contact Us :</b></font></td></tr>
               
                   
                <tr>
                    <td> <font style="color: #000000;font-family: myFirstFont;font-size: 20px">Accpre Software Technologies Pvt Ltd.</font></td></tr></br>
                <tr>
                <td> <font style="color: #000000;font-family: myFFont;font-size: 16px">8-2-601/B/22,</font></td>
                </tr>
                <tr>
                <td><font style="color: #000000;font-family: myFFont;font-size: 16px">Road No.10,</font></td>
                </tr>
                <tr><td> <font style="color: #000000;font-family: myFFont;font-size: 16px">  Banjara Hills,</font></td>
                </tr>
                <tr> <td> <font style="color: #000000;font-family: myFFont;font-size: 16px">hyderabad-500034.</font></td></tr>
                <tr>
                <td> <font style="color: #000000;font-family: myFFont;font-size: 16px">Email: accpre.tech@gmail.com</font></td>
                </tr>
                <tr>
                    <td> <font style="color: #000000;font-family: myFFont;font-size: 16px"><a href="http://www.digidine.in" target="a">Web: www.digidine.in</a></font></td>
                </tr>
            </table>
        </div>
        <div style="margin-left: 500px ;margin-top:-100px">
            <form name="send" action="sendMail">
            <table>
                <tr>
                    <td style="font-size: 20px"> <font style="color: #228B22;font-family: myFirstFont;font-size: 20px">Support</font></td>
                </tr>
                <tr>
                <td> <textarea rows="4" cols="50" placeholder="Enter your Query Here" name="query" style="resize:none">
                </textarea></td>
                </tr>
                <tr>
                    <td style="text-align: right">

                        
                        <input type="submit" value="send">
                    </td>
                </tr>
            </table>
            </form>
           
        </div>

      <div id="circles"></div>
            <script>loadContent()</script>
        </body>
        </html>