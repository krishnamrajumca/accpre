<%-- 
    Document   : Accounts
    Created on : Apr 26, 2014, 2:50:15 PM
    Author     : Rao
--%>

<%@page import="com.action.accounts.forms.TaxForm"%>
<%@page import="com.action.accounts.Accounts"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
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
        <script src="js/jquery.js"></script>
        
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
        
        <script type="text/javascript">
            function create(){
                document.forms['frm'].submit();
                
            }
            $(document).ready(function(){
                var i=0;
                $(".add").click(function(){
            

                    $('#table tr').last().after("<tr><td><input type='checkbox' name='ch' id='"+i+"'>\n\
                         <label for='"+i+"'><span></span></label>\n\
                     </td><td><input type='text' name='type'>\n\
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
 
$('input[name="type"]' ).each(function() {
    
    var x=$(this).val();  
    
    if(x!="")
     $(".sel").append('<option value='+x+'>'+x+'</option>');

    
});
i++;
                });
                $(".remove").click(function(){
                   
                    $('input[name="ch"]').each(function(){
                        var x=$(this).is(':checked');
                   
                        if(x){
                            var t=$(".field").text();
                            var tx=$(this).closest('tr').find('input[name="type"]').val();
                      
                            t=t.replace("+"+tx,"");
                           
                            var v=t.replace("+",";");
                            $("#selt").empty();
                            $("#selt").append('<option value='+v+'>'+t+'</option>');
                            $(".field").html(t);
                        $(this).closest('tr').remove();
                    }
                    
                    });
                });
                var j=0;
                $(".save").click(function(){
                    j++;
                  
                    if(j==1){
                    $(".plus1").append('<td><select name="add" id="add"></select></td>');
                    $('input[name="type"]' ).each(function() {
    
    var x=$(this).val();  
    if(x!="")
     $("#add").append('<option value='+x+'>'+x+'</option>');
   
    
});}
                });
                $(".addf").click(function(){
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
        <style>
            .add,.remove,.save,.addf{
                
                cursor: pointer;
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
        
      
            <%@include file="Header.jsp" %>
         
        
        
<!--        <div>
            <h1><a href="BillDesk.jsp" style="margin-left: 300px">Home</a>>>Accounts</h1>
        </div>-->
        
        
        
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
                    <td> <a href="tableacc.jsp" style="text-decoration: none;color: black;"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Table Accounts&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td><a href="taxsettings.jsp" style="text-decoration: none;color: black;background-color: green"><font style="color: #ffffff;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Tax Settings&nbsp;&nbsp;&nbsp;</a> </td>
                </tr>
                 <tr>
                    <td><a href="paymenttype.jsp" style="text-decoration: none;color: black;"><font style="color: #000000;font-family: myFFont;font-size: 20px">&nbsp;&nbsp;&nbsp;Payment Types&nbsp;&nbsp;&nbsp;</a> </td>
                </tr>
            
            </table>
            &nbsp;&nbsp;&nbsp;&nbsp;
            
            
        </div>
            <form name="frm" action="EditTax" method="post">
            <%
                String name=request.getParameter("id");
           String comment=request.getParameter("id");
           ArrayList list=Accounts.getTax(name);
                   Iterator itr=list.iterator();
                  
            %>
        <div style="margin-left: 300px;margin-top: -270px">
            <fieldset>
            <!--<h1> Create Tax Settings</h1>-->
            <b style="font-family: myFirstFont;margin-left: 255px;font-size: 30px">Create Tax Settings</b>
                <br>
                <br>
       
           
            <table>
                <tr>
                    <td  style="font-family: myFirstFont;font-size: 20px" >Tax Setting Name<input type="text"name="tax" value="<%=name%>"></td>
                    <td style="font-family: myFirstFont;font-size: 20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="hidden" name="otax" value="<%=name%>"/> 
                        <input type="hidden" name="ocom" value="<%=comment%>"/>
                        
                        Comments<input type="text"name="com" value="<%=comment%>"></td>
                </tr>
            </table>
            <!--<h1>Define Taxes</h1>-->
           <br>
 <b style="font-family: myFirstFont;margin-left: 320px;font-size: 30px">Define Taxes</b>
                <br>
            
            <fieldset style="border-radius: 8px;font-family: myFirstFont">
            <table  id="table">
                <tr>
                    <td>Name</td>
                    <td></td>
                   
                      
                     <td>value</td>
                </tr>
    <!--                <tr>
                        <td class="add" style="background: #d0d0d0">Add</td>
                         <td class="remove" style="background: #d0d0d0">Remove</td>
                         <td class="save" style="background: #d0d0d0">Save</td>
                     </tr>-->
                <%
                String formula="",f1="";
                    while(itr.hasNext()){
                    TaxForm tf=(TaxForm)itr.next();
                    f1=tf.getFormula();
                    formula=tf.getFormula().replace(";", "+");
                %>
                 <tr>
               
                     <td><input type="checkbox" name="ch"  id="<%=tf.getType()%>">
                         <label for="<%=tf.getType()%>"><span></span></label>
                     </td><td>
                         <input type="text" name="type" value="<%=tf.getType()%>">
                     <!--<input type="text"name="otype"value="<%=tf.getType()%>">-->
                     </td>
                    <td>=</td>
                    <td><input type="text" name="val" value="<%=tf.getVal()%>"></td>
                    <td> <select name="op">
                            
                            
  <option value="%">%</option>
  <option value="*">*</option>
  <option value="+">+</option>
 
</select>
                    </td>
                    <td> <select name="wit" class="sel">
  <option value="sub-discount">Sub-discount</option>
 
</select></td>





                </tr>
               
               <%}%>
              
       </table>
                
                 <div>
                     <table style="margin-left: 300px">
                         <tr style="margin-left: 100px">
               
                             <td class="add" style="background: #d0d0d0;width: 50px;padding-left: 15px">Add</td><td></td><td></td>
                     <td class="remove" style="background: #d0d0d0;width: 80px;padding-left: 15px">Remove</td><td></td><td></td>
                     <td class="save" style="background: #d0d0d0;width: 50px;padding-left: 15px">Save</td>
                     </tr>
                     </table></div>
                
            </fieldset>
           
        <!--<h1>Grand Total Formula</h1>-->
         <br>
 <b style="font-family: myFirstFont;margin-left: 280px;font-size: 30px">Grand Total Formula</b>
                <br>
            <div class="addf" style="font-family: myFirstFont;background: #d0d0d0;width: 50px;padding-left: 15px;margin-left: 350px">Add</div>
            <fieldset style="border-radius: 8px;font-family: myFirstFont;">
               
            <table>
<!--                <tr>
                    <td class="addf" style="background: #d0d0d0;width: 50px;padding-left: 15px">Add</td>
                   
                </tr>-->
                <tr class="plus1">
                     <td>Grand Total</td>
                    <td>=</td>
                 
                    <td class='field'> <%=formula%>
                    </td><td>
                        <select id='selt' name="formula" style="display:none">
  <option value="<%=f1%>"><%=formula%></option>
 
</select></td>




                </tr>
                </table>
                     
               </fieldset>
        
        <br>
        
        
       
          
        
         <b style="margin-left: 200px;font-family: myFirstFont;border-radius:10px; height:30px;background: #d0d0d0;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;
                 <a href="javascript:create()"style="text-decoration: none"> Save </a>&nbsp;&nbsp;&nbsp;</b> 
                   &nbsp;  &nbsp;  &nbsp;  &nbsp; 
                 <b style="font-family: myFirstFont;border-radius:10px; height:30px;background: #d0d0d0;font-size: 30px;text-decoration: none">&nbsp;&nbsp;&nbsp;
            <a href="taxsettings.jsp"style="text-decoration: none"> Cancel</a>&nbsp;&nbsp;&nbsp;</b> 
                 
            </div>
        </form>
         </fieldset>
        </fieldset>        
       
    </body>
</html>
