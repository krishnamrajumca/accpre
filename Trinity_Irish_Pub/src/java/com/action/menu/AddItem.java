/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action.menu;

import com.util.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class AddItem extends HttpServlet {

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

            HttpSession session = request.getSession();
//            String id = (String) session.getAttribute("restaurant");
            String pid = (String) session.getAttribute("menu");
            System.out.println("in add items id:" + pid);
            Date date = new Date();
            String modifiedDate = new SimpleDateFormat("yyyy-MM-dd").format(date);
            String img = request.getParameter("img");;
            if (img.equals("no") || img == "no") {
                img = "noimage.jpg";
            }
            String logo = "upload/" + modifiedDate + img;
            //InputStream logo=(InputStream) session.getAttribute("logo");

            String name = request.getParameter("name");
            String desc = request.getParameter("short");
            String price = request.getParameter("price");
            String ldesc = request.getParameter("long");

            double d = Double.parseDouble(price);
            System.out.println("Name:" + name);
            System.out.println("Logo:" + logo);
            PreparedStatement ps = DBConnection.getPrepare("insert into items(name,price,sdesc,ldesc,logo,parent,status) values(?,?,?,?,?,?,1)");
            System.out.println("Name:" + name);
            System.out.println("Logo:" + logo);
            ps.setString(1, name);
            ps.setDouble(2, d);
            ps.setString(3, desc);
            ps.setString(4, ldesc);
            ps.setString(5, logo);
            ps.setString(6, pid);
            //ps.setString(7, id);
            ps.execute();
            response.sendRedirect("menu.jsp?iid=" + pid);
        } catch (Exception ex) {
            System.out.println("Error:" + ex.getMessage());
            Logger.getLogger(AddItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
