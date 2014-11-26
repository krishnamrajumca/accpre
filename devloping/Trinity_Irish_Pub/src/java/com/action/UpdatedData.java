/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action;

import com.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author krishna
 */
public class UpdatedData extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            DBConnection db=new DBConnection();
            Connection con=db.getConn();
            PreparedStatement ps=con.prepareStatement("select id from items where status=0");
            ResultSet rs=ps.executeQuery();
            JSONArray data=new JSONArray();
            JSONObject json=new JSONObject();
            JSONArray arr=new JSONArray();
                            PreparedStatement ps1,ps2;
                ResultSet r,r1;

            while(rs.next()){
            JSONObject obj=new JSONObject();
            obj.put("id", rs.getString(1));
            arr.add(obj);
            }
            json.put("unavilable", arr);
            JSONObject js=new JSONObject();
            ps=con.prepareStatement("select name,mid from menus where refid=0");
            rs=ps.executeQuery();
            while(rs.next()){
                JSONObject obj=new JSONObject();

                
                
                ps2=con.prepareStatement("select *from items where name not like  '%,,%' and  parent="+rs.getString(2));
                    r1=ps2.executeQuery();
                    JSONArray items=new JSONArray();
                    while(r1.next()){
                       // System.out.println("data entered");
                        JSONObject o=new JSONObject();
                        o.put("id",r1.getString(1));
                        o.put("name",r1.getString(2));
                        o.put("price",r1.getString(3));
                        o.put("short",r1.getString(4));
                        o.put("long",r1.getString(5));
                        o.put("isAvailable",r1.getString(8));
                        data.add(o);
                    }
                    //js.put("itemss",items);
                    //data.add(items);
                    
//                while(r.next())
//                {
//                    
//                    js.put("catageory",r.getString(2) );
//                    
//                }
                
            }
            json.put("items",data);
//            ps1=con.prepareStatement("select mid from menus where name='Di Bella Exclusive Waffle SandWiches'");
//                    r=ps1.executeQuery();
//                    int mid=0;
//                    if(r.next()){
//                        mid=r.getInt(1);
//                    }
                   ps1=con.prepareStatement("select * from  items where name like '%,,%'");
                   r=ps1.executeQuery();
                   JSONArray items1=new JSONArray();
                   while(r.next()){
                       JSONObject o=new JSONObject();
                        o.put("id",r.getString(1));
                        o.put("name",r.getString(2));
                        o.put("price",r.getString(3));
                        o.put("short",r.getString(4));
                        o.put("long",r.getString(5));
                        o.put("isAvailable",r.getString(8));
                        items1.add(o);
                       
                   }
                    //data.add();
                
                json.put("flavoured", items1);
                
                
                
                
                
                 ps1=con.prepareStatement("select * from  items where name like '%Pink Sauce ,,%'");
                   r=ps1.executeQuery();
                   items1=new JSONArray();
                   while(r.next()){
                       JSONObject o=new JSONObject();
                        o.put("id",r.getString(1));
                        o.put("name",r.getString(2));
                        o.put("price",r.getString(3));
                        o.put("short",r.getString(4));
                        o.put("long",r.getString(5));
                        o.put("isAvailable",r.getString(8));
                        items1.add(o);
                       
                   }
                
                json.put("PinkSauce",items1);
                
                
                
                
                
                
                   
                   ps2=con.prepareStatement("select * from items where  name like '%small%' order by parent,id");
                   
                    r=ps2.executeQuery();
                      items1=new JSONArray();
                   while(r.next()){
                       JSONObject o=new JSONObject();
                        o.put("id",r.getString(1));
                        o.put("name",r.getString(2).replace("small",""));
                        o.put("price",r.getString(3));
                        o.put("short",r.getString(4));
                        o.put("long",r.getString(5));
                        o.put("isAvailable",r.getString(8));
                        items1.add(o);
                       
                   }
                   
                   json.put("small", items1);
                    ps2=con.prepareStatement("select * from items where  name like '%large%' order by parent,id");
                   
                    r=ps2.executeQuery();
                  items1=new JSONArray();
                   while(r.next()){
                       JSONObject o=new JSONObject();
                        o.put("id",r.getString(1));
                        o.put("name",r.getString(2).replace("large",""));
                        o.put("price",r.getString(3));
                        o.put("short",r.getString(4));
                        o.put("long",r.getString(5));
                        o.put("isAvailable",r.getString(8));
                        items1.add(o);
                       
                   }
                   
                   
                   
                    json.put("large", items1);
                    
                    
                    
                    ps1=con.prepareStatement("select * from  items where parent=127 and name not like'%large%'");
                   r=ps1.executeQuery();
                   JSONArray items2=new JSONArray();
                   while(r.next()){
                       JSONObject o=new JSONObject();
                        o.put("id",r.getString(1));
                        o.put("name",r.getString(2));
                        o.put("price",r.getString(3));
                        o.put("short",r.getString(4));
                        o.put("long",r.getString(5));
                        o.put("isAvailable",r.getString(8));
                        items2.add(o);
                       
                   }
                    //data.add();
                
                json.put("Comb", items2);
                
//                 ps1=con.prepareStatement("select * from  items where parent=106 and name not like'%large%'");
//                   r=ps1.executeQuery();
//                   JSONArray items3=new JSONArray();
//                   while(r.next()){
//                       JSONObject o=new JSONObject();
//                        o.put("id",r.getString(1));
//                        o.put("name",r.getString(2));
//                        o.put("price",r.getString(3));
//                        o.put("short",r.getString(4));
//                        o.put("long",r.getString(5));
//                        o.put("isAvailable",r.getString(8));
//                        items2.add(o);
//                       
//                   }
//                    //data.add();
//                
//                json.put("ready", items2);
//                    
//                ps1=con.prepareStatement("select * from  items where parent=107 and name not like'%large%'");
//                   r=ps1.executeQuery();
//                   JSONArray items4=new JSONArray();
//                   while(r.next()){
//                       JSONObject o=new JSONObject();
//                        o.put("id",r.getString(1));
//                        o.put("name",r.getString(2));
//                        o.put("price",r.getString(3));
//                        o.put("short",r.getString(4));
//                        o.put("long",r.getString(5));
//                        o.put("isAvailable",r.getString(8));
//                        items2.add(o);
//                       
//                   }
//                    //data.add();
//                
//                json.put("luxury", items2);
        
                    
                
                    
                    
                   
                   
                   
                           
            response.setContentType("application/json");
        response.getWriter().write(json.toString());
        } catch (SQLException ex) {
            Logger.getLogger(UpdatedData.class.getName()).log(Level.SEVERE, null, ex);
            out.println(ex);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
