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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author krishna
 */
public class AddMenu extends HttpServlet {

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
            HttpSession session=request.getSession();
            //int rid=Integer.parseInt((String)session.getAttribute("restaurant"));
    
    int value=Integer.parseInt(request.getParameter("ref"));
    String name=request.getParameter("name");
    
    PreparedStatement ps;
    ResultSet rs;
     ps= DBConnection.getPrepare("select max(orderr) from menus where refid="+value);
     rs=ps.executeQuery();
     int order=0;
     if(rs.next())
         order=rs.getInt(1);
     order++;
     ps=DBConnection.getPrepare("select max(mid) from menus");
     rs=ps.executeQuery();
     int mid=1;
     if(rs.next()){
     mid=rs.getInt(1)+1;
     }
    ps=DBConnection.getPrepare("insert into menus(mid,refid,name,orderr) values(?,?,?,?)");
    ps.setInt(1, mid);
    ps.setInt(2,value);
    ps.setString(3,name);
    ps.setInt(4,order);
    ps.execute();
    
    response.sendRedirect("menu.jsp");
        } catch (SQLException ex) {
            out.println(ex);
            Logger.getLogger(AddMenu.class.getName()).log(Level.SEVERE, null, ex);
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
