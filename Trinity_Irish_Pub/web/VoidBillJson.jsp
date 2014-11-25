<%-- 
    Document   : VoidBillJson
    Created on : Jul 27, 2014, 4:04:12 PM
    Author     : Accpre
--%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.util.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    String status="failed";
try {
            String id=request.getParameter("id");
            
            PreparedStatement ps=DBConnection.getPrepare("delete from orders where tableid="+id);
            ps.execute();
            ps=DBConnection.getPrepare("delete from discounts where tableid="+id);
            ps.execute();
            status="success";
            
        } catch (SQLException ex) {
            
            
        } finally {
            JSONObject json=new JSONObject();
            json.put("status", status);
            response.setContentType("application/json");
        response.getWriter().write(json.toString());
            
        }
%>
