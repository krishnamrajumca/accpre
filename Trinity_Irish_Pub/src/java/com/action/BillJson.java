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
public class BillJson extends HttpServlet {

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
           String per = getServletContext().getInitParameter("tax");
           String vat = getServletContext().getInitParameter("vat");
           String charge = getServletContext().getInitParameter("charge");
JSONObject json      = new JSONObject();
JSONArray arr=new JSONArray();
JSONObject js=new JSONObject();
JSONObject js1=new JSONObject();
    DBConnection db=new DBConnection();
    Connection con=db.getConn();
           String id=request.getParameter("id");
                PreparedStatement ps=con.prepareStatement("select *from orders where tableid="+id);
                ResultSet rs=ps.executeQuery();
                double total=0;
                while(rs.next()){
                js.put("item",rs.getString(2));
                js.put("quantity",rs.getString(3));
                js.put("price", rs.getString(4));
                arr.add(js);
                total+=rs.getDouble(5);
                }
                double discount=0;
                ps=con.prepareStatement("select discount from discounts where tableid="+id);
                rs=ps.executeQuery();
                if(rs.next()){
                discount=rs.getDouble(1);
                }
                double ptax=Double.parseDouble(per);
                int tax=(int) ((total*ptax)/100);
                ptax=Double.parseDouble(vat);
                int ivat=(int) ((total*ptax)/100);
                ptax=Double.parseDouble(charge);
                int icharge=(int) ((total*ptax)/100);
                tax=tax+ivat+icharge;
                js1.put("items", arr);
                js1.put("subtotal",total);
                js1.put("tax", tax);
                js1.put("discount",discount);
                js1.put("total", total+tax-discount);
           json.put("data", js1);
           response.setContentType("application/json");
    response.getWriter().write(json.toString());
        } catch (SQLException ex) {
            Logger.getLogger(BillJson.class.getName()).log(Level.SEVERE, null, ex);
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
