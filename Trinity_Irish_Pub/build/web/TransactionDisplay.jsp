<%--
    Document   : KichenDisplay
    Created on : Dec 2, 2013, 5:29:48 PM
    Author     : admin
--%>

<%@page import="com.manager.Orders"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.manager.Forms.TransactionForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Refresh" content="300">
        <link REL="SHORTCUT ICON" HREF="images/logo.ico">
        <title><%=getServletContext().getInitParameter("name")%></title>
        <link href="css/modal.css" rel="stylesheet" type="text/css" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link href="css/circles.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/calendar.js"></script>
        <link rel="stylesheet" type="text/css" href="js/calendar.css" />
        <script src="js/jquery.js"></script>
        <script src="js/getData.js"></script>
        <link rel="stylesheet" type="text/css" href="css/notification.css" />
        <script type="text/javascript" language="javascript">
            function trans(id,amount,type,date,d,t)
            {
                window.location.href="TransactionDisplay.jsp?id="+id+"&amount="+amount+"&type="+type+"&date="+date+"&discount="+d+"&tax="+t+"#login_form";
            }
            function subdelete(){
                
                document.getElementById("deleteT").submit();
            }
            function checkAll()
            { 
                var x=document.delete.ch[0].checked;
                
               
                for(i=0;i<document.delete.ch.length;i++)
                    document.delete.ch[i].checked=x;
              
            }
        </script>
        <style type="text/css">
	.TFtable{
		width:100%; 
		border-collapse:collapse; 
	}
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
                width: 35px;
                height: 35px;
                background:gray;
                -moz-border-radius: 500px;
                -webkit-border-radius: 500px;
                border-radius: 500px;
                
            }
            a{
                text-decoration: none;
            }
        </style>
    </head>
   <body background="faf8f9">
<!---->

        <fieldset style="height:700">
<!--        <img src="">


 <div style="background: url(images/top.png);width: 100%;height: 100px;margin-top: -20px">
            <br>
            <img src="images/Dg.png">
        </div>-->
<%
                Orders o=new Orders();
                int c1=o.getNotification();
                %>
        <%@include file="Header.jsp" %>
        
        <b><font face="Helvetica Rounded LT Std"style="color:#000000;font-size: 22px; font-family: myFFont;">Transactions :</font></b> 
    

                 
                 <table style="margin-left: 700px;margin-top: -30px">
                     <tr>
                         <td>
                 Date Range :</td>
                 <form id="frm" name="search" action="transactions" style="float:right;margin-right: 100px;margin-bottom: 50px" >
                     <td>   <input type="text" size="10" name="from">&nbsp</td>
                     <td>  <a href="#" onclick="setYears(2013,2099);showCalender(this,'from');"><img src="images/cicon.png"></a></td>
                     <td>    &nbsp; to&nbsp;</td><td> <input type="text" size="10" name="to">&nbsp</td>
                     <td>  <a href="#" onclick="setYears(2013,2099);showCalender(this,'to');"><img src="images/cicon.png"></a></td>
                     <td>    <input type="submit" value="Search">&nbsp;</td>
                     <td> <input type="button" value="Delete" onclick='subdelete()'><br></td>
                 </form>
                    
                 </tr>
                 </table>
        </div>
        <br>
        <form action='deleteTransactions.jsp' name='delete' id='deleteT' method='get'>
   <table  class="TFtable" width="90%" style="background: white;margin-top: -20px;border:1px solid #D3D3D3;border-collapse: collapse" > 

                <tr  style="border:1px solid #D3D3D3">
                    <td bgcolor="575857"style="border:1px solid #D3D3D3;"><font face="Helvetica Rounded LT Std"style="color:#ffffff;font-size: 16px; font-family: myFFont;">
                        <input type='checkbox' value='all' name='ch' onchange='checkAll()'>Transaction ID </font></td>
                    <td bgcolor="575857"style="border:1px solid #D3D3D3;"><font face="Helvetica Rounded LT Std"style="color:#ffffff;font-size: 16px; font-family: myFFont;">Amount</font></td>
                   <td bgcolor="575857"style="border:1px solid #D3D3D3;"><font face="Helvetica Rounded LT Std"style="color:#ffffff;font-size: 16px; font-family: myFFont;">Transaction Type </font></td>
                    <td bgcolor="575857"style="border:1px solid #D3D3D3;"><font face="Helvetica Rounded LT Std" style="color:#ffffff;font-size: 16px; font-family: myFFont;">Date </font></td>
                    <td bgcolor="575857"style="border:1px solid #D3D3D3;"><font face="Helvetica Rounded LT Std" style="color:#ffffff;font-size: 16px; font-family: myFFont;">Discount </font></td>
                <td bgcolor="575857"style="border:1px solid #D3D3D3;"><font face="Helvetica Rounded LT Std" style="color:#ffffff;font-size: 16px; font-family: myFFont;">Taxes </font></td>  
                </tr>
