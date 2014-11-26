/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action;

import com.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
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
public class WaiterLogin extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String user=request.getParameter("user");
            String pw=request.getParameter("password");
            PreparedStatement ps=DBConnection.getPrepare("select asn from waiteracc where uname=? and pw=?");
            ps.setString(1,user);
            ps.setString(2,pw);
            ResultSet rs=ps.executeQuery();
            String asn="";
            if(rs.next()){
                asn=rs.getString(1);
            }
            String tabs[]=asn.split(",");
            JSONObject json      = new JSONObject();
            JSONArray data=new JSONArray();
            for(int i=0;i<tabs.length;i++)
                data.add(tabs[i]);
            json.put("tables", data);
            
    response.setContentType("application/json");
    response.getWriter().write(json.toString());
        } catch (SQLException ex) {
            Logger.getLogger(WaiterLogin.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
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
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
