/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action;

import com.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
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
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author krishna
 */
public class KitchenJson extends HttpServlet {

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
            String id=request.getParameter("id");
            PreparedStatement ps=DBConnection.getPrepare("select items from kichenacc where id=?");
            ps.setString(1, id);
            ResultSet rs=ps.executeQuery();
            
            String item="";
            if(rs.next()){
                item=rs.getString(1);
                System.out.println("Item:"+item);
            }
            String items[]=item.split(",");
            ArrayList list=new ArrayList();
            ps=DBConnection.getPrepare("select tableid from orders where item in(select name from items where id=?) and action<>'completed'");
            
            for(int i=0;i<items.length;i++){
               ps.setString(1, items[i]);
               rs=ps.executeQuery();
               while(rs.next()){
                   String tid=rs.getString(1);
                   if(!list.contains(tid))
                       list.add(tid);
               }
            }
            JSONObject json      = new JSONObject();
            JSONArray arr=new JSONArray();
            JSONObject json1      = new JSONObject();
            for(int i=0;i<list.size();i++)
            {
               
                json1.put("id", list.get(i));
                arr.add(json1);
            }
            json.put("tables", arr);

            response.setContentType("application/json");
    response.getWriter().write(json.toString());
        } catch (SQLException ex) {
            
            Logger.getLogger(KitchenJson.class.getName()).log(Level.SEVERE, null, ex);
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
