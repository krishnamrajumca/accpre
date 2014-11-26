<%-- 
    Document   : BillDesk
    Created on : Nov 27, 2013, 3:22:56 PM
    Author     : admin
--%>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=getServletContext().getInitParameter("name")%></title>
        <link rel="stylesheet" type="text/css" href="css/notification.css" />
        <link href="css/modal.css" rel="stylesheet" type="text/css" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link href="css/circles.css" rel="stylesheet" type="text/css" />
        <link href="css/radio.css" rel="stylesheet" type="text/css" />
        <link href="css/scroll.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery.js" type="text/javascript"></script>
              <script src="js/getData.js" type="text/javascript"></script>
              <link rel="stylesheet" type="text/css" href="js/style.css" />
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script src="js/jquery.autocomplete.js" type="text/javascript"></script>	
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
        #button1 {
  background: url("images/gb.png") no-repeat;
  cursor:pointer;
  width:100px; height:0px;
  }
  .place{cursor: pointer}
  #ot{cursor: pointer}
     
            #circl{
                width: 60px;
                height: 60px;
                background:gray;
                -moz-border-radius: 500px;
                -webkit-border-radius: 500px;
                
                
            }
            a{
                text-decoration: none;
            }
 
        </style>
        <script type="text/javascript">


 function edititems(id,price){
    var price=prompt("Enter the quantity you want to change","");
    if(price!=null){
        window.location.href="editTPrice.jsp?id="+id+"&price="+price;
    }
                }
    
    
    
    
    function sen(u){
        window.location.href=u;
    }
    
    $(document).ready(function (){
        $(".place").click(function(){
                    var x=$(this).text();
                    
                    $(this).css('background-color','gray');
                    $(this).siblings().css('background-color','black');
                    var url="OrderManagement.jsp?plc="+x;
                    sen(url);
                });
                   $('#blink').animate({
        opacity: '0'
    },6000);
    $("#sf").keyup(function(){
                  //alert("k");
                    $("#sf").autocomplete("List.jsp");
                    //alert("k");
                });
            });


function myFunction(id)
{
var x;

var person = prompt("Please enter table number",id);
if (person!=null)
  {
  window.location.href="ChangeTable.jsp?p="+id+"&c="+person;
  
  }
}
function changeP(id,ty){
    window.location.href="OrderManagement.jsp?id="+id+"&plc="+ty;
    
}

function neworder()

