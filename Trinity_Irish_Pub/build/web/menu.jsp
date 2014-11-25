
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.manager.Orders"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConnection"%>

<%@page import="com.util.cp"%>
<%@page import="com.action.accounts.forms.Taxes"%>
<%@page import="com.action.accounts.forms.TaxForm"%>
<%@page import="com.action.accounts.forms.OrdersF"%>
<%@page import="com.action.accounts.forms.Pay"%>
<%@page import="com.action.accounts.Accounts"%>
<%--<%@page import="org.openxmlformats.schemas.wordprocessingml.x2006.main.STShd.Enum.table"%>--%>
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

        <!--        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title><%=getServletContext().getInitParameter("name")%></title>
                <link rel="stylesheet" type="text/css" href="css/notification.css" >
                <link href="css/modal.css" rel="stylesheet" type="text/css" >
                <link href="style.css" rel="stylesheet" type="text/css" >
                <link href="css/circles.css" rel="stylesheet" type="text/css" >
                <link href="css/radio.css" rel="stylesheet" type="text/css" >
                <link href="css/scroll.css" rel="stylesheet" type="text/css" >
                
                <script type="text/javascript" src="simpletreemenu.js"></script>
                <link rel="stylesheet" type="text/css" href="style.css" />
                <link href="css/layout.css" rel="stylesheet" type="text/css">-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <link rel="stylesheet" type="text/css" href="css/notification.css" />
        <script type="text/javascript" src="simpletreemenu.js"></script>
        <link href="css/modal.css" rel="stylesheet" type="text/css">
        <!--<link href="css/layout.css" rel="stylesheet" type="text/css">-->
        <title><%=getServletContext().getInitParameter("name")%></title>
        <link rel="stylesheet" type="text/css" href="simpletree.css" />
        <link href="css/circles.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="css/notification.css" />
        <script src="js/jquery.js"></script>
        <script src="js/getData.js"></script>



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

        <style type="text/css"> 
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
        <style type="text/css"> 
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

        <style type="text/css"> 
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


        <script type="text/javascript">
            var value = 0;
            function selec() {
               value=0;
                var test = document.getElementsByName('c');
                var sizes = test.length;

                for (i = 0; i < sizes; i++) {
                    if (test[i].checked == true) {
                        value = test[i].value;
                        //  alert(value + ' you got a value');
                        //return test[i].value;
                    }
                }
            
            }
            function call() {//alert("logo");.Element
                var frm = document.getElementById("frm1");
                frm.enctype = "multipart/form-data";

                frm.submit();
            }
            function unavilable() {
                var val = "unavilable.jsp?";
                var j = 1;
                for (i = 0; i < document.table.chb.length; i++) {
                    if (document.table.chb[i].checked) {
                        val += "ch=" + document.table.chb[i].value + "&";
                    }

                }

                window.location.href = val;

            }
            function avilable() {
                var val = "Available?";

                for (i = 0; i < document.table.chb.length; i++) {
                    if (document.table.chb[i].checked) {
                        val += "ch=" + document.table.chb[i].value + "&";
                    }
                }

                window.location.href = val;
            }

            function additem(menu) {

                selec();
                
                if(value==0)
                    value=menu;
             
                window.location.href = "menu.jsp?menu=" + value + "#additem_form";
            }
            function add() {
                selec();
                // alert(value+" on add");
                var cat = prompt("Enter a Category", "");
                if (cat != null) {
                    // alert(cat);
                    window.location.href = "AddMenu?ref=" + value + "&name=" + cat;
                }
            }
          
            function delet() {
                selec();
                //alert(value);
                window.location.href = "deletemenu.jsp?id=" + value;
            }
            function display(id) {
                // alert(id);
                window.location.href = "menu.jsp?iid=" + id;
            }
            function up() {
                selec();

            }
            function edit() {
                selec();
                var name = prompt("new Name:", "");
                if (name != null) {
                    window.location.href = "editmenu.jsp?name=" + name + "&id=" + value;
                }
            }
           
            function up() {
                selec();
                window.location.href = "upmenu?id=" + value;
            }
            function down() {
                selec();
                window.location.href = "downmenu?id=" + value;
            }
            function deleteitems() {
                var val = "deleteitem.jsp?";
                
                for (i = 0; i < document.table.chb.length; i++) {
                    if (document.table.chb[i].checked) {
                        val += "ch=" + document.table.chb[i].value + "&";
                    }
                  
                }

                window.location.href = val;
            }
            function edititems(id, pid) {
                var val = "menu.jsp?iid=" + pid + "&";
         
                for (i = 0; i < document.table.chb.length; i++) {
                    if (document.table.chb[i].checked) {
                        val += "ch=" + document.table.chb[i].value;

                        break;
                    }
                }
                //alert(val+"#loginin_form");
                window.location.href = val + "#login_form";
            }
            function editprice(price, id) {

                var new_price = prompt("enter new price", price);
                if (new_price != null)
                    window.location.href = "EditPrice.jsp?price=" + new_price + "&id=" + id;
            }
        </script>

    </head>
    <body background="#f0f0f0">

        <!---->


        <%
            Orders o = new Orders();
            int c1 = o.getNotification();
        %>






        <%
            // String s=request.getParameter("name");
            String rid = (String) session.getAttribute("restaurant");
            String pid = request.getParameter("iid");
            session.setAttribute("pid", pid);
            System.out.println("---------------------restaurant---------------------" + rid);
        %>

        <fieldset style="height:700px">


            <%@include file="Header.jsp" %>





            <div style="margin-left: 1200px">

                <table ><tr>

                        <td align="right" style="background: url(images/unselected.png);width: 205px;height: 43px;text-align: center;font-size: 18px;"><b><a href="GetMenu.jsp" Style="color:black">Sync&nbsp;&nbsp;&nbsp;&#8693;</a></b></td>

                    </tr></table> 
            </div>   
            <fieldset style="margin-left: 90px;margin-top: 10px;">


                <form name="del" >
                    <div style="width:300px;float: left">



                        Menus

                        <fieldset style="background-color:lightslategray;width:210px">
                            <a href="javascript:add()" title="Add new"><img src="images/add.jpeg"></a>
                            <a href="javascript:up()" title="up"><img src="images/up.gif"></a>
                            <a href="javascript:down()" title="Down"><img src="images/down1.gif"></a>

                            <a href="javascript:delet()" title="Delete"><img src="images/delete.jpeg"></a>
                            <a href="javascript:edit()" title="Edit"><img src="images/edit.jpeg"></a>

                        </fieldset>
                        <jsp:include page="tree.jsp"/>



                    </div>
                </form>
                <div id="menu" class="main" style="text-align:left; margin-left: 350px;margin-bottom: 40px;height:40px">
                    <div class="panel">
                        <ul>
                            <li ><a href="javascript:additem('<%=pid%>')">Add Item</a></li>
                            <li><a href="javascript:unavilable()">Unavailable</a></li>
                            <li><a href="javascript:avilable()">Available</a></li>
                            <li><a href="javascript:deleteitems()">Delete</a></li>
                            <li><a href="javascript:edititems('<%=rid%>','<%=pid%>')">Edit</a></li>
                            <li><a href="uploadmenu.jsp" target='a' title="upload menu data to server">Upload</a></li>

                            <!--<li><a href="javascript:additem()">Add Item</a></li>-->
                            <!--                    <li><a href="javascript:unavilable()"><font style="font-family: myFirstFont;">Unavailable</font></a></li>
                                                <li><a href="javascript:avilable()"><font style="font-family: myFirstFont;">Available</font></a></li>-->
                            <!--                    <li><a href="javascript:deleteitems()">Delete</a></li>
                                                <li><a href="javascript:edititems('<%=rid%>','<%=pid%>')">Edit</a></li>-->
                        </ul>
                    </div>
                </div>
                <div style="text-align:left; margin-left: 350px">
                    <form id='table' name='table'>
                        <table width="65%" border="0" style="text-align:left;margin-left: 50px">
                            <tr>
                                <th>Logo</th>
                                <th width="65%">
                                    <input type="checkbox" name="chb" value="<%=-2%>" style="visibility: hidden">
                                    Item Name
                                    <!--                            <input type="checkbox" name="chb">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name: &nbsp;&nbsp;
                                                                <input type="text" name="name"/>
                                                                <img src="images/search1.png"/>-->
                                </th>
                                <th>price</th>
                            </tr>
                            <%
                                try {
                                    String path = getServletContext().getInitParameter("url");

                                    System.out.println("select id,name,price,logo from items where status=1 and parent=" + pid);
                                    PreparedStatement ps = DBConnection.getPrepare("select id,name,price,status,logo from items where parent=" + pid);
                                    ResultSet rs = ps.executeQuery();
                                    while (rs.next()) {
                                        String iname = rs.getString(2);
                                        int iid = rs.getInt(1);
                                        double price = rs.getDouble(3);
                                        int st = rs.getInt(4);
                                        String img = path + rs.getString(5);
                                        System.out.println(iid + " " + price + " " + iname);
                            %><tr>
                                <td>

                                    <img src="<%=img%>"   style='float:left'width="60px" height="30px" onError="this.src='images/no_logo.jpg';">
                                     <!--<img src="displayLogo.jsp?id=<%=iid%>"   style='float:left'width="60px" height="30px" onError="this.src='images/no_logo.jpg';">-->
                                </td>
                                <td width="65%">


                                    &nbsp;  <input type="checkbox" name="chb" value="<%=iid%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <% String color = "green";
                                        if (st == 0) {
                                            color = "black";
                                        }
                                    %>
                                    <font style='color:<%=color%>'><%=iname%></font>

                                </td>
                                <td><%=price%> <a href="javascript:editprice('<%=price%>','<%=iid%>')">change</a></td>
                            </tr><%}
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                            <!-- <tr>
                                 <td><input type="checkbox" name="check"/></td>
                                 <td><a href="#" >Black Coffee</a></td>
                                 <td>50</td>
                             </tr>
                             <tr>
                                 <td><input type="checkbox" name="check"/></td>
                                 <td><a href="#" >Green Coffee</a></td>
                                 <td>60</td>
                             </tr>
                             <tr>
                                 <td><input type="checkbox" name="check"/></td>
                                 <td><a href="#" >Cold Coffee</a></td>
                                 <td>100</td>
                             </tr>-->
                        </table>
                    </form>
                </div>

            </fieldset>



            <div id="circles"></div>
            <script>loadContent()</script>
            <script type="text/javascript">

                //ddtreemenu.createTree(treeid, enablepersist, opt_persist_in_days (default is 1))

                ddtreemenu.createTree("treemenu1", true)


            </script>
            <a href="#x" class="overlay" id="join_form"></a>
            <div class="popup" style="width:200px;height: 300px;">
                <h4>Checked out Tables</h4>
                <%
                    ArrayList lst = o.getCheckedOut();
                    Iterator it = lst.iterator();
                    while (it.hasNext()) {
                        out.println(it.next() + " is checked out");
                    }
                %>
                <a class="close" href="#close"></a>
            </div>
        </fieldset>
                
                
                <!----------------------popups------------------------------->
                <!----------------------Add Item popup ---------------------->
                 <!-- *************popup******* -->
        <a href="#x" class="overlay" id="additem_form"></a>
        <div class="popup" style="width:900px;height:500px;background-color: lightskyblue">
            <%String menu = request.getParameter("menu");
                session.setAttribute("menu", menu);


            %>
            <h2>Add Items</h2>
            <div>
                <form name="php" id='php' action="#" target='a' method="post" enctype="multipart/form-data">
                    <%
                        String msg = request.getParameter("msg");
                        if (msg != null) {

                    %>

                    <!--                <img src="displayLogo.jsp"  style='float: left;clear: both' width="200px" height="150px" onError="this.src='images/no_logo.jpg';">-->
                    Logo Uploaded
                    <%                } else {

                    %>


                    Choose Logo:<br><input type="file" class="text" name="file"/>
                    <input type="submit" value="save" onclick='sb()'/><%}%>
                </form>
                <form name="add" id="frm" action="AddItem" method="get">
                    <table>
                        <tr><td>

                            </td></tr>
                        <tr>

                            <td>Item Name<br><input class="text" type="text" name="name"/>
                                <input type='hidden' name='img' value="no">
                            </td>
                        </tr>
                        <tr>
                            <td>

                                Price<br><input class="text" type="text" name="price"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Long Description<br><textarea style="width:250px" name="long"></textarea></td>
                        </tr>
                        <tr>
                            <td>Short Description<br><input class="text" type="text" name="short"/></td>
                        </tr>
                        <tr>
                            <td>
                                <input class="btn" type="submit" value="Add Item"/>
                            </td>
                        </tr>
                    </table>

                </form>

            </div>
            <a class="close" href="#close"></a>
        </div>
                <!----------------End ofAdd Item popup ---------------------->
                
                <a href="#x" class="overlay" id="login_form"></a>
            <div class="popup" style="width:500px;height:500px;background-color: lightskyblue">
                <h2>Edit Items</h2> 
                <%
                String item=request.getParameter("ch");
                DBConnection db=new DBConnection();
                Connection con=db.getConn();
                PreparedStatement ps=con.prepareStatement("select name,price,sdesc,ldesc from items where id="+item);
                ResultSet rs=ps.executeQuery();
                session.setAttribute("item", item);
                String name1="",price="",sdesc="",ldesc="";
                if(rs.next()){
                    name1=rs.getString(1);
                    price=rs.getString(2);
                    sdesc=rs.getString(3);
                    ldesc=rs.getString(4);
                }
                %>
                <img src="displayLogo.jsp?id=<%=item%>"  style='float: right;clear: both' width="100px" height="100px" onError="this.src='images/no_logo.jpg';">
                <form name="php1" action="#" target="a" method="post" enctype="multipart/form-data">   
                Do_you_want_Change_to_Logo:
                                <input type="file" name="file"/>
                                <input type="submit" value="save" onclick="sbe()"/>
                </form>
                <form name='edititem' action="EditItem" id='frm'>
                    
                    <table>
                            
                        <tr style="height: 30px">
                            <td>Item Name:</td>
                            
                            <td>
                                <input type="hidden" name="img" value="no">
                                <input type="text" name='name' class="text" value="<%=name1%>"/></td>
                        </tr>
                        <tr>
                            <td>Price:</td>
                            <td><input type="text" name='price' class='text' value="<%=price%>"/></td>
                        </tr>
                        <tr>
                            <td>Short Description:</td>
                            <td><input type="text" name='sdes' class='text' value='<%=sdesc%>'/></td>
                        </tr>
                        <tr>
                            <td>Long Description:</td>
                            <td><input type="text" name='ldes' class='text' value="<%=ldesc%>"/></td>
                        
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" class="btn" value="Edit"/></td>
                        </tr>
                    </table>
                
                
                </form>
                <a class="close" href="#close"></a>
                
            </div>
                
                <!---------------------End of popups------------------------->
                
    </body>
</html>