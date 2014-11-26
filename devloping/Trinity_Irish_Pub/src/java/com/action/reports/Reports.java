/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.reports;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author krishna
 */
public class Reports extends HttpServlet {

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
            
            String from=request.getParameter("from");
            String to=request.getParameter("to");
            String bill=request.getParameter("bill");
            String manager=request.getParameter("manager");
            String gross=request.getParameter("gross");
            String item=request.getParameter("item");
            String modified=request.getParameter("modified");
            String type=request.getParameter("type");
            String path="d:/reports/generated/";
            Copy c=new Copy();
            if(bill!=null){
                if(type.equalsIgnoreCase("excel")){
                String file=c.copyFile("Bill Register.xlsx");
                System.out.println("Bill File:");
                BillRegister.createExcel(from, to, file);
                }
                else if(type.equalsIgnoreCase("doc")){
                    BillRegister.createDoc(from, to, path+"Bill_register.doc");
                }
                else
                    BillRegister.createNote(from, to, path+"Bill_Register.txt");
             }
            if(manager!=null){
                System.out.println("Manager");
                if(type.equalsIgnoreCase("excel")){
                String file=c.copyFile("Manager Report.xlsx");
                System.out.println("Manager Report File:"+file);
                ManagerReport.createExcel(from, to, file);
                }
                else if(type.equalsIgnoreCase("doc")){
                    ManagerReport.createDoc(from, to, path+"ManagerReport.doc");
                }
                else{
                    ManagerReport.createNote(from, to, path+"ManagerReport.txt");
                }
            }
            if(gross!=null){
                if(type.equalsIgnoreCase("excel")){
                String file=c.copyFile("Gross Sales summary.xlsx");
                System.out.println("Gross Sale File:"+file);
                GrossSale.createExcel(from, to, file);
                }
                else if(type.equalsIgnoreCase("doc")){
                    GrossSale.createDoc(from, to, path+"Gross_sale_summery.doc");
                }
                else
                    GrossSale.createNote(from, to, path+"Gross_sale_summery.txt");
            }
            if(modified!=null){
                if(type.equalsIgnoreCase("excel")){
            String file=c.copyFile("Modified Bills.xlsx");
            System.out.println("Modified File:"+file);
            
            ModifiedBill.setModified(from,to,file);
                }
                else if(type.equalsIgnoreCase("doc")){
                    ModifiedBill.createDoc(from, to, path+"Modified_bill.doc");
                }
                else
                    ModifiedBill.createNote(from, to, path+"Modified_Bill.txt");
            }
            if(item!=null){
                if(type.equalsIgnoreCase("excel")){
                String file=c.copyFile("Item Consumption.xlsx");
                System.out.println("Item consumption :"+file);
                ItemConsumption.set(from,to,file);
                }
                else if(type.equalsIgnoreCase("doc"))
                    ItemConsumption.setDoc(from, to, path+"itemconsumption.doc");
                else if(type.equalsIgnoreCase("note"))
                    ItemConsumption.createNotePad(from, to, path+"item_consumption.txt");
            }
           response.sendRedirect("Reports.jsp");
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
