

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <title><%=getServletContext().getInitParameter("name")%></title>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <%
       String url = getServletContext().getInitParameter("url");
       String rid= getServletContext().getInitParameter("id");
       String u=url+"getMenus.php?id="+rid;
    %>
    <form id="form1" name="form1" action="LoadMenu.jsp" runat="server" method="post">
        <input type="hidden" name="data" value="ok"/>
        <input type="hidden" name="url" value="<%=u%>"/>
    <div id="page">
       
        <div id="tweets">
            <ul><li>Getting Data from server, please wait....</li></ul>
            <img src="images/loading.gif" alt="Loading.." style="width:150px;height:150px;alignment-adjust: central">
        </div>
        <div id="JSONP"></div>
    </div>
    </form>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.5.1.js"></script>
    <script src="js/getRemoteData.js"></script>
    </body>
</html>
