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
import java.util.ArrayList;
import java.util.Iterator;
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
public class EditKichen extends HttpServlet {

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
        String msg="Account Not Created";
        try {
            String user=request.getParameter("username");
            String pw=request.getParameter("pw");
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String ph=request.getParameter("pno");
            String menus[]=request.getParameterValues("menu");
            String items[]=request.getParameterValues("items");
            ArrayList list=new ArrayList();
            ArrayList ls=null;
            Iterator it;
            if(menus!=null){
                for(int i=0;i<menus.length;i++){
                    ls=Accounts.getItems(menus[i]);
                    it=ls.iterator();
                    while(it.hasNext()){
                        String n=(String)it.next();
                        list.add(n);
                    }
                }
            }
            Iterator itr;
            if(items!=null){
                for(int i=0;i<items.length;i++){
                    itr=list.iterator();
                    boolean flag=true;
                    while(itr.hasNext()){
                        String n=(String)itr.next();
                        if(items[i].equals(n))
                            flag=false;
                    }
                    if(flag)
                    list.add(items[i]);
                }
            }
            itr=list.iterator();
            String item="";
            while(itr.hasNext()){
            item+=(String)itr.next()+",";
            }
            
            String id=request.getParameter("id");
            PreparedStatement ps=DBConnection.getPrepare("update KichenAcc set user=?,pw=?,name=?,email=?,ph=?,items=? where id="+id);
            
                ps.setString(1,user);
                ps.setString(2, pw);
                ps.setString(3,name);
                ps.setString(4,email);
                ps.setString(5,ph);
                ps.setString(6,item);
                ps.execute();
                msg="Account has been created";
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(CreateKitchen.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            response.sendRedirect("kichenacc.jsp?msg="+msg);
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
