    <%--    
    Document   : BillDesk
    Created on : Nov 27, 2013, 3:22:56 PM
    Author     : admin
--%>

<%@page import="com.util.cp"%>
<%@page import="com.action.accounts.forms.Taxes"%>
<%@page import="com.action.accounts.forms.TaxForm"%>
<%@page import="com.action.accounts.forms.OrdersF"%>
<%@page import="com.action.accounts.forms.Pay"%>
<%@page import="com.action.accounts.Accounts"%>
<%--<%@page import="org.openxmlformats.schemas.wordprocessingml.x2006.main.STShd.Enum.table"%>--%>
<meta http-equiv="Refresh" content="8">
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
        <link rel="stylesheet" type="text/css" href="css/notification.css" >
        <link href="css/modal.css" rel="stylesheet" type="text/css" >
        <link href="style.css" rel="stylesheet" type="text/css" >
        <link href="css/circles.css" rel="stylesheet" type="text/css" >
        <link href="css/radio.css" rel="stylesheet" type="text/css" >
        <link href="css/scroll.css" rel="stylesheet" type="text/css" >
              <script src="js/jquery.js"></script>
<script src="js/getData.js"></script>
<link rel="stylesheet" type="text/css" href="js/style.css" />
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script src="js/jquery.autocomplete.js" type="text/javascript"></script>	
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
              
<script src="js/getData.js"></script>

<!--<style type="text/css">
/*<![CDATA[*/
body {
     background:#ffffff;
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
/*     font-family:arial;
     font-size:16px;*/
     
 }
/*a.goog:hover {
     background:#669;
     color:#99c;
 }*/
/*//]]>*/
</style>-->


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
            $(document).ready(function(){
                $(".place").click(function(){
                    var x=$(this).text();
                    
                    $(this).css('background-color','#5c5a5b');
                    $(this).siblings().css('background-color','#ebe5e5');
                    var url="BillDesk.jsp?plc="+x;
                    sen(url);
                });
                $(".applay").click(function(){
                    var id=$("#iidd").val();
                    
                    var x="BillDesk.jsp?id="+id;
                    $("#dis input[type='text']").each(function(){
                        //alert($(this).val()+" "+$(this).attr('name'));
                        x+="&name="+$(this).attr('name')+"&valu="+$(this).val();
                    });
                    $("#dis select").each(function(){
                        //alert($(this).val()+" "+$(this).attr('name'));
                        x+="&per="+$(this).val();
                    });
                    //alert(x);
                    sen(x);
                });
                $("#typesel").change(function(){
                   var x=$(this).val();
                   var url="BillDesk.jsp?plc="+x;
                   sen(url);
                });
            });
            function sen(u){
                window.location.href=u;
            }
