/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.manager;

import com.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class FinishTransaction extends HttpServlet {

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
            String oth="";
            String discount=request.getParameter("desc");
            String type="cash";
            String total=request.getParameter("total");
            String id=request.getParameter("id");
            String taxes=request.getParameter("taxes");
            PreparedStatement ps=DBConnection.getPrepare("select name from payment");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                String name=rs.getString(1);
                String am=request.getParameter(name);
                if(!am.equalsIgnoreCase(""))
                oth+=name+"-"+am+";";
            }
            GetItemsOnTable g=new GetItemsOnTable();
                   ArrayList items=g.getItems(id);
            out.println(discount+" "+type+" "+total);
            out.println(id);
            out.println(items);
ps=DBConnection.getPrepare("insert into transactions(id,type,amount,tdate,discount,other) values(?,?,?,now(),?,?)");
long dat=new Date().getTime();
ps.setString(1,dat+"");
ps.setString(2,type);
ps.setString(3,total);
ps.setString(4,discount);
ps.setString(5,oth);
//ps.setString(6,taxes);
ps.execute();
ps=DBConnection.getPrepare("insert into trans values(?,?,?,?,?)");
PreparedStatement p=DBConnection.getPrepare("select price,quantity,total,item from orders where tableid="+id);
 rs=p.executeQuery();
while(rs.next()){
ps.setString(1,rs.getString(1));
ps.setString(2,rs.getString(2));
ps.setString(3,rs.getString(3));
ps.setString(4,rs.getString(4));
ps.setString(5, dat+"");
ps.execute();
}
p=DBConnection.getPrepare("delete from orders where tableid="+id);
p.execute();
p=DBConnection.getPrepare("delete from discounts where tableid="+id);
p.execute();

p=DBConnection.getPrepare("select distinct(name) from tax");
rs=p.executeQuery();
ps=DBConnection.getPrepare("insert into disc values(?,?,?,?,?)");
while(rs.next()){
    String name=rs.getString(1);
    String nm=request.getParameter(name);
    String tx=request.getParameter("t"+name);
    String nn=request.getParameter("n"+name);
    String am=request.getParameter("a"+name);
    if(tx!=null){
    ps.setString(1,dat+"");
    ps.setString(2,nn);
    ps.setString(3,nm);
    ps.setString(4,tx);
    ps.setString(5,am);
    ps.execute();
    }
    System.out.println("Name:"+nn+"\ttaxe:"+tx+"\tdis:"+nm+"\tamount:"+am);
}
HttpSession session=request.getSession();
session.removeAttribute("activeid");
response.sendRedirect("BillDesk.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(FinishTransaction.class.getName()).log(Level.SEVERE, null, ex);
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
