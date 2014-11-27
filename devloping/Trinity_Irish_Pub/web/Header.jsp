<%@page import="com.manager.Orders"%>
<script src="js/jquery.js"></script>
<!--<meta http-equiv="Refresh" content="8">--> 

<head>
    <!--<script src="js/jquery.js"></script>-->
</head>
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
    .tim{

        width: 112px;
        height: 86px; background-image: url(images/menu.png);
    }
</style>
<style>
    .uim{
        width: 112px;
        height: 86px; background-image: url(images/rep.png);
    }
</style>
<style>
    .vim{
        width: 112px;
        height: 86px; background-image: url(images/invt.png);
    }
</style>
<style>
    .wim{
        width: 112px;
        height: 86px; background-image: url(images/act.png);
    }
</style>
<style>
    .xim{
        width: 112px;
        height: 86px; background-image: url(images/contact.jpg);
    }
</style>



<style type="text/css">
    #help{
        background-color:#f5f5f5;
        background-image:url(images/gridp.png);
        width:336px;
        height:343px;
        display:none;
        position:fixed;
        border-radius: 10px;
        top:30%;
        left:83%;
        margin:-150px 0 0 -150px;
    }
</style>

<script type="text/javascript">
    $(document).ready(function () {
        $("#help_button").click(function () {
            $("#help").slideToggle(600, function () {
                if ($("#help_button").val() === "")
                {
                    $("#help_button").val(" ");
                }
                else
                {
                    $("#help_button").val(" ");

                }
            });

        });


    });
</script>


<style type="text/css">
    /*<![CDATA[*/
    body {
        background:#faf8f9;
    }
    #container {
        width:415px;
        margin:50px auto;
    }
    #tbl {
        border:solid 1px #666;
        background:#fff;
    }
    .cell {
        width:400px;
        height:100px;
        border:solid 1px #666;
    }
    a.goog {
        display:block;
        width:200px;
        height:50px;

        text-align:center;
        text-decoration:none;
        padding-top:5px;


    }

</style>

<%
    String rols = (String) session.getAttribute("rols");

%>

<table     style="background-image: url(images/tabb.png);margin-left: -10px;width: 102%;height: 78px;margin-top: -13px">
    <tr><tr></tr>
    <td></td>
    <td></td>
    <td></td>
    <% if (rols.contains("BillDesk")) {%>
    <td style="background: url(images/unselected.png);width: 204px;text-align: center"><b>
            <font style="color: #ffffff;font-family: myFFont;font-size: 20px"><a href="BillDesk.jsp" Style="color:#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bill Desk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></font>
            <div class="notification-container">

                <%
                    Orders o1 = new Orders();
                    int c2 = o1.getNotification();
        if (c2 != 0) {%>
                <span class="notification-counter"><a href="#join_form"><%=c2%></a></span><%}%>
            </div>
        </b></td><%}
            if (rols.contains("Order Management")) {

        %>
    <td></td>

    <td></td>
    <td></td>

    <td style="background: url(images/unselected.png);width: 204px;height: 40px;text-align: center">
        <b><font style="color: #ffffff;font-family: myFFont;font-size: 20px"><a href="OrderManagement.jsp" Style="color:#000000;font-size: 20px">&nbsp;&nbsp;&nbsp;Order Management&nbsp;&nbsp;</a></FONT></b></td>
            <%}%>
    <td></td>
    <td></td>
    <td></td>
    <td style="background: url(images/unselected.png);width: 204px;height: 40px;text-align: center;font-size: 18px;text-align: center"><b>
            <font style="color: #ffffff;font-family: myFFont;font-size: 20px">
            <a href="KichenDisplay.jsp" Style="color:#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Monitoring&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            </FONT></b></td>
    <td></td>
    <td></td>
    <td></td>
    <%
        if (rols.contains("Transactions")) {
    %>

    <td style="background: url(images/unselected.png);width: 204px;height: 42px;text-align: center;font-size: 18px"><b><font style="color: #ffffff;font-family: myFFont;font-size: 20px">
            <a href="transactions" Style="color:#000000">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Transaction&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></FONT></b></td>
            <%}%>   
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td><td></td>
    <td></td>
    <td></td><td></td>
    <td></td>
    <td></td><td></td>
    <td></td>
    <td></td><td></td>
    <td></td>
    <td></td><td></td>
    <td></td>
    <td></td><td></td>
    <td></td>
    <td></td><td></td>
    <td></td>
    <td></td><td></td>
    <td></td>
    <td></td><td></td>
    <td></td>
    <td></td><td></td>
    <td></td>
    <td></td><td></td>
    <td></td>
    <td></td><td></td>
    <td></td>

    <td>
        <input id="help_button" type="button" value="" style="background: url(images/grid.png);width:30px;height:30px;"/>


    </td>




</tr>
<tr></tr><tr></tr>
</table>
<div id="help" >
    <div style="margin-left: 13px;margin-top: 21px">
        <table style="width: 100%">


            <%
       {%>
            <tr style="width: 100%">
                <% if (rols.contains("Menu Management")) {%>
                <!--<input type="button" onClick="/menu.jsp" value=""/style="background: url(images/menu.png)">-->
                <td style="margin-top: 20px"><input class="tim" type="button" value="" onClick="javascript:window.location = 'menu.jsp';"> </td>
                <!--<td style="background: url(images/menu.png);width: 112px;height: 81px;text-align: center;font-size: 18px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><FONT COLOR=WHITE><a href="menu.jsp" Style="color:white"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></FONT></b></td>-->
                <%}
                   if (rols.contains("Reports")) {%>
                <td align="center" style="margin-top: 20px" ><input class="uim" type="button" value="" onClick="javascript:window.location = 'Reports.jsp';"> </td>
                <!--<td style="background: url(images/unselected.png);width: 112px;height: 81px;text-align: center;font-size: 18px"><b><FONT COLOR=WHITE><a href="Contact.jsp" Style="color:white;font-size: 15px">Contact Us</a></FONT></b></td>-->
                <%}%>
            </tr>
            <tr>
            </tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
            <tr style="width: 100%">
                <% }
                if (rols.contains("Accounts")) {%>
                <td style="margin-top: 20px"><input class="vim" type="button" value="" onClick="javascript:window.location = 'Accounts.jsp';"> </td>
                    <% }
                if (rols.contains("Accounts")) {%>
                <td align="center" style="margin-top: 20px"><input class="wim" type="button" value="" onClick="javascript:window.location = 'Accounts.jsp';"> </td>
                    <%}%>
               
            </tr>   
        </table>
    </div>
    <div style="margin-left: 13px;margin-top: 15px;">
        <table>
            <tr>   
                
                <td style="background: url(images/signout.png);width: 304px;height: 40px;text-align: center;font-size: 20px;font-family: mySFont;"><b><FONT COLOR=WHITE><a href="Contact.jsp" Style="color:#000000;font-size: 15px"> Contact Us  </a></FONT></b></td>
                
            </tr>     
            <tr></tr><tr></tr><tr></tr>
            <tr></tr><tr></tr>
            <tr>
                <td style="background: url(images/signout.png);width: 304px;height: 40px;text-align: center;font-size: 20px;font-family: mySFont;"><b><FONT COLOR=WHITE><a href="LoginPage.jsp" Style="color:#000000;font-size: 15px"> Sign Out  </a></FONT></b></td>
                
            </tr>
        </table>
    </div>
</div>