function changeP(id,ty){
    window.location.href="BillDesk.jsp?id="+id+"&plc="+ty;
    
}
function chng(){
  var x=document.getElementsByName("type");
  alert(x);
}

 function edititems(id,price){
    var price=prompt("Enter new Price",price)
    if(price!=null){
        window.location.href="editTPrice.jsp?id="+id+"&price="+price;
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






//          function printPage(id)
//{
//   var html="<html>";
//   html+= document.getElementById(id).innerHTML;
//
//   html+="</html>";
//
//   var printWin = window.open('','','left=0,top=0,width=800,height=500,top=300,left=365,resizable=1,status=0,toolbar=0');
//   printWin.document.write(html);
//   printWin.document.close();
//   printWin.focus();
//   printWin.print();
//   printWin.close();
//}


function printbillsm()
            {
                var printContent1 =document.getElementById("printKot");
                var printContent2 =document.getElementById("printbillsm2");
                
              
                var Win4Print=window.open('', '', 'left=0,top=0,width=800,height=500,top=100,left=365,resizable=1,status=0,toolbar=0');
                Win4Print.document.write(printContent1.innerHTML);
                Win4Print.document.write(printContent2.innerHTML);
                Win4Print.document.close();
                Win4Print.focus();
                Win4Print.print();
                Win4Print.close();
            }
            
            
           function printKot()
            {
                var printContent =document.getElementById("printKot");
              
                var Win4Print=window.open('', '', 'left=0,top=0,width=800,height=500,top=300,left=365,resizable=1,status=0,toolbar=0');
                Win4Print.document.write(printContent.innerHTML);
                Win4Print.document.close();
                Win4Print.focus();
                Win4Print.print();
                Win4Print.close();
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
        <fieldset style="height:700px;">
     


<!--
        <div style="background: url(images/top.png);width: 100%;height: 100px;margin-top: -20px">
            <br>
            <img src="images/Dg.png">
        </div>-->
             <%
        
              String msg=request.getParameter("mag");
              String activeid=request.getParameter("id");
               session.setAttribute("name", activeid);
               String pl =request.getParameter("plc");
              if(pl==null){
                  pl=(String)session.getAttribute("bpt");
                  if(pl==null)
                  pl="Dinning";
              }
              session.setAttribute("bpt",pl);
                Orders o=new Orders();
                //int c1=o.getNotification();
           String nb=request.getParameter("name");
            ArrayList gty=Accounts.getTypes(pl,activeid);
            int size=gty.size();
            String names[]=new String[size], discounts[]=new String[size],per[]=new String[size];
        Iterator iter=gty.iterator();
        int iz=0;
        while(iter.hasNext()){
            String ty=(String)iter.next();
            names[iz]=ty;
            discounts[iz]="0";
            per[iz]="plus";
            iz++;
        }
       
           
           if(nb!=null){
               names=request.getParameterValues("name");
               discounts=request.getParameterValues("valu");
               per=request.getParameterValues("per");
           }
           for(int n=0;n<size;n++){
               System.out.println("Per:"+per[n]);
               if(per[n].equalsIgnoreCase("per")){
                   double amt=Accounts.getAmount(names[n],activeid,pl);
                  
                   discounts[n]=(amt*Double.parseDouble(discounts[n]))/100+"";
               }
           }
                %>
    <%@include file="Header.jsp" %>
    <div style="margin-left: 12px;font-size: 20px;font-weight: bold">
        <table border="1"  style="width:345px;">
            <tr>
<!--            <select name="type" id="typesel">
                <option value="">-select-</option>
                <option value="Dinning">Dinning</option>
                <option value="Take Away">Take Away</option>
                <option value="Parcel">Parcel</option>
            </select>-->
                <%if(pl.equalsIgnoreCase("Dinning")){%>
                <td class="place" align="center" style="background-color:#5c5a5b;color: #ffffff;font-family:myFFont;cursor: pointer;">Dinning</td>
                <%}
                else{
                    %><td class="place" align="center" style="background-color:#ebe5e5;color: #000000;font-family:myFFont;cursor: pointer">Dinning</td>
                <%
                }
                if(pl.equalsIgnoreCase("Take Away")){
                %>
                <td class="place" align="center" style="background-color:#5c5a5b;color: #ffffff;font-family:myFFont;cursor: pointer">Take Away</td>
                <%}else{
                        %>
                <td class="place" align="center" style="background-color:#ebe5e5;color: #000000;font-family:myFFont;cursor: pointer">Take Away</td>
                <%
                        }
                    if(pl.equalsIgnoreCase("Parcel")){%>
                <td class="place" align="center" style="background-color:#5c5a5b;color: #ffffff;cursor: pointer;font-family:myFFont;">Parcel</td>
                <%}else{
                        %>
                        <td class="place" align="center" style="background-color:#ebe5e5;color: #000000;cursor: pointer;font-family:myFFont;">Parcel</td>
                <%
                    }%>
            </tr>
        </table>
    </div>
                    <!--In <font style="color:red"><%=pl%> </font>-->
        <table border="0">
            <tr>
                <td width="200px" valign="top">


<!--           <div style="margin-bottom: 20px">
                Tables  &nbsp; &nbsp;  &nbsp;  <a  href="#" onclick="myFunction('<%=activeid%>')">Change the Table</a><br>
               
                
                   
        </div>-->
                <%
                if(msg1!=null)
                {
%>
               <div  id="blink">
                    
                   <h4 style="color:red;  margin-left: 10px">  <%=msg1%> </h4>
                    
                </div>
<%}%>
        
        <div style="background-image: url(images/tab.png);width: 358px;height: 572px">
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
            link="BillDesk.jsp?id="+id;
            }
            if(activeid.equals(id)){
                color="red";
                img="images/red.png";
                }
        %><td > 
             <font face="Helvetica Rounded LT Std" style="color:black;font-size: 22px; font-family:myFirstFont;">
            <a href="<%=link%>" >
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

                <td >
                    <div style="color:#000000;margin-top: -333px;margin-left: -500px" id="print">
                <font face="Helvetica Rounded LT Std" style="color:black;font-size: 21px; font-family:myFirstFont;">Table&nbsp;<%=activeid%> </font>
                
               
                
                <div style="overflow-y: auto;height: 565px;width: 570px" class="scrollbar" id="printKot" >
    
    <table class="TFtable" border="0" width="550px" style="border-collapse:collapse;border:1px solid #D3D3D3">
        <th style='border: 1px solid #D3D3D3' bgcolor="#585858" style="font-size:15px;"><font style="color: #ffffff;font-family: myFFont">
                    
                    Item name </font></th>
                    <th  style='border: 1px solid #D3D3D3' bgcolor="#585858" width="85px" style="font-size:15px"><font style="color: #ffffff;font-family: myFFont">Unit Price </font></th>
                   <th style='border: 1px solid #D3D3D3' bgcolor="#585858" width="80px" style="font-size:15px"><font style="color: #ffffff;font-family: myFFont">Quantity</font></th>
                   <th style='border: 1px solid #D3D3D3' bgcolor="#585858" width="85px"><font style="color: #ffffff;font-family: myFFont">Total Price</font> </th>
                   <%
                   GetItemsOnTable g=new GetItemsOnTable();
                   ArrayList items=g.getItems(activeid);
                   Iterator it=items.iterator();
                   double total=0;
                    double discount1 =0;
                    Double grnd=0.0,gd=0.0,grand1=0.0,tl=0.0,gdd=0.0;
                    int subtotal=0,vat=0,sercharge=0,grand=0,tax=0;
                   session.setAttribute("items", items);
                   while(it.hasNext()){
                       TableItems table=(TableItems)it.next();
                   total+=table.getTotal();
                   %>
                <tr>
                      
                      <td style='border: 1px solid #D3D3D3'>
                          
<!--                          <input type="checkbox" name="remov" value="<%=table.getId()%>" id="<%=table.getId()%>">-->
                          <label for="<%=table.getId()%>"><span></span><%=table.getName()%></label>
                          </td>
                          <td style='border: 1px solid #D3D3D3' align="center"><%=table.getPrice()%></td>
                      <td style='border: 1px solid #D3D3D3' align="center"><%=table.getQt()%></td>
                      
                       <td style='border: 1px solid #D3D3D3' align="center"><%=table.getTotal()%></td>
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
                <%
                    ArrayList Ord=Accounts.getOrders(activeid,pl);
                    Iterator ii=Ord.iterator();
                    double pre=0;
                    while(ii.hasNext()){
                    OrdersF of=(OrdersF)ii.next();
                        String tname=of.getType();
                        Double taxa=of.getTotal();
                  
                        gd+=taxa;
                        ArrayList<TaxForm> tfl=Accounts.getTax(tname);
                        System.out.println("Tname:"+tname+"\ttax:"+taxa);
                        String formula="";
                        Iterator tfi=tfl.iterator();
                        int xz=0;
                        ArrayList<Taxes> taxes=null;
                            ArrayList tan=null;
                        while(tfi.hasNext()){
                            if(xz==0){
                            taxes=new ArrayList<Taxes>();
                            tan=new ArrayList();
                            }
                            Double subtotal1=taxa;
                            TaxForm tf=(TaxForm)tfi.next();
                            formula=tf.getFormula();
                            String taxname=tf.getType();
                            String ope=tf.getOp();
                            Double value=Double.parseDouble(tf.getVal());
                            String wit=tf.getWit();
                            int ing=0;
                            for(int kl=0;kl<names.length;kl++){
                                if(names[kl].equalsIgnoreCase(tname)){
                                    ing=kl;
                                    break;
                                }
                            }
                            Double disco=Double.parseDouble(discounts[ing]);
                            if(wit.equalsIgnoreCase("sub-discount")){
                                subtotal1-=disco;
                                if(ope.equals("%"))
                                    subtotal1=(subtotal1*value)/100;
                                else if(ope.equals("+"))
                                    subtotal1+=value;
                                else if(ope.equals("*"))
                                    subtotal1*=value;
                             
                                grnd+=subtotal1;
                                taxes.add(new Taxes(taxname,disco,subtotal1));
                                tan.add(taxname);
                            }
                            if(xz==0){
                                
                            }
                            if(!wit.equalsIgnoreCase("subtotal-discount")){
                                int idx=tan.indexOf(wit);
                                Double xa=0.0;
                                
                                        if(idx>-1){
                                                 xa=taxes.get(idx).getSubtotal();
                                        }
                               if(ope.equals("%"))
                                    subtotal1=(xa*value)/100;
                                else if(ope.equals("+"))
                                    subtotal1=xa+value;
                                else if(ope.equals("*"))
                                    subtotal1=xa*value;
                               grnd+=subtotal1;
                               
                               
                            }
                            if(xz!=0){
                                taxes.add(new Taxes(taxname,disco,subtotal1));
                                tan.add(taxname);
                            }
                            //grnd+=subtotal1;
                           // gd+=disco;
                            xz++;
                        }
                        grand1+=grnd;
                        String strs[]=formula.split(";");
                        
                        for(int ik=1;ik<strs.length;ik++){
                            
                            int indx=tan.indexOf(strs[ik]);
                            for(int kk=0;kk<tan.size();kk++){
                                String ss=(String)tan.get(kk);
                                if(ss.equalsIgnoreCase(strs[ik]))
                                {
                                   indx=kk;
                                   break;
                                }
                            }
                            if(indx>-1){
                            Double xa=taxes.get(indx).getSubtotal();
                            System.out.println("XA:"+xa);
                            %>
                            
                            <%
                            tl+=xa;
                            }
                        }
                       
                      %> 
                      <input type="hidden" name="t<%=tname%>" value="<%=tl-pre%>">
                      <input type="hidden" name="n<%=tname%>" value="<%=tname%>">
                      <input type="hidden" name="a<%=tname%>" value="<%=taxa%>">
                <% 
                    pre=tl;
                    }
                   System.out.println("\n\n\n+++"+tl);
                %>
            </table>
                </div></div>
<!--                <a href="additem.jsp"> add item</a><br>
                 <a href="neworder.jsp"> new order</a>-->

<table  id="printbillsm2" style="margin-left: 855px;margin-top: -580px;background:url(images/discbg.png);width: 246px;height: 285px">
              
                
                 <th style="background:url(images/dsh.png);font-size: 22px;color: #ffffff;width: 230;height: 41px"><font style="color: #ffffff;font-family: myFFont;font-size: 22px">
                    <b>
                        Bill Summary
                    </b></font>
                </th>
                
                
                <%
                   for(int i=0;i<discounts.length;i++){
                       gdd+=Double.parseDouble(discounts[i]);
                   }
                %>

                <tr>
                    <td><font style="font-family: mySFont;font-size: 16px">&nbsp;&nbsp;Sub Total &nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=cp.RD(gd)%></font>
<!--                    <hr style="width: 220px;margin-left: 10px;">-->
                    </td>
                    </tr>
                
           
            
            
                   
                    <tr >
                        <td><font style="font-family: myFFont;font-size: 16px">&nbsp;&nbsp;Discount<input type="hidden" name="desc" value="<%=gdd%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=cp.RD(gdd)%></font></td>
                    </tr>
                    
                    <tr>
                        <td>
                            <input type="hidden" name="taxes" value="<%=cp.RD(tl)%>"/>
                            <font style="font-family: myFFont;font-size: 16px">&nbsp;&nbsp;Taxes &nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=cp.RD(tl)%></font></td>
                    </tr>
                    <tr >
                    
                    
                        <td ><hr style="width: 220px;margin-left: 10px;margin-top: 10px;background: #C8C8C8 ">
                                 <font style="font-family: mySFont;font-size: 20px">&nbsp;&nbsp;Grand Total&nbsp;&nbsp;:&nbsp;<%=cp.RD(gd+tl-gdd)%></font></td>
                    </tr>
                
                     

           </table>

</td>
            </tr>
        </table>
                    
                    
                

                <td valign="top">  
                    <div style="margin-left: 0px">

           
<!--            <div style="margin-left: 0px;margin-top: 0px">
                <b> Actions</b>
            </div>-->
            
        </div>
        <div style="margin-left: 0px">
<!--<hr width="100%">-->

        

<fieldset  style="margin-left: 960px;margin-top: -580px" >
    
    <table id="dis" style="background:url(images/discbg.png);width: 246px;height: 285px ">
 
                <th style="background:url(images/dsh.png);color: #ffffff;width: 25px;height: 41px "><font style="color: #ffffff;font-family: myFFont;font-size: 22px">
                        <b> Discounts</b></font>
                     </th>  
    
    
<!--<table   style="background:lightgrey" id="dis">-->
<!--    <tr>
        <td style="height: 10px">Type:</td>
    </tr>-->
    <%
        ArrayList ll=Accounts.getTypes(pl,activeid);
        ii=ll.iterator();
        int xc=0;
        while(ii.hasNext()){
            String ty=(String)ii.next();
        %>
        <tr><font style="color: #ffffff;font-family: myFFont;font-size: 22px">
        
        <!--<td><%=ty%></td>-->
        <td >&nbsp;&nbsp;<%=ty%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <input type="text" name="<%=ty%>" value="<%=discounts[xc]%>" size="6">
        <select name="s<%=ty%>">
            <option value="plus">Rs.</option>    
            <option value="per">%</option>
                
            </select></td>
            </font>
    </tr>
    
    <%
    xc++;
        }
    %>
    
    <tr valign="" >
<%if(subtotal>0){%>
        <td align="center">
            <font style="color: #ffffff;font-family: myFFont;font-size: 20px">
            <input class="applay" type="button" value="Apply" style="background-image: url(images/applybtn.png);font-size: 20px;width:210px;font-family: myFFont" onclick="disc('<%=activeid%>','<%=total%>')"/>
            </font>
        </td>
       
        <%}%>
       
    </tr>
    
   
   </table>
</fieldset>
 <div style="margin-left: 1px">

     



<fieldset style="margin-left: 960px;margin-top: -20px">
    <div style="overflow-x: auto;">
<table  style="background:url(images/discbg.png);width: 246px;height: 285px">
 
    
    
    
    <!--<table style="margin-left: 1230px;margin-top: -581px;background:url(images/discbg.png);width: 246px;height: 285px">-->

         <th style="background:url(images/dsh.png);color: #ffffff;width: 25px;height: 41px"><font style="color: #ffffff;font-family: myFFont;font-size: 22px">
             <b>  
Payment Type  
             </b></font>
         </th>
    
    
    
    
    
    
    <input type="hidden" name="total" value="<%=Math.ceil(gd+tl-gdd-0.5)%>"/>
    <input type="hidden" name="id" value="<%=activeid%>" id="iidd"/>
    <%
        ArrayList<Pay> l=Accounts.payments();
        Iterator itrr=l.iterator();
        while(itrr.hasNext()){
            Pay p=(Pay)itrr.next();
            String pname=p.getName();
            String ptype=p.getType();
            if(ptype.equalsIgnoreCase("radio")){
    %>
    <tr>
        <%if(subtotal>0){%>
    <td>
        <p>&nbsp;&nbsp;<input type='checkbox' name="type" value='<%=pname%>' id='<%=pname%>'/>
            <label for="<%=pname%>"><span></span><%=pname%></label></p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="<%=pname%>"/>
        
    </td>
    <%}%>
    </tr>
       <%
        }
        }
       %>  

   
</table>
    </div>
</fieldset><br>
<table style="margin-left: 1218px;margin-top: -300px">
    
    <tr>
        <td>
            <font style="color: #ffffff;font-family: myFFont;font-size: 20px"><input type="button" value="PrintBill"style="background-image: url(images/prtbtn.png);font-family: myFFont;color: #ffffff;font-size: 20px;width:243px; height:43px;" onclick="printbillsm();"></font></td>
      </tr>
      <tr></tr><tr></tr><tr></tr><tr>  <td> <font style="color: #ffffff;font-family: myFFont;font-size: 20px"><a href="javascript:printKot()">
               <input class="btn" type="button" value="Print KOT"
                                       style="background-image: url(images/prtbtn.png);font-family: myFFont;color: #ffffff;font-size: 20px;width:243px; height:43px;">&nbsp;&nbsp;</a></font></td>
    </tr><tr></tr><tr></tr><tr></tr>
    
    
 <!--    <tr>
        <td>
            <font style="color: #ffffff;font-family: myFFont;font-size: 20px"><input type="button" value="PrintBill"style="background-image: url(images/prtbtn.png);font-family: myFFont;color: #ffffff;font-size: 20px;width:243px; height:43px;" onclick="printPage()"></font></td>
      </tr>
   <tr></tr><tr></tr><tr></tr><tr>  <td> <font style="color: #ffffff;font-family: myFFont;font-size: 20px"><a href="javascript:printKot()">
               <input class="btn" type="button" value="Print KOT"
                                       style="background-image: url(images/prtbtn.png);font-family: myFFont;color: #ffffff;font-size: 20px;width:243px; height:43px;">&nbsp;&nbsp;</a></font></td>
    </tr><tr></tr><tr></tr><tr></tr>-->
    
    
    
    
    
    <tr>

        <td>
            <font style="color: #ffffff;font-family: myFFont;font-size: 20px">
                
            <a href="VoidBill?id=<%=activeid%>"><input type="button"value="Void"style="background-image: url(images/void.png);font-family: myFFont;color: #ffffff;font-size: 20px;width:243px; height:43px;"/> &nbsp;&nbsp;</a>
            </font></td>
    </tr>
</table>
 </div><br>

    
 <table style="margin-left: 1218px;">
    <tr>

     
        <td  ><font style="color: #ffffff;font-family: myFFont;font-size: 20px">
                
                <%if(subtotal>0){%>
                <input class="btn" type="submit" value="Finish Transaction"
                                       style="width: 243px; height:43px;background: url(images/fnsbtn.png);font-family: myFFont;color: #ffffff;font-size: 20px;">
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
                           
                        session.setAttribute("tableid", tb );
                       %>
                       <font color="white">Table <%=tb %> is checked out<br></font>
                          
                            
            <%
                       }
            %>
            <a class="close" href="#close"></a>
      
        </div>
 
 
              
    </body>
</html>