{
var x;

var person = prompt("Please enter table number","");
  
  window.location.href="OrderManagement.jsp?id="+person;
  
  
}




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
            function dele(id){
                var c=confirm("Do You want to Delete");
                if(c)
                    window.location.href="deleteOrder.jsp?id="+id;
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
   <body background="#f0f0f0">
     <%
            String name=(String)session.getAttribute("name");
           
           
        String msg1=request.getParameter("msg");
        
         %>
           
          
       
         <div id="circles"></div>
            
            <script>loadContent()</script>
            
          
<!---->
<form name="bill" action="FinishTransaction">
        <fieldset style="height:700">
     



<!--        <div style="background: url(images/top.png);width: 100%;height: 100px;margin-top: -20px">
            <br>
            <img src="images/Dg.png">
        </div>-->
             <%
        
              String msg=request.getParameter("mag");
              String activeid=request.getParameter("id");
              if(activeid==null){
                  activeid=(String)session.getAttribute("active");
                  if(activeid==null)
                      activeid="0";
              }
              String pl =request.getParameter("plc");
              if(pl==null){
                  pl=(String)session.getAttribute("opt");
                  if(pl==null)
                  pl="Dinning";
              }
              session.setAttribute("opt",pl);
               session.setAttribute("active", activeid);
               session.setAttribute("name", activeid);
                Orders o=new Orders();
                //int c1=o.getNotification();
           
                %>
    <%@include file="Header.jsp" %>
    <div style="margin-left: 12px;font-size: 20px;font-weight: bold">
        <table border="1"  style="width:345px;">
            <tr>
                <%if(pl.equalsIgnoreCase("Dinning")){%>
                <td class="place" style="background-color:#5c5a5b;color: #ffffff;font-family:myFFont;cursor: pointer;">Dinning</td>
                <%}
                else{
                    %><td class="place" style="background-color:#ebe5e5;color: #000000;font-family:myFFont;cursor: pointer">Dinning</td>
                <%
                }
                if(pl.equalsIgnoreCase("Take Away")){
                %>
                <td class="place" style="background-color:#5c5a5b;color: #ffffff;font-family:myFFont;cursor: pointer;">Take Away</td>
                <%}else{
                        %>
                <td class="place" style="background-color:#ebe5e5;color: #000000;font-family:myFFont;cursor: pointer">Take Away</td>
                <%
                        }
                    if(pl.equalsIgnoreCase("Parcel")){%>
                <td class="place" style="background-color:#5c5a5b;color: #ffffff;font-family:myFFont;cursor: pointer;">Parcel</td>
                <%}else{
                        %>
                        <td class="place" style="background-color:#ebe5e5;color: #000000;font-family:myFFont;cursor: pointer">Parcel</td>
                <%
                    }%>
            </tr>
        </table>
    </div>
                    <!--In <font style="color:red"><%=pl%> </font>-->
        <table border="0">
            <tr>
                <td width="200px" valign="top">


           <div style="margin-bottom: 10px;margin-top: 5px;">
               &nbsp; &nbsp;  &nbsp;  <a  href="#" onclick="myFunction('<%=activeid%>')"><font style="color: #32CD32;font-family:myFirstFont;cursor: pointer">Change the Table</font></a>
               &nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;
               &nbsp;<a href="#" onclick="neworder()"><font style="color: #32CD32;font-family:myFirstFont;cursor: pointer">Create new Order</font></a>
                
                   
        </div>
                <%
                if(msg1!=null)
                {
%>
               <div  id="blink">
                    
                   <h4 style="color:red;  margin-left: 10px">  <%=msg1%> </h4>
                    
                </div>
<%}%>
        
        <div style="margin-left: 1px;background-image: url(images/tab.png);width: 358px;height: 572px">
            <table style="margin-left: 15px">
<%
    
    if(activeid==null)
        activeid="0";
    Tables t=new Tables();
    ArrayList list=t.getTables(pl);
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
            link="OrderManagement.jsp?id="+id;
            }
            if(activeid.equals(id)){
                color="red";
                img="images/red.png";
                }
        %><td >
            <font face="Helvetica Rounded LT Std" style="color:black;font-size: 22px; font-family:myFirstFont;">
            <a href="<%=link%>">
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

                </td>

                <td>
            <div style="color:#fffff;margin-top: -15px" id="print">
                <font style="color: #000000;font-family:myFirstFont;font-size: 22px">Table&nbsp;<%=activeid%> </font>
                
                
                
                <div style="overflow-y: auto;height: 550px" class="scrollbar">
    
   <table class="TFtable"id="customers"border="0" width="600px" style="border-collapse:collapse;border:1px solid #D3D3D3">
       
       <th style='border: 1px solid #D3D3D3'  bgcolor="575857"style="font-size:15px"><font style="color: #ffffff;font-family: myFFont"><input type="checkbox" value="All" name="remov" style='display:none'/>
                    Item name </font></th>
                    <th  style='border: 1px solid #D3D3D3' width="95px" bgcolor="575857" style="font-size:15px"><font style="color: #ffffff;font-family: myFFont">Unit Price </font></th>
                   <th style='border: 1px solid #D3D3D3' width="95px" bgcolor="575857" style="font-size:15px"><font style="color: #ffffff;font-family: myFFont">Quantity</font></th>
                   <th style='border: 1px solid #D3D3D3' width="90px" bgcolor="575857"><font style="color: #ffffff;font-family: myFFont">Total Price </font></th>
                   <%
                   GetItemsOnTable g=new GetItemsOnTable();
                   ArrayList items=g.getItems(activeid);
                   Iterator it=items.iterator();
                   double total=0;
                    double discount1 =0;
                    int subtotal=0,vat=0,sercharge=0,grand=0,tax=0;
                   session.setAttribute("items", items);
                   while(it.hasNext()){
                       TableItems table=(TableItems)it.next();
                   total+=table.getTotal();
                   %>
                <tr class="alt">
                   
                      <td style='border: 1px solid #D3D3D3'>
                          
                          <!--<input type="checkbox" name="remov" value="<%=table.getId()%>" id="<%=table.getId()%>">-->
                          <a href="javascript:dele('<%=table.getId()%>')">X</a>&nbsp;&nbsp;
                          <label for="<%=table.getId()%>"><span></span><%=table.getName()%></label>
                          </td>
                      <td style='border: 1px solid #D3D3D3'><%=table.getPrice()%></td>
                      <td style='border: 1px solid #D3D3D3'><%=table.getQt()%>&nbsp;&nbsp;
                          <a href="#" onclick="edititems('<%=table.getId()%>','<%=table.getTotal()%>')"><img src="images/edit.jpeg" width="20px" height="20px" title="Edit"/></a>
                      </td>
                      
                       <td style='border: 1px solid #D3D3D3'><%=table.getTotal()%></td>
                </tr>
                <%
                ArrayList<Double> li=Accounts.getTaxAmount(table.getName());
                
                vat+=(li.get(0)*table.getPrice())/100;
                tax+=(li.get(1)*table.getPrice())/100;
                   }
                   String v=request.getParameter("value");
                if(v==null)
                    v="0";
                discount1=Double.parseDouble(v); 
                   
                   int discount=(int)discount1;
                subtotal=(int)(total-discount);
                
