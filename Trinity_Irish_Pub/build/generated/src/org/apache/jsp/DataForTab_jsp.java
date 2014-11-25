package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.HashMap;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import com.util.DBConnection;

public final class DataForTab_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    public double getTax(String name,double amt,double dis){
        
        double total=0.0;
        HashMap<String,Double> hm=new HashMap<String,Double>();
        PreparedStatement ps=DBConnection.getPrepare("select value,op,wit,formula,taxtype from tax where name=?");
        try{
            System.out.println("Discount:"+dis);
        ps.setString(1, name);
        ResultSet rs=ps.executeQuery();
        String form="sub-discount";
        System.out.println("------------------------------------------------------");
        while(rs.next()){
            double val=rs.getDouble(1);
            String op=rs.getString(2);
            String wit=rs.getString(3);
            form=rs.getString(4);
            String type=rs.getString(5);
            double sub=0.0;
         
            if(wit.equalsIgnoreCase("sub-discount"))
                sub=amt-dis;
            else
                sub=hm.get(wit);
            if(op.equals("%")){
                sub=(val/100)*sub;
             
            }
            else if(op.equals("*"))
                sub=val*sub;
            else
                sub+=val;
            hm.put(type,sub);
            System.out.println("Type:"+type+" amt:"+sub);
        }
        String s[]=form.split(";");
        for(int i=1;i<s.length;i++){
            total+=hm.get(s[i]);
        }
        }catch(Exception e){}
    return total;
    }

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

    // start items list from order on a table
    String id=request.getParameter("id");
    PreparedStatement ps=DBConnection.getPrepare("select o.id,item,quantity,o.total,tax from orders o,items i where item=name and tableid="+id);
    ResultSet rs=ps.executeQuery();
    JSONObject json=new JSONObject();
    JSONObject json1=new JSONObject();
    JSONArray jarr=new JSONArray();
    while(rs.next()){
        json1.put("id", rs.getString(1));
         json1.put("name", rs.getString(2));
         json1.put("quantity",rs.getString(3));
          json1.put("price", rs.getString(4));
          json1.put("tax", rs.getString(5));
        jarr.add(json1);
    }
    json.put("items", jarr);
    //end items list
    
    //start of totals
    
    ps=DBConnection.getPrepare("select assign from tables where tid="+id);
    rs=ps.executeQuery();
    String type="Dinning";
    if(rs.next())
        type=rs.getString(1);
    String sql="";
    String sql1="select distinct(tax) from orders o,items i where item=name and tableid=?";
    if(type.equalsIgnoreCase("dinning")){
        sql="select  tax,sum(total) from orders o,items i where tableid=? and name=item group by tax";
        sql1="select distinct(tax) from orders o,items i where item=name and tableid=?";
    }
    else if(type.equalsIgnoreCase("parcel")){
        sql="select  ptax,sum(total) from orders o,items i where tableid=? and name=item group by ptax";
        sql1="select distinct(ptax) from orders o,items i where item=name and tableid=?";
    }
    else{
        sql="select  taketax,sum(total) from orders o,items i where tableid=? and name=item group by taketax";
        sql1="select distinct(taketax) from orders o,items i where item=name and tableid=?";
    }
    ps=DBConnection.getPrepare(sql);
    ps.setString(1,id);
    rs=ps.executeQuery();
       
    JSONObject jarr1=new JSONObject();
    double sub=0.0,tax=0.0,total=0.0,disco=0.0; 
    while(rs.next()){
        double value=rs.getDouble(2);
        sub+=value;
        String taxname=rs.getString(1);
        String n="0";
        
        double discount=Double.parseDouble(n);
        disco+=discount;
        total+=getTax(taxname,value,discount);
        
    }
    json.put("subtotal", sub);
    json.put("tax",total);
    json.put("discount",disco);
    json.put("GrandTotal",sub+total-disco);
    
    //end of totals
    
    //start payments
    ps=DBConnection.getPrepare("select name from payment");
    rs=ps.executeQuery();
    JSONObject obj1=new JSONObject();
    JSONArray arr=new JSONArray();

while(rs.next()){
    obj1.put("types",rs.getString(1) );
    arr.add(obj1);
}
json.put("payments",arr);
//end of payments

//tax types


ps=DBConnection.getPrepare(sql1);
ps.setString(1,id);
rs=ps.executeQuery();
JSONArray arr2=new JSONArray();
while(rs.next()){
    JSONObject ob=new JSONObject();
    ob.put("type", rs.getString(1));
    arr2.add(ob);
}
json.put("tax types",arr2);
//end if tax types
    response.setContentType("application/json");
        response.getWriter().write(json.toString());

      out.write('\n');
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
