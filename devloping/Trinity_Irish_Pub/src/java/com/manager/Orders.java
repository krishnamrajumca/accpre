/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.manager;

import com.manager.Forms.ActionForm;
import com.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author krishna
 */
public class Orders {
    Connection con;
    PreparedStatement ps;
    ArrayList<ActionForm> list;
    public ArrayList<ActionForm> getData(String id) throws SQLException{

        list=new ArrayList<ActionForm>();
        ps=DBConnection.getPrepare("select item,quantity,status,action,waction from orders where tableid="+id);
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
        list.add(new ActionForm(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)));
        }
        return list;
    
    }
    public int getNotification(){
       int cnt=0;
        try {
            
            PreparedStatement ps=DBConnection.getPrepare("select count(distinct(tableid)) from orders where checkout=1");
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                cnt=rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Orders.class.getName()).log(Level.SEVERE, null, ex);
            cnt=0;
        }
    finally{
        return cnt;
        }
    }
    public ArrayList getCheckedOut(){
        ArrayList list=new ArrayList();
    try{
    PreparedStatement ps=DBConnection.getPrepare("select distinct(tableid) from orders where checkout=1");
    ResultSet rs=ps.executeQuery();
    while(rs.next()){
    list.add(rs.getString(1));
    }
    }
        catch(Exception e){}
        finally{
        return list;
        }
    }
}
