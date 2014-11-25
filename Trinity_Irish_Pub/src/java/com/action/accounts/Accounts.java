/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.accounts;

import com.action.accounts.forms.Items;
import com.action.accounts.forms.Managers;
import com.action.accounts.forms.OrdersF;
import com.action.accounts.forms.Pay;
import com.action.accounts.forms.TablesForm;
import com.action.accounts.forms.TaxForm;
import com.action.accounts.forms.TreeForm;
import com.action.accounts.forms.WaitersForm;
import com.action.accounts.forms.kichenForm;
import com.util.DBConnection;
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
public class Accounts {
    static PreparedStatement ps=null;
    static ResultSet rs=null;
    private static void close(){
        try {
            if(rs!=null)
                rs.close();
            if(ps!=null)
                ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static ArrayList<TreeForm> getMenus(){
        ArrayList<TreeForm> list=new ArrayList<TreeForm>();
        ps=DBConnection.getPrepare("select m.name,i.name, i.id,mid from menus m,items i where mid=parent order by mid");
        try{
            rs=ps.executeQuery();
            String menu="";
            String mid="";
            ArrayList<Items> it=null; 
            while(rs.next()){
                String m=rs.getString(1);
                if(!menu.equalsIgnoreCase(m)){
                    System.out.println("menu:"+menu);
                    if(menu!="")
                    {
                        list.add(new TreeForm(mid,menu, it));
                    }
                    menu=m;
                    mid=rs.getString(4);
                    it=new ArrayList<Items>();
                }
                String id=rs.getString(3);
                String name=rs.getString(2);
                it.add(new Items(id, name));
                System.out.println("\t\t"+name);
            }
        }
        catch(SQLException e){}
        close();
        return list;
        
    }
    public static ArrayList<TablesForm> getTables(){
        ArrayList<TablesForm> list=new ArrayList<TablesForm>();
        try{
        PreparedStatement ps=DBConnection.getPrepare("select tid,table_name,password,assign from tables");
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
            list.add(new TablesForm(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4)));
        }
        }
        catch(SQLException e){
        
        }
        close();
        return list;
    }
    public static ArrayList<WaitersForm> getWaiters(){
        ArrayList<WaitersForm> list=new ArrayList<WaitersForm>();
        PreparedStatement ps=DBConnection.getPrepare("select * from waiteracc");
        try{
        ResultSet rs=ps.executeQuery();
        ArrayList asn;
        while(rs.next()){
            String id=rs.getString(1);
            String un=rs.getString(2);
            String pw=rs.getString(3);
            String name=rs.getString(4);
            String email=rs.getString(5);
            String ph=rs.getString(6);
            String as=rs.getString(7);
            int n=rs.getInt(8);
            String ass[]=as.split(",");
            asn=new ArrayList();
            for(int i=0;i<ass.length;i++){
                asn.add(ass[i]);
            }
            list.add(new WaitersForm(id,un,pw,name,email,ph,n,asn));
        }
        
        }catch(SQLException e){
            System.out.println("Error::"+e.getMessage());
        }
        close();
        return list;
    
    }
    public static WaitersForm getWaiter(String id){
        WaitersForm wf=null;
        PreparedStatement ps=DBConnection.getPrepare("select *from waiteracc where id=?");
        try{
        ps.setString(1, id);
        ResultSet rs=ps.executeQuery();
        if(rs.next()){
           String id1=rs.getString(1);
            String un=rs.getString(2);
            String pw=rs.getString(3);
            String name=rs.getString(4);
            String email=rs.getString(5);
            String ph=rs.getString(6);
            String as=rs.getString(7);
            int n=rs.getInt(8);
            String ass[]=as.split(",");
            ArrayList asn = new ArrayList();
            for(int i=0;i<ass.length;i++){
                asn.add(ass[i]);
            }
            wf=new WaitersForm(id,un,pw,name,email,ph,n,asn);
        }
        }catch(SQLException e){
            System.out.println("erroe::"+e.getMessage());
        }
        close();
        return wf;
    }

