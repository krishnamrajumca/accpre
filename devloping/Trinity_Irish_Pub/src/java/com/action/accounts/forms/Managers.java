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
public class Managers {
    String id,uname,password,name,email,desg,phone;
    ArrayList roles;
    int num;

    public Managers(String id,String uname, String password, String name, String email, String desg, String phone, ArrayList roles, int num) {
        this.uname = uname;
        this.password = password;
        this.name = name;
        this.email = email;
        this.desg = desg;
        this.phone = phone;
        this.roles = roles;
        this.num = num;
        this.id = id;
    }

    public String getId() {
        return id;
    }
    
    public String getUname() {
        return uname;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getDesg() {
        return desg;
    }

    public String getPhone() {
        return phone;
    }

    public ArrayList getRoles() {
        return roles;
    }

    public int getNum() {
        return num;
    }
    
    
    
}
