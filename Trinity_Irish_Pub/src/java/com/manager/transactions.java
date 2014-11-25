/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.manager;


import com.action.accounts.Accounts;
import com.manager.Forms.TransactionForm;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author krishna
 */
public class transactions extends HttpServlet {

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
        ArrayList<TransactionForm> list=new ArrayList<TransactionForm>();
        try {
            String from =request.getParameter("from");
            String to =request.getParameter("to");
            String txn =request.getParameter("txn");
            System.out.println("in transactions");
            
            String sql="select *from transactions where tdate between '"+from+"' and '"+to+"' and type in('"+txn+"'')";
            if(from==null && to==null)
            sql="select *from transactions order by id desc";
            else if(from=="" && to=="")
            sql="select *from transactions order by id desc";
            else{
            
           sql= "select *from transactions where tdate between '"+from+"' and '"+to+"' order by id desc";
            System.out.println("--------------"+txn);
                System.out.println(sql);
            }
            
            PreparedStatement ps=DBConnection.getPrepare(sql);
            System.out.println("Transactions: "+sql);
            //ps.setString(1, txn);
            ResultSet rs=ps.executeQuery();
            String id="",amount="",t="",date="";
            while(rs.next()){
                id=rs.getString(1);
                t=rs.getString(6);
                amount=rs.getString(3);
                date=rs.getString(4);
                String discount=rs.getString(5);
                String tax=Accounts.getTransTax(id);
                list.add(new TransactionForm(id,t,amount,date,discount,tax));
            }
            HttpSession sn=request.getSession();
            sn.setAttribute("trans",list);
            response.sendRedirect("TransactionDisplay.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(transactions.class.getName()).log(Level.SEVERE, null, ex);
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
