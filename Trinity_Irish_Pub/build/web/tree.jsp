<%@page import="com.util.menus"%>
<%@page import="com.util.GetData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<!DOCTYPE html>

<html>
  <head>
    <meta charset="utf-8">
    <title>jQuery treetable</title>
    <link rel="stylesheet" href="css/screen.css" media="screen" />
    <link rel="stylesheet" href="css/jquery.treetable.css" />
    <link rel="stylesheet" href="css/jquery.treetable.theme.default.css" />
    
  </head>
   <body background="images/bg2.png">
    <div id="main">
    


<!--      <h3>Restaurant Menus</h3>-->
<form name="frm" id="frm">
      <table id="example-basic-expandable" style="width: 250px;overflow: scroll">
       
<%
    String sid=(String)session.getAttribute("restaurant");
    //int rid=1;//Integer.parseInt(sid);
    ArrayList list;
   // System.out.println("in tree.jsp:---------"+rid);
    GetData g=new GetData();
    list=g.getData(0);
    Iterator itr=list.iterator();
    while(itr.hasNext()){
        menus m=(menus)itr.next();
        int id=m.getId();
        int pid=m.getPid();
        
        String name=m.getName();
        int child=m.getChild();
       
        if(pid==0)
            out.println("<tr data-tt-id='"+id+"'>");
        else
            out.println("<tr data-tt-id='"+id+"' data-tt-parent-id='"+pid+"'>");
        if(child==0)
        out.println("<td><input type='radio' group='c' name='c' value='"+id+"'>"+name+"</td></tr>");
        else
            out.println("<td><input type='radio' group='c' name='c' value='"+id+"'><a href='javascript:display("+id+")' >"+name+"</a></td></tr>");
    }
%>
      </table>
</form>
    </div>

    <script src="vendor/jquery.js"></script>
    <script src="vendor/jquery-ui.js"></script>
    <script src="js/src/jquery.treetable.js"></script>
    <script>
      $("#example-basic").treetable({ expandable: true });

      $("#example-basic-static").treetable();

      $("#example-basic-expandable").treetable({ expandable: true });

      $("#example-advanced").treetable({ expandable: true });

      // Highlight selected row
      $("#example-advanced tbody").on("mousedown", "tr", function() {
        $(".selected").not(this).removeClass("selected");
        $(this).toggleClass("selected");
      });

      // Drag & Drop Example Code
      $("#example-advanced .file, #example-advanced .folder").draggable({
        helper: "clone",
        opacity: .75,
        refreshPositions: true, // Performance?
        revert: "invalid",
        revertDuration: 300,
        scroll: true
      });

      $("#example-advanced .folder").each(function() {
        $(this).parents("#example-advanced tr").droppable({
          accept: ".file, .folder",
          drop: function(e, ui) {
            var droppedEl = ui.draggable.parents("tr");
            $("#example-advanced").treetable("move", droppedEl.data("ttId"), $(this).data("ttId"));
          },
          hoverClass: "accept",
          over: function(e, ui) {
            var droppedEl = ui.draggable.parents("tr");
            if(this != droppedEl[0] && !$(this).is(".expanded")) {
              $("#example-advanced").treetable("expandNode", $(this).data("ttId"));
            }
          }
        });
      });

      $("form#reveal").submit(function() {
        var nodeId = $("#revealNodeId").val()

        try {
          $("#example-advanced").treetable("reveal", nodeId);
        }
        catch(error) {
          alert(error.message);
        }

        return false;
      });
    </script>
  </body>
</html>