<%-- 
    Document   : getName
    Created on : Dec 13, 2013, 2:53:23 PM
    Author     : krishna
--%>

<%@page import="java.net.UnknownHostException"%>
<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String hostname = "Unknown";

try
{
    InetAddress addr;
    addr = InetAddress.getLocalHost();
    hostname = addr.getHostName();
}
catch (UnknownHostException ex)
{
    System.out.println("Hostname can not be resolved");
}
String name=request.getLocalName();
String ip=request.getRemoteAddr();
String host=request.getRemoteHost();
        %>
        Your pc Name:<%=hostname%><br>
        And ip Address:<%=ip%><%=host%>
    </body>
</html>
