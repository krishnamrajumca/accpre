/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.action.reports.forms;

import java.util.ArrayList;

/**
 *
 * @author krishna
 */
public class ItemConsumptionForm {
    String menu;
    int total;
    ArrayList<ItemForm> list;

    public ItemConsumptionForm(String menu, int total, ArrayList<ItemForm> list) {
        this.menu = menu;
        this.total = total;
        this.list = list;
    }

    public String getMenu() {
        return menu;
    }

    public int getTotal() {
        return total;
    }

    public ArrayList<ItemForm> getList() {
        return list;
    }
    
}
