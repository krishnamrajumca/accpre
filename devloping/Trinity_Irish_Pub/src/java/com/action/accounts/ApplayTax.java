/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.accounts;

import com.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author krishna
 */
public class ApplayTax extends HttpServlet {

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
            String type=request.getParameter("ch");
            String items[]=request.getParameterValues("items");
            out.println(type+" "+items[0]);
            
            String sql="update items set tax=? where id=?";
            String sql1="update items set ptax=? where id=?";
            String sql2="update items set taketax=? where id=?";
            
            String s=sql;
            if(type.equalsIgnoreCase("Dinning"))
                s=sql;
            else if(type.equalsIgnoreCase("TakeAway"))
                s=sql2;
            else if(type.equalsIgnoreCase("Parcel"))
                s=sql1;
            System.out.println("sql:"+s);
            PreparedStatement ps=DBConnection.getPrepare(s);
            for(int i=0;i<items.length;i++)
            {
                ps.setString(1,request.getParameter(items[i]));
                ps.setString(2, items[i]);
                ps.execute();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ApplayTax.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            response.sendRedirect("taxsettings.jsp");
//            out.close();
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
