<%-- 
    Document   : Accounts
    Created on : Apr 26, 2014, 2:50:15 PM
    Author     : Rao
--%>

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
            
            function create(){
                document.forms['frm'].submit();
            }
            $(document).ready(function(){
                
                $("#AddRow").click(function(){
//                    var i=$("#table tr").length;//alert(i);
                    //
//                    $('.row').appendTo('#table');
                    $('#table tr').last().after("<tr><td><input type='text' name='name'>\n\
                                        </td><td>=</td><td><input type='text' name='val' >\n\
                                        </td><td>\n\
                                        <select name='op'><option value='%'>%</option>\n\
                                         <option value='*'>*</option>\n\
                                            <option value='+'>+</option>\n\
                                        </select>\n\
                                        </td><td><select name='wit' class='sel'>\n\
                                            <option value='sub-discount'>Sub-discount</option>\n\
                                        </select>\n\
                                        </td></tr>\n\
");
 
$('input[name="name"]' ).each(function() {
    
    var x=$(this).val();  
    if(x!="")
     $(".sel").append('<option value='+x+'>'+x+'</option>');

    
});

                });
                var i=0;
                $(".plus").click(function(){
                    i++;
                    
                    if(i==1){
                    $(".plus1").append('<td><select name="add" id="add"></select></td>');
                    $('input[name="name"]' ).each(function() {
    
    var x=$(this).val();  
    if(x!="")
     $("#add").append('<option value='+x+'>'+x+'</option>');
   
    
});}
                });
                $(".plu").click(function(){
                    var s=$("#add").val();
                    var s1=$("#selt").val();
                    var x=s1+"+"+s;
                    var v=s1+";"+s
                    $("#selt").empty();
                    $("#selt").append('<option value='+v+'>'+x+'</option>');
                    $(".field").append('  +  '+s);
                });
               
            });
        </script>
        
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
        
<%
                Orders o=new Orders();
                int c1=o.getNotification();
                %>

    <%@include file="Header.jsp" %>
        
        
        
        
        
        
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
                    <td> <a href="tableacc.jsp" style="text-decoration: none;color: black;background-color: green"><font style="color: #ffffff;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Table Accounts&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td><a href="taxsettings.jsp" style="text-decoration: none;color: black"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Tax Settings&nbsp;&nbsp;&nbsp;</a> </td>
                </tr>
                 <tr>
                    <td><a href="paymenttype.jsp" style="text-decoration: none;color: black;"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Payment Types&nbsp;&nbsp;&nbsp;</a> </td>
                </tr>
            
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;
            
            
        </div>
       
            <form name='frm' action="CreateTax" method="get">
        <div style="margin-left: 300px;margin-top: -200px;font-family: myFirstFont">
            <fieldset>
            <h2> Create Tax Settings</h2>
            
       
           
            <table>
                <tr>
                    <td  style="font-size: 30px" >Tax Setting Name<input type="text"name="tax"></td>
                    <td style="font-size: 30px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                        
                        Comments<input type="text"name="com"></td>
                </tr>
            </table>
            <h2>Define Taxes</h2>
           
            <fieldset style="border-radius: 8px">
            <table id="table">
                <tr>
                    <td></td>
                    <td></td><td></td>
                    <td style="background-color: gray"><a href="javascript:void(0)" id="AddRow">Add</a></td>
                    <td>
                            <a href="javascript:void(0)"><div class="plus" style="width:100px;font-size: 20px;color:red;background-color: gray;text-align: center">
                                 Save
                            </div></a></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td></td>
                    <td>value</td>
                </tr>
                <tr class="row">
                    <td><input type="text" name="name"></td>
                    <td>=</td>
                    <td><input type="text"name="val" ></td>
                    <td>
                        <select name='op'>
                            <option value="%">%</option>
                            <option value="*">*</option>
                            <option value="+">+</option>
 
                        </select>
                    </td>
                    <td>
                        <select name="wit" class="sel">
                            <option value="sub-discount">Sub-discount</option>
 
                        </select>
                    </td>
                    
                </tr>
           </table>
                
                
                
            </fieldset>
           
        <h2>Grand Total Formula</h2>
           
            <fieldset style="border-radius: 8px">
            <table width="100%" border="0">
                <tr class="plus1">
                     <td width="10%">Grand Total=</td>
                     <td width="80%" class="field">
                       Sub-discount
                    
                    </td>
                </tr><tr>
                    <td > <select id="selt" name="formula"  style="display:none">
  <option value="sub-discount">Sub-discount</option>
 
                        </select>
                        


                            <a href="javascript:void(0)"><div class="plu" style="width:50px;font-size: 20px;color:red;background-color: gray;text-align: center">
                                 Add
                            </div></a></td>


                </tr>
                </table>
                     
               </fieldset>
        
        <br>
        
        <b style="border-radius:10px; height:30px;background: gray;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;
                 <a href="javascript:create()"style="text-decoration: none"> Create </a>&nbsp;&nbsp;&nbsp;</b> 
                 
        &nbsp;  &nbsp;  &nbsp;  &nbsp;  
          
        
         <b style="border-radius:10px; height:30px;background: gray;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;
                 <a href="taxsettings.jsp"style="text-decoration: none"> Cancel </a>&nbsp;&nbsp;&nbsp;</b> 
            </div>
            </form>
         </fieldset>
        </fieldset>        
       
    </body>
</html>
