<%-- 
    Document   : BillDesk
    Created on : Nov 27, 2013, 3:22:56 PM
    Author     : admin
--%>

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
              <script src="js/jquery.js"></script>
<script src="js/getData.js"></script>
        <style>
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


 function edititems(id,Qt){
    var Qt=prompt("Enter new quantity",Qt)
    if(Qt!=null){
        window.location.href="editTPrice.jsp?id="+id+"&price="+Qt;
    }
                }
    
    
    
    
    
    
    $(document).ready(function (){
                   $('#blink').animate({
        opacity: '0'
    },6000);
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


function neworder()

{
var x;

var person = prompt("Please enter table number","");
  
  window.location.href="BillDesk.jsp?id="+person;
  
  
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
   <body background="images/bg2.png">
     <%
            String name=(String)session.getAttribute("name");
           
           
        String msg1=request.getParameter("msg");
        
         %>
           
          
       
         <div id="circles"></div>
            
            <script>loadContent()</script>
            
          
<!---->
<form name="bill" action="FinishTransaction">
        <fieldset style="height:700">
     



        <div style="background: url(images/top.png);width: 100%;height: 100px;margin-top: -20px">
            <br>
            <img src="images/Dg.png">
        </div>
<table    style="background: url(images/tabb.png);width: 100%;height: 1px;margin-top: -40px">
             <tr>
              <%
        
              String msg=request.getParameter("mag");
              String activeid=request.getParameter("id");
               session.setAttribute("name", activeid);
               
                Orders o=new Orders();
                int c1=o.getNotification();
           
                %>

                 <td style="width:8%;font-size: 14px;text-align: center"><b>
                        <font COLOR=white><a href="BillDesk.jsp" Style="color:white">BillDesk</a></font>
                            <div class="notification-container">
<!--    <i class="icon-globe"></i>-->
    <%if(c1!=0){%>
    <span class="notification-counter"><a href="#join_form"><%=c1%></a></span><%}%>
</div>
</b></td>
 <td style="width:8%;background: url(images/sbt.png);font-size: 14px;text-align: center"><b>
                        <FONT COLOR=white><a href="ManageReport.jsp" Style="color:black">Manage Report</a>
                    </FONT></b></td>

                 <td style="width:8%;font-size: 14px;text-align: center"><b>
                        <FONT COLOR=white><a href="KichenDisplay.jsp" Style="color:white">Kichen Display</a>
                    </FONT></b></td>
                  <td style="width:10%;font-size: 14px"><b><FONT COLOR=WHITE><a href="WaiterDisplay.jsp" Style="color:white">Waiter Display</a></FONT></b></td>
                  <td style="width:6%;font-size: 14px"><b><FONT COLOR=WHITE><a href="menu.jsp" Style="color:white">Menu</a></FONT></b></td>
                   <td style="width:8%;font-size: 14px"><b><FONT COLOR=WHITE><a href="transactions" Style="color:white">Transaction</a></FONT></b></td>
                    <td style="width:7%;font-size: 14px"><b><FONT COLOR=WHITE><a href="GetMenu.jsp" Style="color:white">Sync</a></FONT></b></td>
                     <td><b><FONT COLOR=WHITE><a href="Contact.jsp" Style="color:white;font-size: 15px">Contact Us</a></FONT></b></td>
                     <td><b><FONT COLOR=WHITE><a href="Reports.jsp" Style="color:white;font-size: 15px">Reports</a></FONT></b></td>
                      <td><b><FONT COLOR=WHITE><a href="Accounts.jsp" Style="color:white;font-size: 15px">Accounts</a></FONT></b></td>
            </tr>
        </table><br>
        <table border="0">
            <tr>
                <td width="200" valign="top">


           <div style="margin-bottom: 20px">
                Tables  &nbsp; &nbsp;  &nbsp;  <a  href="#" onclick="myFunction('<%=activeid%>')">Change the Table</a><br>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;
               &nbsp;<a href="#" onclick="neworder()">Create new Order</a>
                
                   
        </div>
                <%
                if(msg1!=null)
                {
%>
               <div  id="blink">
                    
                   <h4 style="color:red;  margin-left: 10px">  <%=msg1%> </h4>
                    
                </div>
<%}%>
        
        <div style="margin-left: 1px;background-image: url(images/tab.png);width: 350px;">
            <table style="margin-left: 15px">
<%
    
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
            link="managereport.jsp?id="+id;
            }
            if(activeid.equals(id)){
                color="red";
                img="images/red.png";
                }
        %><td > <a href="<%=link%>" style="text-decoration: none;">
            <div style="background:url(<%=img%>)" id="circl">
                
                
                <p style="width:40px;height: 1px;font-weight: bolder;text-align: center;margin-top: 15px;">
                <div style='margin-left: 25px;margin-top: 17px'><%=id%></div>
                    </p>
                
                 </div></a>
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
            <div style="color:#fffff;margin-top: 20px" id="print">
                Table <font style="color:red"><%=activeid%> </font>Details
                
               
                
                <div style="overflow-y: auto;height: 250px" class="scrollbar">
    
                   <table border="0" width="600px" style="border-collapse:collapse;border:1px solid blue">
                   <%
                   GetItemsOnTable g=new GetItemsOnTable();
                   ArrayList items=g.getItems(activeid);
                   Iterator it=items.iterator();
                   double total=0;
                    double discount1 =0;
                   session.setAttribute("items", items);
                   while(it.hasNext()){
                       TableItems table=(TableItems)it.next();
                   total+=table.getTotal();
                   %>
                <tr>
                      
                      <td style='border: 1px solid blue'>
                          
                          <input type="checkbox" name="remov" value="<%=table.getId()%>" id="<%=table.getId()%>">
                          <label for="<%=table.getId()%>"><span></span><%=table.getName()%></label>
                          </td>
                      <td style='border: 1px solid blue'><%=table.getPrice()%></td>
                      <!--<td style='border: 1px solid blue'><%=table.getQt()%></td>-->
                       <td style='border: 1px solid blue'><a href="#" onclick="edititems('<%=table.getId()%>','<%=table.getQt()%>')"><%=table.getQt()%></a></td>
                       <td style='border: 1px solid blue'><%=table.getTotal()%></td>
                </tr>
                <%
                   }
                   String v=request.getParameter("value");
                if(v==null)
                    v="0";
                discount1=Double.parseDouble(v); 
                   int subtotal=0,vat=0,sercharge=0,grand=0,tax=0;
                   int discount=(int)discount1;
                subtotal=(int)(total-discount);
                
                String val=getServletContext().getInitParameter("tax");
                Double d=Double.parseDouble(val);
                tax=(int)(subtotal*d)/100;
                val=getServletContext().getInitParameter("charge");
                d=Double.parseDouble(val);
                sercharge=(int)(subtotal*d)/100;
                val=getServletContext().getInitParameter("vat");
                d=Double.parseDouble(val);
                vat=(int)(subtotal*d)/100;
                grand=subtotal+sercharge+tax+vat;
               
              
                %>
            </table>
                </div>
<!--                <a href="additem.jsp"> add item</a><br>
                 <a href="neworder.jsp"> new order</a>-->

            <table  border="0" width="640px" height="220px"
                    style="background: url(images/total.png);background-size:1000px 220px;margin-left: -40px;
                    background-repeat:no-repeat;font-size:15 px;margin-right: 20px">
                

            <tr>
          <td width="70%">
              &nbsp;  &nbsp;  &nbsp;
                &nbsp;  &nbsp;  &nbsp;  &nbsp;
                Grand Total:Rs.<%=grand%></td>

            
            <td >
                <table>
                   
                    <tr>
                        <td>Discount</td>
                        <td>:<%=discount%></td>
                    </tr>
                    <tr>
                        <td>Sub Total</td>
                        <td>:<%=subtotal%></td>
                    </tr>
                    <tr>
                        <td>Service Charges</td>
                        <td>:<%=sercharge%></td>
                    </tr>
                    <tr>
                        <td>Service Tax</td>
                        <td>:<%=tax%></td>
                    </tr>
                    <tr>
                        <td>Vat</td>
                        <td>:<%=vat%></td>
                    </tr>
                    <tr>
                        <td>Grand Total</td>
                        <td>:<%=grand%></td>
                    </tr>
                </table>
                 </td>
</tr>
           </table>

</div>
                    
                    
                    
                    
                    
                    
                    
                    

                </td>

                <td valign="top">   <div style="margin-left: 0px">

           
            <div style="margin-left: 0px;margin-top: 0px">
                <b> Actions</b>
            </div>
            
        </div>
        <div style="margin-left: 0px">
<hr width="100%">
Discounts
        

<fieldset  style="margin-left: 1px;background:lightgrey;border-radius: 8px;" >
<table   style="background:lightgrey">
    <tr>
        <td style="height: 10px">Type:</td></tr>
    <tr><td>
            <p> <input type="radio" group="discount" name="discount" value="per" id="c1">
            <label for="c1"><span></span>%</label>

            </p>
        </td><td>
            <p>
                <input type="radio" group="discount" name="discount" value="amt" id="c2" checked>
            <label for="c2"><span></span>Rs</label>
            </p> </td>
        <td>Value:<input type="text"size="10" name='desc' value="<%=discount%>" > </td>
            </tr>
    <tr>

        <td><input class="btn" type="button" value="Remove Discount" onclick="BillDesk.jsp?id=<%=activeid%>&value=0"
                                       style="width:120px; height:23px;background: #F5F5F5"> </td>
        <td><input type="button" value="Apply" style="background-image: url(images/ButtonBa.png)" onclick="disc('<%=activeid%>','<%=total%>')"/>
            
        </td>
        <td>
        <a href="BillDesk.jsp?id=<%=activeid%>&value=0">
                <input type="button" value="Clear" style="background-image: url(images/ButtonBa.png)">
        </a>
        </td>
        
       
    </tr>
   
   </table>
</fieldset>
 <div style="margin-left: 1px">

     <div style="font-size: 14px">
     Remove Items
     </div>
<fieldset  style="background:lightgrey;border-radius:8px">
<table  style="background:lightgrey">
    <tr>

        <td><a href="javascript:removeitems('<%=activeid%>')"> <input class="btn" type="button" value="Remove Items"
                                       style="width:100px; height:24px;background: #F5F5F5">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
        <td><a href="SaveRemove?id=<%=activeid%>"><input type="button"value="save"style="background-image: url(images/ButtonBa.png)">
                                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
                                                         <td><a href="CancleRemove?id=<%=activeid%>"><input type="button"value="Cancel"style="background-image: url(images/ButtonBa.png)">
                                                                 &nbsp;&nbsp;</a></td>

    </tr>
</table>
</fieldset>

Payment Type
<fieldset bgcolor="lightgray"  style="background: lightgrey;border-radius:8px">
<table width="300px" style="background:lightgrey">
    <tr>
    <input type="hidden" name="total" value="<%=grand%>"/>
    <input type="hidden" name="id" value="<%=activeid%>"/>
    <td><p><input type="radio" name="type" group='type' value="cash" id="c3" checked/>
            <label for="c3"><span></span>cash</label></p>
    </td>
        <td>
            <p>
            <input type="radio" name="type" group='type' value="card" id="c4" />
            <label for="c4"><span></span>DebitCard</label>
        </td>
        
         <td>
            <p>
            <input type="radio" name="type" group='type' value="card1" id="c5" />
            <label for="c5"><span></span>Credit Card</label>
         </td><br>
         
         <input type='checkbox'name="">Sodex:<input type="sodex">
    

    </tr>
</table>
</fieldset><br>
<table>
    <tr>

        <td><a href="VoidBill?id=<%=activeid%>"><input type="button"value="Void"style="background-image: url(images/ButtonBa.png);"/> &nbsp;&nbsp;</a></td>
        <td><input type="button" value="PrintBill"style="background-image: url(images/ButtonBa.png)" onclick="printPage()"></td>
        <td> <a href="UpdateOnMenu.jsp?discount=<%=discount%>&table=<%=activeid%>">
               <input class="btn" type="button" value="Update Bill On Menu"
                                       style="width:140px; height:23px;background: #F5F5F5";color=write>&nbsp;&nbsp;</a> </td>
    </tr>
</table>
 </div><br>

    
    <table>
    <tr>

     
        <td  ><FONT COLOR=WHITE>
                <%if(subtotal>0){%>
                <input class="btn" type="submit" value="Finish Transaction"
                                       style="width:300px;border-radius:10px; height:30px;background: green">
                <%}%>
            </FONT></td>
    </tr>
    
    
    <tr>
        
  </tr>
</table>
            
     
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
 
          <div style="margin-left: 500px;margin-top: -550px">
                 
<form action="add.jsp" method="post">
                    Item Name:
                    <input type="text" name="item" />
                    &nbsp; 
                    Quantity:<input type="text" name="qty" style="width: 50px"/>
                    &nbsp;
                    
                    
                    <input type="submit" value="Add"/>
          </div>       

            </form>
              
    </body>
</html>
