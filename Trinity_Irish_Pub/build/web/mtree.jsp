<%@page import="com.action.accounts.forms.Items"%>
<%@page import="com.action.accounts.Accounts"%>
<%@page import="com.action.accounts.forms.TreeForm"%>
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
    
    ArrayList<TreeForm> list=Accounts.getMenus();
   
    Iterator itr=list.iterator();
    while(itr.hasNext()){
        TreeForm tf=(TreeForm)itr.next();
        String mid=tf.getMid();
        String menu=tf.getMenu();
            out.println("<tr data-tt-id='"+mid+"'><td><input type='checkbox' name='menu' value='"+mid+"'>"+menu+"</td></tr>");
        ArrayList<Items> it=tf.getList();
        Iterator iit=it.iterator();
        while(iit.hasNext()){
            Items item=(Items)iit.next();
            String iid=item.getId();
            String iname=item.getName();
            out.println("<tr data-tt-id='"+iid+"' data-tt-parent-id='"+mid+"'><td><input type='checkbox'  name='items' value='"+iid+"'>"+iname+"</td></tr>");
        }
            
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
        var nodeId = $("#revealNodeId").val();

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