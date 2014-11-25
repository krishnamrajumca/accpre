/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import com.form.RestForm;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author softmerge
 */
public class Restaurant {
    DBConnection db;
    Connection con;
    public Restaurant(){
      db=new DBConnection();
    }
    public ArrayList<RestForm> getData(String s)
    {
        ArrayList<RestForm> list=null;
        try {
            System.out.println("In Restaurant class with id "+s);
            list=new ArrayList<RestForm>();
           
          
            con=db.getConn();
            PreparedStatement ps=con.prepareStatement("select id,name,logo,line1,phone,tables from restaurant  where name like '"+s+"%' or line1 like'"+s+"%' or zip like '"+s+"%'");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                int id=rs.getInt(1);
                String name=rs.getString(2);
                System.out.println("Name:"+name);
                //String logo=rs.getString(3);
                Blob blob = rs.getBlob(3);  
                byte[] logo = blob.getBytes(1, (int) blob.length());
                String line1=rs.getString(4);
                String mobile=rs.getString(5);
                int tables=rs.getInt(6);
                list.add(new RestForm(id,name,line1,mobile,tables,logo));
                System.out.println("id:"+id+"name: "+name);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(Restaurant.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
        return list;
    }
    }
    public RestForm getRestaurant(int id){
        RestForm rf=null;
        System.out.println("in getRestaurant");
        try{
            con=db.getConn();
            String sql="select *from restaurant where id="+id;
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                System.out.println("----");
                rf=new RestForm();
                rf.setName(rs.getString(2));
                rf.setAddress(rs.getString("line1"));
                rf.setLine2(rs.getString("line2"));
                rf.setCity(rs.getString("city"));
                rf.setZip(rs.getString("zip"));
                rf.setPhone(rs.getString("phone"));
                rf.setMail(rs.getString("email"));
                System.out.println("");
                System.out.println("M:"+rf.getName());
            }
            System.out.println("------------------");
        }
        catch(Exception e){
            System.out.println("Error:"+e.getMessage());
            e.printStackTrace();
        }
        finally{
        return rf;
        }
    }
}
