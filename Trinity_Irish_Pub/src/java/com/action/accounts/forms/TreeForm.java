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
public class TreeForm {
    String mid,menu;
    ArrayList<Items> list;

    public TreeForm(String mid,String menu, ArrayList<Items> list) {
        this.menu = menu;
        this.list = list;
        this.mid=mid;
    }

    public String getMenu() {
        return menu;
    }

    public ArrayList<Items> getList() {
        return list;
    }

    public String getMid() {
        return mid;
    }
    
}
