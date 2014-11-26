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
public class CreateManager extends HttpServlet {

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
        String msg="Account Not created";
        try {
            String uname=request.getParameter("username");
            String pw=request.getParameter("pw");
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String des=request.getParameter("des");
            String ph=request.getParameter("ph");
            String roles[]=request.getParameterValues("ch");
            String as="";
            if(roles!=null)
            {
                for(int i=0;i<roles.length;i++)
                    as+=roles[i]+",";
            }  
            PreparedStatement ps=DBConnection.getPrepare("insert into manager(uname,password,name,email,desg,phone,roles) values(?,?,?,?,?,?,?)");
            ps.setString(1, uname);
            ps.setString(2, pw);
            ps.setString(3, name);
            ps.setString(4, email);
            ps.setString(5, des);
            ps.setString(6, ph);
            ps.setString(7, as);
            ps.execute();
            msg="Account has been created successfully";
        } catch (SQLException ex) {
            Logger.getLogger(CreateManager.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            response.sendRedirect("Accounts.jsp?msg="+msg);
            //out.close();
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
