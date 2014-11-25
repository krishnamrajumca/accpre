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
public class kichenForm {
    String id,user,password,name,email,phone,items;
    ArrayList itemsList;
int num;

    public int getNum() {
        return num;
    }

    public kichenForm(String id, String user, String password, String name, String email, String phone, String items, ArrayList itemsList, int num) {
        this.id = id;
        this.user = user;
        this.password = password;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.items = items;
        this.itemsList = itemsList;
        this.num = num;
    }

    

    public String getId() {
        return id;
    }

    public String getUser() {
        return user;
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

    public String getPhone() {
        return phone;
    }

    public String getItems() {
        return items;
    }

    public ArrayList getItemsList() {
        return itemsList;
    }
    
}
