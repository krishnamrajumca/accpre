<%--
    Document   : KichenDisplay
    Created on : Dec 2, 2013, 5:29:48 PM
    Author     : admin
--%>

<%@page import="com.manager.Forms.ActionForm"%>
<%@page import="com.manager.Orders"%>
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
        <meta http-equiv="Refresh" content="5">
        <link REL="SHORTCUT ICON" HREF="images/logo.ico">
        <title><%=getServletContext().getInitParameter("name")%></title>
        <link rel="stylesheet" type="text/css" href="css/notification.css" />
        <link href="css/modal.css" rel="stylesheet" type="text/css" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link href="css/circles.css" rel="stylesheet" type="text/css" />
        <link href="css/scroll.css" rel="stylesheet" type="text/css"> 
        <script src="js/jquery.js"></script>
        <script src="js/getData.js"></script>
        <style type="text/css">
/*	.TFtable{
		width:100%; 
		border-collapse:collapse; 
	}*/
	.TFtable td{ 
		padding:7px; border:#4e95f4 1px solid;
	}
	/* provide some minimal visual accomodation for IE8 and below */
	.TFtable tr{
		background: #b8d1f3;
	}
	/*  Define the background color for all the ODD background rows  */
	.TFtable tr:nth-child(odd){ 
		background: #f0eeef;
	}
	/*  Define the background color for all the EVEN background rows  */
	.TFtable tr:nth-child(even){
		background: #fdfbfc;
	}
</style>
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
        <style>
            #circl{
                width: 60px;
                height: 60px;
                background:gray;
                -moz-border-radius: 500px;
                -webkit-border-radius: 500px;
                /*border-radius: 500px;*/

            }
            a{
                text-decoration: none;
            }
        </style>
    </head>
   <body background="#f0f0f0">
<!---->
<%
                Orders o=new Orders();
                int c1=o.getNotification();
                %>
            <fieldset style="height:700">
        <!--<img src="">-->


<!-- <div style="background: url(images/top.png);width: 100%;height: 100px;margin-top: -20px">
            <br>
            <img src="images/Dg.png">
        </div>-->
        <%@include file="Header.jsp" %>
         <table>
    <td style="background: url(images/unselected.png);width: 205px;height: 43px;text-align: center;font-size: 18px;text-align: center"><b>
                        <font face="Helvetica Rounded LT Std"style="color:black;font-size: 21px; font-family: myFFont;"><a href="KichenDisplay.jsp" Style="color:#000000">Kitchen Display</a>
                    </FONT></b></td>
                    
                    <td style="background: url(images/selected.png);width: 205px;height: 43px;text-align: center;font-size: 18px;text-align: center"><b>
                        <font face="Helvetica Rounded LT Std"style="color:black;font-size: 21px; font-family: myFFont;"><a href="WaiterDisplay.jsp" Style="color:#ffffff">Waiter Display</a>
                    </FONT></b></td>
                    </table>
        
<table>
    <tr>

        <td>
        <div id="circles"></div>
            <script>loadContent()</script>
<!--        <div style=color:lightslategray>
            Tables
        </div>-->

        <fieldset style="margin-left: 30px;">
        <div style="margin-left: 5px;margin-left: 1px;background-image: url(images/tab.png);width: 358px;height: 572px">
             <table style="margin-left: 25px">
                <%
                int cnt=0,count=0;
                //String c=(String)(session.getAttribute("count")+"");
                //if( !c.equals("null") || c!="null" || !c.equals(null) || c!=null)
                   // cnt=Integer.parseInt(c);

    String activeid=request.getParameter("id");
    if(activeid==null)
        activeid="0";
    Tables t=new Tables();
    ArrayList list=t.getTables();
    Iterator itr=list.iterator();
    while(itr.hasNext()){
        out.println("<tr>");
        for(int i=0;i<5&&itr.hasNext();i++){
            TableForm tf=(TableForm)itr.next();
            String id=tf.getId();
            String ordered=tf.getOrdered();
            String color="gray";
            boolean f=false;
            String link="#";
             String img="images/gray.png";
            if(ordered.equals("1"))
            {
                color="green";
                f=true;
                img="images/green.png";
                link="WaiterDisplay.jsp?id="+id;
                count++;
            }
            if(activeid.equals(id)){
                color="red";
                img="images/red.png";
            }
            session.setAttribute("count",count+"");

        %><td><font face="Helvetica Rounded LT Std" style="color:black;font-size: 22px; font-family:myFirstFont;">  
            <a href="<%=link%>" style="text-decoration: none;">
            <div style="background:url(<%=img%>)" id="circl">
                
                
                <p style="width:40px;height: 1px;font-weight: bolder;text-align: center;margin-top: 15px;">
                <div style='margin-left: 25px;margin-top: 17px'><%=id%></div>
                    </p>
                
            </div></a></font>
                        </td><%
        }
            //out.println(itr.next());
        out.println("</tr>");
    }

%>
                     </table>

        </div>

        </fieldset>
        </td>
        <td>                      <!--embed height="0" width="0" src="css/s.mp3"/>-->
            <div style="color:#fffff;margin-top: -55px;overflow-y: auto;height:550px" class="scrollbar">
                <font face="Helvetica Rounded LT Std" style="color:black;font-size: 22px; font-family:myFirstFont;">
                    &nbsp;&nbsp; Table <%=activeid%> </font>
             <table  class="TFtable"style="border:1px solid #D3D3D3;border-collapse: collapse" width="800px" style="text-align: center">


                <th bgcolor="575857"style="border:1px solid #D3D3D3;"align="center"><font face="Helvetica Rounded LT Std"style="color:#ffffff;font-size: 16px; font-family: myFFont;">Item name </font></th>

                   <th bgcolor="575857"style="border:1px solid #D3D3D3;"><font face="Helvetica Rounded LT Std"style="color:#ffffff;font-size: 16px; font-family: myFFont;">Quantity</font></th>
                   <th bgcolor="575857"style="border:1px solid #D3D3D3;"><font face="Helvetica Rounded LT Std"style="color:#ffffff;font-size: 16px; font-family: myFFont;">Status </font></th>
                   <th bgcolor="575857"style="border:1px solid #D3D3D3;"><font face="Helvetica Rounded LT Std"style="color:#ffffff;font-size: 16px; font-family: myFFont;">Action </font></th>

<%
Orders or=new Orders();
list=or.getData(activeid);
itr=list.iterator();
while(itr.hasNext()){
ActionForm af=(ActionForm) itr.next();
String name=af.getName();
String qt=af.getQuantity();
String st=af.getStatus();
String act=af.getWaiterAction();
%>
<tr>
                    <td style="border:1px solid blue;width: 40%"><%=name%> </td>

                    <td style="border:1px solid blue;" align="center"><%=qt%></td>
                   <td style="border:1px solid blue;"align="center"><%=st%> </td>
                   <td style="border:1px solid blue;"align="center"><%=act%> </td>
                  </tr>
                  <%
}
%>


            </table>

</div>
        </fieldset>
 <a href="#x" class="overlay" id="join_form"></a>
        <div class="popup" style="width:200px;height: 300px;">
            <h4>Checked out Tables</h4>
            <%
                       ArrayList lst=o.getCheckedOut();
                       Iterator it1=lst.iterator();
                       while(it1.hasNext()){
                       out.println(it1.next()+" is checked out");
                       }
            %>
            <a class="close" href="#close"></a>
        </div>
        </td>
    </tr>
</table>
    </body>
</html>
