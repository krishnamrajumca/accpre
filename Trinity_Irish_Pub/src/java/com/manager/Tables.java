/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.manager;

import com.manager.Forms.TableForm;
import com.util.DBConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author krishna
 */
public class Tables {
public ArrayList<TableForm> getTables(String type){
ArrayList<TableForm> list=new ArrayList<TableForm>();

try{
PreparedStatement ps=DBConnection.getPrepare("select tid from tables where assign='"+type+"'");
PreparedStatement ps1=DBConnection.getPrepare("select count(*) from orders where tableid=?");
ResultSet rs=ps.executeQuery();

while(rs.next()){
    String id=rs.getString(1);
    ps1.setString(1,id);
    ResultSet r=ps1.executeQuery();
    int cnt=0;
    if(r.next())
        if(r.getInt(1)>0)
        cnt=1;
    
list.add(new TableForm(id,cnt));
}
}catch(Exception e){
    System.out.println("------------------------------------------------");
    e.printStackTrace();
}
finally{
    return list;
}
    
}
    public ArrayList<TableForm> getTables(){
ArrayList<TableForm> list=new ArrayList<TableForm>();

try{
PreparedStatement ps=DBConnection.getPrepare("select tid from tables");
PreparedStatement ps1=DBConnection.getPrepare("select count(*) from orders where tableid=?");
ResultSet rs=ps.executeQuery();

while(rs.next()){
    String id=rs.getString(1);
    ps1.setString(1,id);
    ResultSet r=ps1.executeQuery();
    int cnt=0;
    if(r.next())
        if(r.getInt(1)>0)
        cnt=1;
    
list.add(new TableForm(id,cnt));
}
}catch(Exception e){
    System.out.println("------------------------------------------------");
    e.printStackTrace();
}
finally{
    return list;
}
    
}

}
