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
            var arr=["daily","monthly","daterange","itemwise","tablewise"];
            function trans(id,amount,type,date,d)
            {
                window.location.href="TransactionDisplay.jsp?id="+id+"&amount="+amount+"&type="+type+"&date="+date+"&discount="+d+"#login_form";
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
            function display(){
                //alert("change");
                var sel = document.getElementById('reports');
                var index=sel.selectedIndex;
                //alert(arr[index]);
                for(i=0;i<5;i++)
                    document.getElementById(arr[i]).style.display = 'none';
                document.getElementById(arr[index]).style.display = 'block';
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
   <body background="#f0f0f0">
<!----><%
                Orders o=new Orders();
                int c1=o.getNotification();
                %>

        <fieldset style="height:700">
<!--        <img src="">


 <div style="background: url(images/top.png);width: 100%;height: 100px;margin-top: -20px">
            <br>
            <img src="images/Dg.png">
        </div>-->


        <%@include file="Header.jsp" %>
        
        <b>Reports :</b> 
        <div>
            
            <form name="frm" action="Reports" method="post">
                    <div style="width: 500px;margin-left: 200px">
                        <b>Select Date Range</b>
                    <fieldset>
                        
                    <table>
                        <tr>
                            <td>
                                From:
                                <input type="text" name="from"/>
                                <a href="#" onclick="setYears(2013,2099);showCalender(this,'from');"><img src="images/cicon.png"></a>
                            </td>
                            <td>
                                To:
                                <input type="text" name="to"/>
                                <a href="#" onclick="setYears(2013,2099);showCalender(this,'to');"><img src="images/cicon.png"></a>
                            </td>
                        </tr>
                        
                    </table>
                    </fieldset>
                        <br/>
                        <br/>
                        Select Reports
                        <fieldset>
                            <table>
                                <tr>
                                    <td>
                                        <input type="checkbox" name="bill"/>&nbsp;&nbsp;Bill Register
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" name="manager"/>&nbsp;&nbsp;Manager Reports
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" name="gross"/>&nbsp;&nbsp;Gross Sale Summery
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" name="item"/>&nbsp;&nbsp;Item consumption
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" name="modified"/>&nbsp;&nbsp;Modified Bills
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                        <br/>
                        <div style="float: right">
                        Save Report as:<select name="type">
                            <option value="excel">Excel</option>
                            <option value="doc">Word Document</option>
                            <option value="note">Notepad</option>
                        </select>
                        </div>
                        <br/>
                        <br/>
                        <input type="submit" value="Generate" style="width: 200px;background-color:#222;color: #ffffff; height: 30px;border-radius: 10px;font-family: myFirstFont;font-size: 20px"/>
                    </div>
                </form>
            
        </div>
        </div>
        <br>
        

        </fieldset>

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
