/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.reports;

import com.util.DBConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author krishna
 */
public class Sectionwise {
    public static void main(String[] args) {
        String d1="2013-12-22",d2="2013-12-25";
        printReport(d1,d2);
    }

    private static void printReport(String d1, String d2) {
        try {
            PreparedStatement ps=DBConnection.getPrepare("select m.name,sum(tprice) amount from items i,trans tr,menus m,transactions t where i.name=iname and mid=parent and tr.trasid in(select id from transactions where tdate between ? and ?) group by parent");
            ps.setString(1, d1);
            ps.setString(2, d2);
            double t=0.00;
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
               t+=rs.getInt(2);
            }
            System.out.println("Total:"+t);
            
            while(rs.previous()){
                System.out.println(rs.getString(1)+":"+rs.getString(2)+"\t:"+(rs.getInt(2)/t));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Sectionwise.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
