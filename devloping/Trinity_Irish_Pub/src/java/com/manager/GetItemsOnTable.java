/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.manager;

import com.manager.Forms.TableItems;
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
public class GetItemsOnTable {
    public ArrayList<TableItems> getItems(String id){
       ArrayList<TableItems> list=new ArrayList<TableItems>();
        try {
            System.out.println("in getItems Class");
            
            PreparedStatement ps=DBConnection.getPrepare("select id,item,price,quantity,total from orders where status=0 and tableid="+id);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
            list.add(new TableItems(rs.getString(1),rs.getString(2),rs.getString(4),rs.getDouble(3),rs.getDouble(5)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(GetItemsOnTable.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        finally{
        return list;
        }
}
}
