/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.util;

import com.form.RestForm1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class Rest {
    DBConnection db ;
    Connection con ;
    PreparedStatement ps;
    ResultSet rs;
    public Rest(){
        db=new DBConnection();
        con= db.getConn();
    }
public ArrayList<RestForm1> getData(int ref,String rid )
    {
    ArrayList list = null;
        try {
           // System.out.println("in rest class------------");
            
            
            ps = con.prepareStatement("select *from menus where refid=" + ref+" and rid="+rid);
            rs=ps.executeQuery();
            list=new ArrayList<RestForm1>();
            
            while(rs.next())
            {
                int mid=rs.getInt("mid");
                int level=rs.getInt("level");
                String name=rs.getString("name");
                list.add(new RestForm1(rid,mid,ref,level,name));
               // System.out.println("Rid:"+rid+" mid: "+mid+"\tref: "+ref+"\tlevel: "+level+"\t name: "+name);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(Rest.class.getName()).log(Level.SEVERE, null, ex);
        }
    finally{
        return list;
    }
    }
public boolean hasChild(int ref,String rid){
    boolean flag = false;
        try {
            int i=0;
            ps = con.prepareStatement("select count(*) from menus where refid=" + ref + " and rid=" + rid);
            rs=ps.executeQuery();
            if(rs.next())
                i=rs.getInt(1);
            if(i>0)
                flag=true;
            return flag;
        } catch (SQLException ex) {
            Logger.getLogger(Rest.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            return flag;
        }
}
}
