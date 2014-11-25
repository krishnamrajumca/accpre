/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author krishna
 */
public class DBConnection {
    // System.out.println("MySQL Connect Example.");
static Connection conn = null;
    public  static void getConn1() {
        

        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "restaurant2";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "root";
        try {
            if(conn==null){
            Class.forName(driver);
            conn = DriverManager.getConnection(url + dbName, userName, password);
        }
            
            //conn.close();
            //System.out.println("Disconnected from database");
        } catch (Exception e) {
            System.out.println("Not Connected to Database");
            e.printStackTrace();
        }
        finally{
        
        }
        
    }
    public Connection getConn(){
        getConn1();
        return conn;
        }
    public static PreparedStatement  getPrepare(String sql){
    PreparedStatement ps=null;
        //System.out.println("------------------------------------------");
        try {
        
        getConn1();
        ps=conn.prepareStatement(sql);
        
    } catch (SQLException ex) {
        Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
    }
    finally{
    return ps;
    }
    }
}
