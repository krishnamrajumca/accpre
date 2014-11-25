package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.form.RestForm1;
import com.util.Rest;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import com.util.DBConnection;
import com.form.MenuForm;
import java.util.Iterator;
import java.util.ArrayList;
import com.util.Menu;

public final class menu_005fdetails_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <script type=\"text/javascript\" src=\"simpletreemenu.js\"></script>\n");
      out.write("        <link href=\"css/modal.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <link href=\"css/layout.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        \n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"simpletree.css\" />\n");
      out.write("        <script language=\"javascript\">\n");
      out.write("            var value=0;\n");
      out.write("            function sb(){\n");
      out.write("          \n");
      out.write("                var x=document.php.file.value;\n");
      out.write("               // alert(\"php:\"+x);\n");
      out.write("                document.add.img.value=x;\n");
      out.write("                //document.edititem.img.value=x;\n");
      out.write("               //alert(document.add.img.value);\n");
      out.write("            }\n");
      out.write("            function sbe(){\n");
      out.write("               // alert(\"k\");\n");
      out.write("                var x=document.php1.file.value;\n");
      out.write("                //alert(\"php:\"+x);\n");
      out.write("                //document.add.img.value=x;\n");
      out.write("                document.edititem.img.value=x;\n");
      out.write("               //alert(document.edititem.img.value);\n");
      out.write("            }\n");
      out.write("            function selec(){\n");
      out.write("            var test = document.getElementsByName('c');\n");
      out.write("    var sizes = test.length;\n");
      out.write("    \n");
      out.write("    for (i=0; i < sizes; i++) {\n");
      out.write("            if (test[i].checked==true) {\n");
      out.write("                value=test[i].value;\n");
      out.write("          //  alert(value + ' you got a value');     \n");
      out.write("            //return test[i].value;\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("        }\n");
      out.write("            function call(){//alert(\"logo\");.Element\n");
      out.write("                var frm=document.getElementById(\"frm1\");\n");
      out.write("                frm.enctype = \"multipart/form-data\";\n");
      out.write("                \n");
      out.write("     frm.submit();    \n");
      out.write("    }\n");
      out.write("    function unavilable(){\n");
      out.write("        var val=\"unavilable.jsp?\";\n");
      out.write("        var j=1;\n");
      out.write("        for(i=0;i<document.table.chb.length;i++){\n");
      out.write("            if(document.table.chb[i].checked){\n");
      out.write("                val+=\"ch=\"+document.table.chb[i].value+\"&\";\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("       window.location.href=val;\n");
      out.write("    }\n");
      out.write("    function avilable(){\n");
      out.write("        var val=\"Available?\";\n");
      out.write("       \n");
      out.write("        for(i=0;i<document.table.chb.length;i++){\n");
      out.write("            if(document.table.chb[i].checked){\n");
      out.write("                val+=\"ch=\"+document.table.chb[i].value+\"&\";\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("       window.location.href=val;\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    function additem(){\n");
      out.write("        \n");
      out.write("        selec();\n");
      out.write("        window.location.href=\"menu_details.jsp?menu=\"+value+\"#join_form\";\n");
      out.write("    }\n");
      out.write("            function add(){\n");
      out.write("                selec();\n");
      out.write("               // alert(value+\" on add\");\n");
      out.write("                var cat=prompt(\"Enter a Category\",\"\");\n");
      out.write("                if(cat!=null){\n");
      out.write("               // alert(cat);\n");
      out.write("              window.location.href=\"addmenu.jsp?ref=\"+value+\"&name=\"+cat;\n");
      out.write("          }\n");
      out.write("               }\n");
      out.write("               function delet(){\n");
      out.write("                   selec();\n");
      out.write("                   //alert(value);\n");
      out.write("                   window.location.href=\"deletemenu.jsp?id=\"+value;\n");
      out.write("               }\n");
      out.write("            function display(id){\n");
      out.write("               // alert(id);\n");
      out.write("                window.location.href=\"menu_details.jsp?iid=\"+id;\n");
      out.write("                }\n");
      out.write("                function up(){\n");
      out.write("                    selec();\n");
      out.write("                    \n");
      out.write("                }\n");
      out.write("                function edit(){\n");
      out.write("                    selec();\n");
      out.write("                    var name=prompt(\"new Name:\",\"\");\n");
      out.write("                    if(name!=null){\n");
      out.write("                        window.location.href=\"editmenu.jsp?name=\"+name+\"&id=\"+value;\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("                function up(){\n");
      out.write("                    selec();\n");
      out.write("                    window.location.href=\"upmenu?id=\"+value;\n");
      out.write("                }\n");
      out.write("                function down(){\n");
      out.write("                    selec();\n");
      out.write("                    window.location.href=\"downmenu?id=\"+value;\n");
      out.write("                }\n");
      out.write("                function deleteitems(){\n");
      out.write("                    var val=\"deleteitem.jsp?\";\n");
      out.write("       \n");
      out.write("        for(i=0;i<document.table.chb.length;i++){\n");
      out.write("            if(document.table.chb[i].checked){\n");
      out.write("                val+=\"ch=\"+document.table.chb[i].value+\"&\";\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("       window.location.href=val;\n");
      out.write("                }\n");
      out.write("                function edititems(id,pid){\n");
      out.write("                    var val=\"menu_details.jsp?iid=\"+pid;\n");
      out.write("       //alert();\n");
      out.write("        for(i=1;i<document.table.chb.length;i++){\n");
      out.write("            if(document.table.chb[i].checked){\n");
      out.write("                //if(!document.table.chb[i].value==\"-1\")\n");
      out.write("               val+=\"&ch=\"+document.table.chb[i].value;\n");
      out.write("                \n");
      out.write("                break;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        //alert(val+\"#loginin_form\");\n");
      out.write("       window.location.href=val+\"#login_form\";\n");
      out.write("                }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("          ");

          String path=getServletContext().getInitParameter("url");
          String url = path+"upload.php";
   // String s=request.getParameter("name");
    String rid = (String) session.getAttribute("restaurant");
    String pid=request.getParameter("iid");
    session.setAttribute("pid",pid);
System.out.println("---------------------restaurant---------------------"+rid);

      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <fieldset style=\"margin-left: 90px;margin-top: 80px;\">\n");
      out.write("            \n");
      out.write("<form name=\"del\" >\n");
      out.write("<div style=\"width:300px;float: left\">\n");
      out.write("  \n");
      out.write("    <fieldset>\n");
      out.write("                    <fieldset style=\"background-color:lightslategray\">\n");
      out.write("                        <a href=\"javascript:add()\" title=\"Add new\"><img src=\"images/add.jpeg\"></a>\n");
      out.write("                        <a href=\"javascript:up()\" title=\"up\"><img src=\"images/up.gif\"></a>\n");
      out.write("                        <a href=\"javascript:down()\" title=\"Down\"><img src=\"images/down1.gif\"></a>\n");
      out.write("                        <!--    <a href=\"#\"><img src=\"images/right.jpeg\"></a>\n");
      out.write("                           <a href=\"#\"> <img src=\"images/left.png\"></a>-->\n");
      out.write("                        <a href=\"javascript:delet()\" title=\"Delete\"><img src=\"images/delete.jpeg\"></a>\n");
      out.write("                        <a href=\"javascript:edit()\" title=\"Edit\"><img src=\"images/edit.jpeg\"></a>\n");
      out.write("<!--                        <a href=\"javascript:display('");
      out.print(rid);
      out.write("')\" title=\"Display in Table\"><img src=\"images/right.jpeg\"></a>-->\n");
      out.write("                      <!--  <a href=\"#\" title=\"search\"><img src=\"images/search1.png\"></a>-->\n");
      out.write("                    </fieldset>\n");
      out.write("                    \n");
      out.write("                        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "tree.jsp", out, false);
      out.write("\n");
      out.write("                </fieldset>\n");
      out.write("\n");
      out.write("   \n");
      out.write("            </div>\n");
      out.write("                               </form>           \n");
      out.write("            <div id=\"menu\" class=\"main\" style=\"text-align:left; margin-left: 350px;margin-bottom: 40px;height:40px\">\n");
      out.write("                <div class=\"panel\">\n");
      out.write("                <ul>\n");
      out.write("                    <li ><a href=\"javascript:additem()\">Add Item</a></li>\n");
      out.write("                    <li><a href=\"javascript:unavilable()\">Unavailable</a></li>\n");
      out.write("                    <li><a href=\"javascript:avilable()\">Available</a></li>\n");
      out.write("                    <li><a href=\"javascript:deleteitems()\">Delete</a></li>\n");
      out.write("                    <li><a href=\"javascript:edititems('");
      out.print(rid);
      out.write("','");
      out.print(pid);
      out.write("')\">Edit</a></li>\n");
      out.write("                    <li><a href=\"uploadmenu.jsp\" target='a' title=\"upload menu data to server\">Upload</a></li>\n");
      out.write("                </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div style=\"text-align:left; margin-left: 350px\">\n");
      out.write("                <form id='table'name='table'>\n");
      out.write("                <table width=\"60%\" border=\"0\" style=\"text-align:left;margin-left: 50px\">\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Logo</th>\n");
      out.write("                        <th width=\"70%\">\n");
      out.write("                            <input type=\"checkbox\" name=\"chb\" value=\"-1\" style=\"display:none\">Item Name\n");
      out.write("<!--                            <input type=\"checkbox\" name=\"chb\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name: &nbsp;&nbsp;\n");
      out.write("                            <input type=\"text\" name=\"name\"/>\n");
      out.write("                            <img src=\"images/search1.png\"/>-->\n");
      out.write("                        </th>\n");
      out.write("                        <th>price</th>\n");
      out.write("                    </tr>\n");
      out.write("                    ");

                    try{
                    
                    DBConnection db=new DBConnection();
                    Connection con=db.getConn();
                    System.out.println("select id,name,price from items where status=1 and parent="+pid);
                    PreparedStatement ps=con.prepareStatement("select id,name,price,status,logo from items where parent="+pid);
                    ResultSet rs=ps.executeQuery();
                    while(rs.next()){
                        String iname=rs.getString(2);
                        int iid=rs.getInt(1);
                        System.out.println("item id:"+iid);
                        double price=rs.getDouble(3);
                        int st=rs.getInt(4);
                        String img=path+rs.getString(5);  
                       System.out.println(iid+" "+price+" "+iname);

      out.write("<tr>\n");
      out.write("    <td>\n");
      out.write("         <!--<img src=\"displayLogo.jsp?id=");
      out.print(iid);
      out.write("\"   style='float:left'width=\"60px\" height=\"30px\" onError=\"this.src='images/no_logo.jpg';\">-->\n");
      out.write("            <img src=\"");
      out.print(img);
      out.write("\"   style='float:left'width=\"60px\" height=\"30px\" onError=\"this.src='images/no_logo.jpg';\">\n");
      out.write("    </td>\n");
      out.write("<td width=\"70%\">\n");
      out.write("    \n");
      out.write("\n");
      out.write("    <input type=\"checkbox\" name=\"chb\" value=\"");
      out.print(iid);
      out.write("\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
 String color="green";
        if(st==0)
            color="black";

      out.write("\n");
      out.write("<font style='color:");
      out.print(color);
      out.write('\'');
      out.write('>');
      out.print(iname);
      out.write("</font>\n");
      out.write("\n");
      out.write("</td>\n");
      out.write("<td>");
      out.print(price);
      out.write("</td>\n");
      out.write("</tr>");
}
                   } catch(Exception e){
                       e.printStackTrace();
                   }
                    
      out.write("\n");
      out.write("                   <!-- <tr>\n");
      out.write("                        <td><input type=\"checkbox\" name=\"check\"/></td>\n");
      out.write("                        <td><a href=\"#\" >Black Coffee</a></td>\n");
      out.write("                        <td>50</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><input type=\"checkbox\" name=\"check\"/></td>\n");
      out.write("                        <td><a href=\"#\" >Green Coffee</a></td>\n");
      out.write("                        <td>60</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td><input type=\"checkbox\" name=\"check\"/></td>\n");
      out.write("                        <td><a href=\"#\" >Cold Coffee</a></td>\n");
      out.write("                        <td>100</td>\n");
      out.write("                    </tr>-->\n");
      out.write("                </table>\n");
      out.write("               </form>\n");
      out.write("            </div>\n");
      out.write("                                \n");
      out.write("        </fieldset>\n");
      out.write("\n");
      out.write("                            <!-- *************popup******* -->\n");
      out.write("            <a href=\"#x\" class=\"overlay\" id=\"join_form\"></a>\n");
      out.write("            <div class=\"popup\" style=\"width:900px;height:500px;background-color: lightskyblue\">\n");
      out.write("                ");
String menu=request.getParameter("menu");
                    session.setAttribute("menu",menu);
                

                
      out.write("\n");
      out.write("                <h2>Add Items</h2>\n");
      out.write("                <div>\n");
      out.write("                    <form name=\"php\" id='php' action=\"");
      out.print(url);
      out.write("\" target='a' method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("                         ");
 
                    String msg=request.getParameter("msg"); 
                    if (msg != null) {
                       
                
      out.write("\n");
      out.write("\n");
      out.write("<!--                <img src=\"displayLogo.jsp\"  style='float: left;clear: both' width=\"200px\" height=\"150px\" onError=\"this.src='images/no_logo.jpg';\">-->\n");
      out.write("    Logo Uploaded\n");
      out.write("                ");
 
                }else {

                
      out.write("\n");
      out.write("\n");
      out.write("              \n");
      out.write("                            Choose Logo:<br><input type=\"file\" class=\"text\" name=\"file\"/>\n");
      out.write("                        <input type=\"submit\" value=\"save\" onclick='sb()'/>");
}
      out.write("\n");
      out.write("                    </form>\n");
      out.write("                    <form name=\"add\" id=\"frm\" action=\"AddItem\" method=\"get\">\n");
      out.write("                    <table>\n");
      out.write("                        <tr><td>\n");
      out.write("                           \n");
      out.write("                            </td></tr>\n");
      out.write("                        <tr>\n");
      out.write("                            \n");
      out.write("                            <td>Item Name<br><input class=\"text\" type=\"text\" name=\"name\"/>\n");
      out.write("                                <input type='hidden' name='img' value=\"no\">\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>\n");
      out.write("\n");
      out.write("                                Price<br><input class=\"text\" type=\"text\" name=\"price\"/>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Long Description<br><textarea style=\"width:250px\" name=\"long\"></textarea></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Short Description<br><input class=\"text\" type=\"text\" name=\"short\"/></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>\n");
      out.write("                                <input class=\"btn\" type=\"submit\" value=\"Add Item\"/>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                    </table>\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <a class=\"close\" href=\"#close\"></a>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write(" <a href=\"#x\" class=\"overlay\" id=\"login_form\"></a>\n");
      out.write("            <div class=\"popup\" style=\"width:500px;height:500px;background-color: lightskyblue\">\n");
      out.write("                <h2>Edit Items</h2> \n");
      out.write("                ");

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
                
      out.write("\n");
      out.write("                <img src=\"displayLogo.jsp?id=");
      out.print(item);
      out.write("\"  style='float: right;clear: both' width=\"100px\" height=\"100px\" onError=\"this.src='images/no_logo.jpg';\">\n");
      out.write("                <form name=\"php1\" action=\"");
      out.print(url);
      out.write("\" target=\"a\" method=\"post\" enctype=\"multipart/form-data\">   \n");
      out.write("                Do_you_want_Change_to_Logo:\n");
      out.write("                                <input type=\"file\" name=\"file\"/>\n");
      out.write("                                <input type=\"submit\" value=\"save\" onclick=\"sbe()\"/>\n");
      out.write("                </form>\n");
      out.write("                <form name='edititem' action=\"EditItem\" id='frm'>\n");
      out.write("                    \n");
      out.write("                    <table>\n");
      out.write("                            \n");
      out.write("                        <tr style=\"height: 30px\">\n");
      out.write("                            <td>Item Name:</td>\n");
      out.write("                            \n");
      out.write("                            <td>\n");
      out.write("                                <input type=\"hidden\" name=\"img\" value=\"no\">\n");
      out.write("                                <input type=\"text\" name='name' class=\"text\" value=\"");
      out.print(name1);
      out.write("\"/></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Price:</td>\n");
      out.write("                            <td><input type=\"text\" name='price' class='text' value=\"");
      out.print(price);
      out.write("\"/></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Short Description:</td>\n");
      out.write("                            <td><input type=\"text\" name='sdes' class='text' value='");
      out.print(sdesc);
      out.write("'/></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Long Description:</td>\n");
      out.write("                            <td><input type=\"text\" name='ldes' class='text' value=\"");
      out.print(ldesc);
      out.write("\"/></td>\n");
      out.write("                        \n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan=\"2\"><input type=\"submit\" class=\"btn\" value=\"Edit\"/></td>\n");
      out.write("                        </tr>\n");
      out.write("                    </table>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                </form>\n");
      out.write("                <a class=\"close\" href=\"#close\"></a>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("           \n");
      out.write("     <script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("            //ddtreemenu.createTree(treeid, enablepersist, opt_persist_in_days (default is 1))\n");
      out.write("\n");
      out.write("            ddtreemenu.createTree(\"treemenu1\", true)\n");
      out.write("\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