//                String val=getServletContext().getInitParameter("tax");
//                Double d=Double.parseDouble(val);
//                tax=(int)(subtotal*d)/100;
//                val=getServletContext().getInitParameter("charge");
//                d=Double.parseDouble(val);
//                sercharge=(int)(subtotal*d)/100;
//                val=getServletContext().getInitParameter("vat");
//                d=Double.parseDouble(val);
//                vat=(int)(subtotal*d)/100;
                grand=subtotal+sercharge+tax+vat;
               
              
                %>
            </table>
                </div>
<!--                <a href="additem.jsp"> add item</a><br>
                 <a href="neworder.jsp"> new order</a>-->

<!--            <table  border="0" width="640px" height="220px"
                    style="background: url(images/total.png);background-size:1000px 220px;margin-left: -40px;
                    background-repeat:no-repeat;font-size:15 px;margin-right: 20px">
     
           </table>-->

</div>
                    
                    
                    
                    
                    
                    
                    
                    

                </td>

                <td valign="top">   <div style="margin-left: 0px">

            
        </div>
     
    </table>
        </fieldset>
      </form>
            
            
            
            
            
            
            
              <a href="#x" class="overlay" id="join_form"></a>
        <div class="popup" style="width:200px;height: 300px;background-color: slateblue">
            <h4 style="color:white">Checked out Tables</h4>
            <%
                       ArrayList lst=o.getCheckedOut();
                       Iterator it1=lst.iterator();
                       while(it1.hasNext()){
                           String tb=(String)it1.next();
                       %>
                       <font color="white">Table <%=tb%> is checked out</font>
            <%
                       }
            %>
            <a class="close" href="#close"></a>
      
        </div>
 
          <div style="margin-left: 500px;margin-top: -625px">
           <%if(activeid!="0"){%>      
<form action="add.jsp" method="post">
                    Item Name:
                    <input type="hidden" name="type" value="<%=pl%>" >
                    <input type="text" name="item" id="sf">
                    &nbsp; 
                    Quantity:<input type="text" name="qty" style="width: 50px">
                    &nbsp;
                    
                    
                    <input type="submit" value="Add"/>
              

            </form>
                    <%}%>
         </div>        
    </body>
</html>
