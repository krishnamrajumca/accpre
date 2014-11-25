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
public class CreateTax extends HttpServlet {

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
        int l=0;
        try {
            String tax=request.getParameter("tax");
            String com=request.getParameter("tax");
            String formula=request.getParameter("formula");
//            String nam=request.getParameter("name");
//            String va=request.getParameter("val");
//            String o=request.getParameter("op");
//            String wi=request.getParameter("wit");
//            
//            String name1=request.getParameter("name1");
//            String val1=request.getParameter("val1");
//            String op1=request.getParameter("op1");
//            String wit1=request.getParameter("wit1");
            String name[]=request.getParameterValues("name");
            String val[]=request.getParameterValues("val");
            String op[]=request.getParameterValues("op");
            String wit[]=request.getParameterValues("wit");
           l=name.length;
            System.out.println("name:"+name.length+" val:"+val.length);
            PreparedStatement ps=DBConnection.getPrepare("insert into tax(name,comment,taxtype,value,op,wit,formula) values(?,?,?,?,?,?,?)");
            for(int i=0;i<name.length;i++){
                ps.setString(1, tax);
                ps.setString(2,com);
                ps.setString(3,name[i]);
                ps.setString(4,val[i]);
                ps.setString(5,op[i]);
                ps.setString(6, wit[i]);
                ps.setString(7,formula);
                ps.execute();
            }
        } catch (SQLException ex) {
            Logger.getLogger(CreateTax.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
//            out.close();
            response.sendRedirect("taxsettings.jsp");
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