    static ArrayList getItems(String id) {
       ArrayList list=new ArrayList();
       try{
           ps=DBConnection.getPrepare("select id from items where parent=?");
           ps.setString(1,id);
           rs=ps.executeQuery();
           while(rs.next()){
               list.add(rs.getString(1));
           }
       }
       catch(Exception e){}
       close();
       return list;
    }
    public static ArrayList<Managers> getManagers(){
    ArrayList<Managers> list=new ArrayList<Managers>();
    try{
        ps=DBConnection.getPrepare("select *from manager");
        rs=ps.executeQuery();
        ArrayList ls=null;
        while(rs.next()){
            ls=new ArrayList();
            String id=rs.getString(1);
            String user=rs.getString(2);
            String pw=rs.getString(3);
            String name=rs.getString(4);
            String email=rs.getString(5);
            String desg=rs.getString(6);
            String phone=rs.getString(7);
            String roles=rs.getString(8);
            String rol[]=roles.split(",");
            for(int i=0;i<rol.length;i++)
                ls.add(rol[i]);
            list.add(new Managers(id, user, pw, name, email, desg, phone, ls, ls.size()));
            System.out.println("User:"+user);
        }
    }   catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        return list;
    }
    public static Managers getManager(String uid){
        Managers m=null;
        try{
        ps=DBConnection.getPrepare("select *from manager where id="+uid);
        rs=ps.executeQuery();
        ArrayList ls=null;
        while(rs.next()){
            ls=new ArrayList();
            String id=rs.getString(1);
            String user=rs.getString(2);
            String pw=rs.getString(3);
            String name=rs.getString(4);
            String email=rs.getString(5);
            String desg=rs.getString(6);
            String phone=rs.getString(7);
            String roles=rs.getString(8);
            String rol[]=roles.split(",");
            for(int i=0;i<rol.length;i++)
                ls.add(rol[i]);
            m=new Managers(id, user, pw, name, email, desg, phone, ls, ls.size());
            System.out.println("User:"+user);
        }
    }   catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
    
        return m;
        
    }
    public static String getTableName(String id){
        String name="x";
        ps=DBConnection.getPrepare("select table_name from tables where tid="+id);
        try{
            ResultSet rs=ps.executeQuery();
            if(rs.next())
                name=rs.getString(1);
        }
        catch(Exception e){
        }
        close();
        return name;
    }
    public static TablesForm getTable(String id){
    TablesForm t=null;
    ps=DBConnection.getPrepare("select *from tables where tid="+id);
        try {
            rs=ps.executeQuery();
            if(rs.next()){
                t=new TablesForm(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        close();
        return t;
    
    }
    public static ArrayList<kichenForm> getkichens(){
    ArrayList<kichenForm> list=new ArrayList<kichenForm>();
    ps=DBConnection.getPrepare("select *from kichenacc");
        try {
            rs=ps.executeQuery();
            ArrayList<String> ls=null;
            while(rs.next()){
                String id=rs.getString(1);
                String user=rs.getString(2);
                String pw=rs.getString(3);
                String name=rs.getString(4);
                String email=rs.getString(5);
                String ph=rs.getString(6);
                String items=rs.getString(7);
                String it[]=items.split(";");
                ls=new ArrayList<String>();
                for(int i=0;i<it.length;i++)
                    ls.add(it[i]);
                list.add(new kichenForm(id, user, pw, name, email, ph, items, ls, ls.size()));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        close();
        return list;
    
    }
    public static kichenForm getKichen(String id){
    kichenForm k=null;
    ps=DBConnection.getPrepare("select *from kichenacc where id="+id);
        try {
            rs=ps.executeQuery();
            ArrayList<String> ls=null;
            while(rs.next()){
            
                
                String user=rs.getString(2);
                String pw=rs.getString(3);
                String name=rs.getString(4);
                String email=rs.getString(5);
                String ph=rs.getString(6);
                String items=rs.getString(7);
                String it[]=items.split(",");
                ls=new ArrayList<String>();
                for(int i=0;i<it.length;i++)
                    ls.add(it[i]);
                k=new kichenForm(id, user, pw, name, email, ph, items, ls, ls.size());
            }
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
    return k;
    }
    public static String getItemName(String id){
        String name="";
        ps=DBConnection.getPrepare("select name from items where id="+id);
        try {
            rs=ps.executeQuery();
            if(rs.next())
                name=rs.getString(1);
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name; 
    }
    public static ArrayList<TaxForm> getTax(String name){
        ArrayList<TaxForm> list=new ArrayList<TaxForm>();
        try{
            ps=DBConnection.getPrepare("select *from tax where name=?");
            ps.setString(1, name);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                String comment=rs.getString(2);
                String type=rs.getString(3);
                String val=rs.getString(4);
                String op=rs.getString(5);
                String wit=rs.getString(6);
                String formula=rs.getString(8);
                list.add(new TaxForm(name, comment, type, val, op, wit,formula));
            }
        }
        catch(Exception e){
            System.out.println("error:"+e.getMessage());
        }
        return list;
    }
    public static ArrayList<Double> getTaxAmount(String id){
    int tax=0;
    String t="";
    ArrayList<Double> list=new ArrayList<Double>();
        ps=DBConnection.getPrepare("select tax from items where name='"+id+"'");
        try {
            rs=ps.executeQuery();
            if(rs.next())
                t=rs.getString(1);
            if(t==null){
                System.out.println("No tax is set");
                list.add(0.0);list.add(0.0);
            }
            System.out.println("TAx:"+t+" id:"+id);
            ps=DBConnection.getPrepare("select value from tax where name='"+t+"'");
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(rs.getDouble(1));
                System.out.println(rs.getDouble(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    return list;
    }
    public static ArrayList payments(){
        ArrayList<Pay> list=new ArrayList<Pay>();
        try {
            
            ps=DBConnection.getPrepare("select name,type from payment");
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(new Pay(rs.getString(1),rs.getString(2)));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public static ArrayList<String> getTypes(String type,String id){
        ArrayList list=new ArrayList<String>();
        String sql="";
        System.out.println("TYpe:"+type);
        if(type.contains("Take"))
        {
            sql="select distinct(taketax) from items,orders where name=item and tableid=?";
        }
        else if(type.equalsIgnoreCase("parcel"))
        {
            sql="select distinct(ptax) from items,orders where name=item and tableid=?";
        }
        else{
            sql="select distinct(tax) from items,orders where name=item and tableid=?";
        }
        System.out.println("sql:"+sql);
        ps=DBConnection.getPrepare(sql);
        try {
            ps.setString(1,id);
            rs=ps.executeQuery();
            while(rs.next()){
                    list.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        close();
        return list;
    }
    public static ArrayList<OrdersF> getOrders(String id,String type){
        ArrayList<OrdersF> or=new ArrayList<OrdersF>();
        String sql="";
        System.out.println("TYpe:"+type);
        if(type.contains("Take"))
        {
            sql="select taketax,sum(o.total) from orders o,items i where item=name and tableid=? group by taketax";
        }
        else if(type.equalsIgnoreCase("parcel"))
        {
            sql="select ptax,sum(o.total) from orders o,items i where item=name and tableid=? group by ptax";
        }
        else{
            sql="select tax,sum(o.total) from orders o,items i where item=name and tableid=? group by tax";
        }
        ps=DBConnection.getPrepare(sql);
        
        try {
            ps.setString(1, id);
            rs=ps.executeQuery();
            while(rs.next()){
                or.add(new OrdersF(rs.getString(1),rs.getDouble(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return or;
    
    }
    public static double getAmount(String name,String id,String type){
        double or=0;
        String sql="";
        System.out.println("--Type:"+type+"name:"+name+" id:"+id);
        if(type.contains("Take"))
        {
            sql="select sum(o.total) from orders o,items i where item=name and tableid=? and taketax=? group by taketax";
        }
        else if(type.equalsIgnoreCase("parcel"))
        {
            sql="select sum(o.total) from orders o,items i where item=name and tableid=? and patx=? group by ptax";
        }
        else{
            sql="select sum(o.total) from orders o,items i where item=name and tableid=? and tax=? group by tax";
        }
        ps=DBConnection.getPrepare(sql);
        System.out.println(sql);
        try {
            ps.setString(1, id);
            ps.setString(2, name);
            rs=ps.executeQuery();
            while(rs.next()){
               or=rs.getDouble(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return or;
    
    }
    public static String getTaxName(String type,String iid){
        String name="";
        String sql="";
        if(type.contains("Take"))
        {
            sql="select taketax from items where id=?";
        }
        else if(type.equalsIgnoreCase("parcel"))
        {
            sql="select ptax from items where id=?";
        }
        else{
            sql="select tax from items where id=?";
        }
        System.out.println("SQL:"+sql+" type"+type);
        ps=DBConnection.getPrepare(sql);
        try {
            ps.setString(1,iid);
            rs=ps.executeQuery();
            if(rs.next())
                name=rs.getString(1);
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return name;
    }

    public static String getTransTax(String id) {
        String tax="0";
        try {
            
            ps=DBConnection.getPrepare("select sum(tax) from disc where id=? group by id");
            ps.setString(1,id);
            rs=ps.executeQuery();
            if(rs.next())
                tax=rs.getString(1);
            
        } catch (SQLException ex) {
            Logger.getLogger(Accounts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tax;
    }
}
