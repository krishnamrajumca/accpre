<%@page import="com.util.cp"%>
<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <title>Restaurant</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <link href="css/modal.css" rel="stylesheet" type="text/css" />
        <script language="javascript">
            function verify(){
                var cp=document.password.cap.value;
                var cp1=document.password.cap1.value;
               // alert(cp+" "+cp1);
                if(cp==cp1)
                    return true;
                else{
                    alert("text not matched");
                    document.password.cap.value="";
                    return false;
                }
            }
        </script>
    </head>



    <body>
        <div style="margin-top: 150px;">

            <center>

                <!--<font style="font-size:30px;color: black;">ACCPRE</font>-->
                <!--<img src="images/logo.PNG" width="200" height="80" alt="logo" style=""/>-->


                <form id="frm" action="Login" method="post" style="width: 500px;height: 320px;background-color: lightsteelblue;-webkit-border-radius: 80px;-moz-border-radius: 200px;
   border-radius:10px;">

                <center>
                  <!--<font style="font-size:30px;color: green">Accper</font>-->
                    <table>
                    <tr>
                        <td height="70px">
                            <b> Login ID</b>&nbsp
                        </td>
                        <td>

                            <input type="text"  name="user" class="text" />
                        </td>
                    </tr>
                    <tr>
                        <td><b>Password &nbsp</b></td>&nbsp
                        <td><input type="password" name="password" class="text"/><br></td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <b>   <input class="btn" type="submit" value="Login" style="width:300px; height:30px;background: dodgerblue"/> </b></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;color:red;">
                            <%
                            String msg=request.getParameter("msg");
                            if(msg!=null)
                                out.println("Incorrect user name or password");
                            String pass=request.getParameter("pass");
                            if(pass!=null)
                                out.println(pass);
                          
        %>


                            
                        </td>
                    </tr>
                </table>
                    </center>
            </form>
                        

            </center>

        </div>
    </body>
</html>
