/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.manager;


import com.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author krishna
 */
public class SyncTransactions extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            
           PreparedStatement ps=DBConnection.getPrepare("select *from transactions");
           PreparedStatement p=DBConnection.getPrepare("select *from trans where trasid=?");
           ResultSet rs=ps.executeQuery();
           String rest=getServletContext().getInitParameter("id");
           String id="",type="",total="",date="";
           JSONObject json      = new JSONObject();
            json.put("rid",rest);
            JSONArray jarr=new JSONArray();
           while(rs.next()){
            JSONObject js=new JSONObject();
            js.put("id",rs.getString(1));
            js.put("type",rs.getString(2));
            js.put("amount",rs.getString(3));
            js.put("date",rs.getString(4));
            js.put("discount",rs.getString(5));
            
           p.setString(1,rs.getString(1));
           ResultSet r=p.executeQuery();
           JSONArray ja=new JSONArray();
           while(r.next()){
               JSONObject j=new JSONObject();
               j.put("name", r.getString(4));
               j.put("price", r.getString(1));
               j.put("qt", r.getString(2));
               j.put("total",r.getString(3));
               ja.add(j);
           }
           js.put("items", ja);
           jarr.add(js);
           }
           
           json.put("transactions", jarr);
           out.println(json.toString());
           out.println(type);
           out.println(total);
           out.println(date);
        } catch (SQLException ex) {
            Logger.getLogger(SyncTransactions.class.getName()).log(Level.SEVERE, null, ex);
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
