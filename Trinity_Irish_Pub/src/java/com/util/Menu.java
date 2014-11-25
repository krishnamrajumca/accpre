/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import com.form.MenuForm;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Raasta Films
 */
public class Menu {

    DBConnection db;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public Menu() {
        db = new DBConnection();
        con = db.getConn();
    }

    public ArrayList getMenus(String id) {
        ArrayList list = new ArrayList();
        try {

            ps = con.prepareStatement("select distinct menu from menu where rid=" + id+" order by mid");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }

        } catch (SQLException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return list;
        }

    }

    public ArrayList getSubMenus(String menu,String rid) {
        ArrayList list = new ArrayList();
        try {
            //System.out.println("Menu:" + menu);
            ps = con.prepareStatement("select distinct sub_menu from menu where menu='" + menu + "' and rid="+rid+" and sub_menu is not null order by subid");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return list;
        }
    }

    public ArrayList getItemMenus(String menu,String rid) {
        ArrayList list = new ArrayList();
        try {
            //System.out.println("Menu:" + menu);
            ps = con.prepareStatement("select distinct item_menu from menu where sub_menu='" + menu + "' and rid="+rid+" and item_menu is not null order by itemid");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return list;
        }
    }
}
