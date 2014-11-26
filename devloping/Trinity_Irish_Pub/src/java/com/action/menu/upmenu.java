/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.menu;

import com.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author krishna
 */
public class upmenu extends HttpServlet {

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
        
try{
    HttpSession session=request.getSession();
    //int rid=Integer.parseInt((String)session.getAttribute("restaurant"));
    int id=Integer.parseInt(request.getParameter("id"));
    
    PreparedStatement ps,ps1,ps2;
           ps=DBConnection.getPrepare("select refid,orderr from menus where mid="+id);
           ResultSet rs=ps.executeQuery();
           int ref=-1,order=1;
               if(rs.next()){
                ref=rs.getInt(1);
                order=rs.getInt(2);
               out.println(ref);
               }  
               if(order>1){
               ps=DBConnection.getPrepare("select mid from menus where refid="+ref+" and orderr="+(order-1));
               rs=ps.executeQuery();
               int next=-1;
               if(rs.next()){
               next=rs.getInt(1);
               }
               ps=DBConnection.getPrepare("update menus set orderr=orderr-1 where mid="+id);
               ps1=DBConnection.getPrepare("update menus set orderr=orderr+1 where mid="+next);
               ps.execute();
               ps1.execute();
               out.println(next);
                   }
    response.sendRedirect("menu.jsp");
        }

catch(Exception e){
   e.printStackTrace();
   out.println(e);
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
