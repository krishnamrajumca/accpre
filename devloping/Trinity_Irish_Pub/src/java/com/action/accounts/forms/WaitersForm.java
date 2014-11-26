/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.accounts.forms;

import java.util.ArrayList;

/**
 *
 * @author krishna
 */
public class WaitersForm {
    String id,uname,name,password,email,phone;
    int noOfTables;
    ArrayList tables;

    public WaitersForm(String id,String uname, String password, String name, String email, String phone, int noOfTables, ArrayList tables) {
        this.uname = uname;
        this.name = name;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.noOfTables = noOfTables;
        this.tables = tables;
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public String getUname() {
        return uname;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public int getNoOfTables() {
        return noOfTables;
    }

    public ArrayList getTables() {
        return tables;
    }
    
}
