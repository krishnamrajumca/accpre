

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <title><%=getServletContext().getInitParameter("name")%></title>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <%
       String url = getServletContext().getInitParameter("url")+"postTransactions.php";
       //String rid= getServletContext().getInitParameter("id");
       String u="SyncTransactions";
    %>
    <form id="form1" name="form1" action="<%=url%>" runat="server" method="post">
        <input type="hidden" name="data" value="ok"/>
        <input type="hidden" name="url" value="<%=u%>"/>
        <input type="hidden" name="tourl" value="<%=url%>"/>
    <div id="page">
       
        <div id="tweets">
            <ul><li>Getting Data from server, please wait....</li></ul>
        </div>
        <div id="JSONP"></div>
    </div>
    </form>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.5.1.js"></script>
    <script src="js/get.js"></script>
    </body>
</html>