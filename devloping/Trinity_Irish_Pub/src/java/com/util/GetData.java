/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author krishna
 */
public class GetData {
    ArrayList<menus> glist=new ArrayList<menus>();
    DBConnection db;
    Connection con;
    PreparedStatement ps,p;
    ResultSet rs,r;
    int rid;
    menus menu;
    public GetData(){
        db =new DBConnection();
        con=db.getConn();
        //rid=rd;
    }
    public ArrayList<menus>getData(int id){
        ArrayList list;
        list=getDataList(id);
        Iterator itr=list.iterator();
        while(itr.hasNext()){
        menus m=(menus)itr.next();
        int pid=m.getId();
        
           // System.out.println("ids:"+pid+" "+"parent:"+m.getPid());
            glist.add(m);
            list=getData(pid);
        }
    return glist;
    }
 public ArrayList getDataList(int id){
     ArrayList list=new ArrayList();
        try {
            
            System.out.println("ref:"+id+" restid: "+rid);
            ps=con.prepareStatement("select mid,name,refid from menus where refid="+id+"  order by orderr");
            rs=ps.executeQuery();
            int mid=0,pid=0,level=0;
            String name="";
            while(rs.next()){
            mid=rs.getInt(1);
            name=rs.getString(2);
            pid=rs.getInt(3);
           
            int child=0;
            if(hasChild(mid)){
                child=1;
                //System.out.println(mid+" had child");
            }
               // System.out.println(child);
           menu=new menus(mid,pid,level,name,child);
                //System.out.println(id+" "+mid);
           list.add(menu);
            }
             
        } catch (Exception ex) {
            Logger.getLogger(GetData.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        finally{
        return list;
        }
}
    public static void main(String[] args) {
        int rid=1;
    ArrayList list;
    GetData g=new GetData();
    list=g.getData(0);
    Iterator itr=list.iterator();
    while(itr.hasNext()){
        menus m=(menus)itr.next();
        int id=m.getId();
        System.out.println(id);
    }
    }

    private boolean hasChild(int mid) {
         boolean flag=false;
        try {
           
            p=con.prepareStatement("select count(*) from items where parent="+mid);
            r=p.executeQuery();
            int cnt=0;
            if(r.next())
                cnt=r.getInt(1);
            if(cnt!=0)
                flag=true;
        } catch (SQLException ex) {
            Logger.getLogger(GetData.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{ return flag;}
    }
}