<%
                    ArrayList list=(ArrayList)session.getAttribute("trans");
                    Iterator itr=list.iterator();
                    while(itr.hasNext())
                    {
                        TransactionForm t=(TransactionForm)itr.next();
                        String tid=t.getId();
                        String amount=t.getAmount();
                        String typ=t.getTxn();
                        String date=t.getDate();
                        String discount=t.getDiscount();
                        String tax=t.getTax();
                        System.out.println(tid);
                                    %>

            <tr>
                      <td style="border:1px solid #D3D3D3">
                      <input type='checkbox' name='ch' value='<%=tid%>'>
                          <a href="javascript:trans('<%=tid%>','<%=amount%>','<%=typ%>','<%=date%>','<%=discount%>','<%=tax%>')" id="login_pop" > 
                              <%=tid%></a>
                      </td>

                      <td style="border:1px solid #D3D3D3"><%=amount%></td>
                      <td style="border:1px solid #D3D3D3"><%=typ%></td>
                          <td style="border:1px solid #D3D3D3"><%=date%></td>
                          <td style="border:1px solid #D3D3D3"><%=discount%></td>
                          <td style="border:1px solid #D3D3D3"><%=tax%></td>
                       </tr>
<%}%>
                 
            </table>
        </form>
<div align="center"  style="float: right;margin-right: 100px;margin-top: 50px;background-image:url(images/prtbtn.png);width: 243px;height: 33px"><a href="SyncTransactions.jsp" target="a" style="color:white"><font face="Helvetica Rounded LT Std"style="color:#ffffff;font-size: 22px; font-family: myFirstFont;">Sync Transactions&nbsp;&#8693;</font></a></div>
        </fieldset>

        <a href="#x" class="overlay" id="login_form"></a>
        <div class="popup" style="width:1000px;height: 400px;">
            <h2>Transaction Details</h2>
            <%
                String s=request.getParameter("id");
                String amt=request.getParameter("amount");
                String txn=request.getParameter("type");
                String dat=request.getParameter("date");
                String dis=request.getParameter("discount");
                String tax=request.getParameter("tax");
                out.println("<fieldset>");
                out.println("Transaction ID");out.println(":");
                out.println(s);
                out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                out.println("Date:");
                out.println(dat);
                out.println("<br>");
                out.println("<br>");
                out.println("Transaction Type:");
                out.println(txn);
                out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                out.println("Amount:");
                out.println(amt);
                out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                out.println("Discount:");
                out.println(dis);
                 out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                out.println("Taxes:");
                out.println(tax);
                out.println("</fieldset>");
                out.println("<br>");  
            %>
            
            
            
            <div id="print" style="margin-left:10px;margin-top: 30px;font-size: 15px;height: 200px;overflow-y: scroll">
                <table  width="100%" >
                    <tr>
                        <td width="40%"><b>Items Name</b> </td>
                        <td width="20%"><b>Unit Price </b></td>
                        <td width="20%"><b>Quntity</b></td>
                        <td><b>Total price</b></a> </td>
                    </tr>
                    <%
                        PreparedStatement ps=DBConnection.getPrepare("select iname,price,quantity,tprice from trans where trasid='"+s+"'");
                        ResultSet rs=ps.executeQuery();
                        while(rs.next())
                        {
                    %> 
                    <tr>
                        <td><b><%=rs.getString(1)%></b> </td>
                        <td><b><%=rs.getString(2)%></b></td>
                        <td><b><%=rs.getString(3)%> </b></td>
                        <td><b><%=rs.getString(4)%></b></td>
                    </tr>
                    <%
                        }
                    %>    
                </table> 
                </div>
                <a class="close" href="#close"></a>
            
        </div>
                <div id="circles"></div>
            <script>loadContent()</script>
         <!-- Calender Script  -->
        <table id="calenderTable">
            <tbody id="calenderTableHead">
                <tr>
                    <td colspan="4" align="center">
                        <select onChange="showCalenderBody(createCalender(document.getElementById('selectYear').value,
                            this.selectedIndex, false));" id="selectMonth">
                            <option value="0">Jan</option>
                            <option value="1">Feb</option>
                            <option value="2">Mar</option>
                            <option value="3">Apr</option>
                            <option value="4">May</option>
                            <option value="5">Jun</option>
                            <option value="6">Jul</option>
                            <option value="7">Aug</option>
                            <option value="8">Sep</option>
                            <option value="9">Oct</option>
                            <option value="10">Nov</option>
                            <option value="11">Dec</option>
                        </select>
                    </td>
                    <td colspan="2" align="center">
                        <select onChange="showCalenderBody(createCalender(this.value,
                            document.getElementById('selectMonth').selectedIndex, false));" id="selectYear">
                        </select>
                    </td>
                    <td align="center">
                        <a href="#" onClick="closeCalender();"><font color="#003333" size="+1">X</font></a>
                    </td>
		</tr>
            </tbody>
            <tbody id="calenderTableDays">
                <tr style="">
                    <td>Sun</td>
                    <td>Mon</td>
                    <td>Tue</td>
                    <td>Wed</td>
                    <td>Thu</td>
                    <td>Fri</td>
                    <td>Sat</td>
                </tr>
            </tbody>
            <tbody id="calender"></tbody>
        </table>
        <!-- End Calender Script  -->
        <a href="#x" class="overlay" id="join_form"></a>
        <div class="popup" style="width:200px;height: 300px;">
            <h4>Checked out Tables</h4>
            <%
                       ArrayList lst=o.getCheckedOut();
                       Iterator it=lst.iterator();
                       while(it.hasNext()){
                       out.println(it.next()+" is checked out");
                       }
            %>
            <a class="close" href="#close"></a>
        </div>
        
    </body>
</html>
